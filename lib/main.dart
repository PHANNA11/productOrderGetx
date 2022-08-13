import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:project_design2/drawers_widget.dart';
import 'package:project_design2/getx/card_statement.dart';
import 'package:project_design2/item_model.dart';
import 'package:project_design2/item_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Category'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController searchController = TextEditingController();
  final CardProductController controller = Get.put(CardProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SafeArea(
        child: Drawer(
          child: DrawerWidget(),
        ),
      ),
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        actions: [
          Badge(
            badgeContent: Center(
              child: GetBuilder<CardProductController>(
                  builder: (_) => Text(controller.list.length.toString())),
            ),
            position: const BadgePosition(
              top: 10,
              end: 2,
            ),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.shopping_cart_rounded)),
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              height: 50,
              width: double.infinity,
              child: TextFormField(
                controller: searchController,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'search for restaurants or foods',
                    border: OutlineInputBorder()),
                onChanged: (value) {
                  setState(() {
                    filterList = list
                        .where((element) =>
                            element.name.toLowerCase().contains(value))
                        .toList();
                  });
                },
              ),
            ),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.palette_outlined)),
                  const Text(
                    'Foods & Drink',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.grid_4x4))
                ],
              ),
            ),
            Container(
                height: 600,
                width: double.infinity,
                //color: Colors.blue,
                child: GridView.count(
                  crossAxisSpacing: 3,
                  mainAxisSpacing: 3,
                  crossAxisCount: 2,
                  children: List.generate(
                      searchController.text == null ||
                              searchController.text.isEmpty
                          ? list.length
                          : filterList.length, (index) {
                    var items = searchController.text == null ||
                            searchController.text.isEmpty
                        ? list[index]
                        : filterList[index];
                    return ItemWidget(item: items);
                  }),
                )),
          ],
        ),
      ),
    );
  }
}

List<Item> filterList = [];

List<Item> list = [
  Item(
    name: 'food',
    qty: 1,
    price: 3.5,
    description: 'Fast food ........',
    favorite: true,
    imageUrl:
        'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?cs=srgb&dl=pexels-ella-olsson-1640777.jpg&fm=jpg',
  ),
  Item(
      name: 'Berger1',
      qty: 1,
      price: 7.5,
      description:
          'https://img.freepik.com/premium-photo/big-hamburger-with-double-beef-f',
      favorite: true,
      imageUrl:
          'https://img.freepik.com/premium-photo/big-hamburger-with-double-beef-french-fries_252907-8.jpg?w=2000'),
  Item(
    name: 'Berger2',
    qty: 1,
    price: 8,
    description: 'fast food ',
    favorite: false,
    imageUrl:
        'https://st.depositphotos.com/1005682/2476/i/450/depositphotos_24762569-stock-photo-fast-food-hamburger-hot-dog.jpg',
  ),
  Item(
    description: 'https://media.istockphoto.com/photos/cheesy-p',
    qty: 1,
    price: 25,
    name: 'Pizza',
    favorite: false,
    imageUrl:
        'https://media.istockphoto.com/photos/cheesy-pepperoni-pizza-picture-id938742222?k=20&m=938742222&s=612x612&w=0&h=X5AlEERlt4h86X7U7vlGz3bDaDDGQl4C3MuU99u2ZwQ=',
  ),
  Item(
      name: 'Cake',
      qty: 1,
      price: 10,
      description: 'https://img.delicious.com.au/XxqtdvT',
      favorite: false,
      imageUrl:
          'https://img.delicious.com.au/XxqtdvTg/del/2019/11/raspberry-and-gingerbread-ice-cream-cake-120081-2.jpg'),
  Item(
      name: 'Hot Cupertino',
      description: 'drinking',
      qty: 1,
      price: 3,
      favorite: false,
      imageUrl:
          'https://unisa.edu.au/siteassets/media-centre/images/heart-coffee---shutterstock_512503885_web.jpg'),
  Item(
      name: 'Ice Latte',
      qty: 1,
      price: 3,
      description: 'https://www.lacantina.ae/wp-content/upl',
      favorite: false,
      imageUrl:
          'https://www.lacantina.ae/wp-content/uploads/2019/01/ICED-LATTE.jpg')
];
