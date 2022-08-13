import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_design2/detail_screen.dart';
import 'package:project_design2/getx/card_statement.dart';
import 'package:project_design2/item_model.dart';

class ItemWidget extends StatefulWidget {
  ItemWidget({required this.item, Key? key}) : super(key: key);
  Item item;

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  final CardProductController productController =
      Get.put(CardProductController());
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(
                item: widget.item,
              ),
            ));
      },
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.all(8),
            height: 200,
            width: 200,
            decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(widget.item.imageUrl))),
          ),
          Positioned(
            top: 15,
            right: 20,
            child: Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                  color: Colors.blue, shape: BoxShape.circle),
              child: Center(
                  child: IconButton(
                onPressed: () {
                  setState(() {
                    if (widget.item.favorite) {
                      widget.item.favorite = false;
                    } else {
                      widget.item.favorite = true;
                    }
                  });
                },
                icon: Icon(
                  Icons.favorite,
                  color:
                      widget.item.favorite == true ? Colors.red : Colors.white,
                ),
              )),
            ),
          ),
          Positioned(
              bottom: 10,
              left: 20,
              child: Text(
                widget.item.name,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              )),
          Positioned(
              bottom: 1,
              right: 2,
              child: IconButton(
                icon: const Icon(
                  Icons.shopping_cart,
                  color: Color.fromARGB(255, 155, 90, 106),
                  size: 30,
                ),
                onPressed: () async {
                  await productController.addCard(widget.item);
                },
              ))
        ],
      ),
    );
  }
}
