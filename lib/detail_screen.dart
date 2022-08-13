import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_design2/item_model.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({required this.item, Key? key}) : super(key: key);
  Item item;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  TextEditingController controller = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.text = widget.item.description;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.item.name,
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  //margin: const EdgeInsets.all(8),
                  height: 300,
                  width: double.infinity,
                  child: Image(
                      fit: BoxFit.cover,
                      image: NetworkImage(widget.item.imageUrl)),
                ),
                Positioned(
                  bottom: 30,
                  child: Container(
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Text(
                        'price : ${widget.item.price}\$',
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextField(
                  enabled: false,
                  controller: controller,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                  maxLines: 5,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    backgroundColor: Colors.blue[50],
                    foregroundColor: Colors.black,
                    heroTag: '-',
                    onPressed: () {
                      setState(() {
                        if (widget.item.qty <= 0) {
                          widget.item.qty = 0;
                        } else {
                          widget.item.qty--;
                        }
                      });
                    },
                    child: const Icon(Icons.remove),
                  ),
                  FloatingActionButton(
                    backgroundColor: Colors.blue[50],
                    foregroundColor: Colors.black,
                    onPressed: null,
                    child: Text(
                      widget.item.qty.toString(),
                      style: const TextStyle(fontSize: 24),
                    ),
                  ),
                  FloatingActionButton(
                    backgroundColor: Colors.blue[50],
                    foregroundColor: Colors.black,
                    heroTag: '+',
                    onPressed: () {
                      setState(() {
                        widget.item.qty++;
                      });
                    },
                    child: const Icon(Icons.add),
                  )
                ],
              ),
            ],
          )),
        ],
      ),
      floatingActionButton: CupertinoButton(
        color: Colors.blue,
        onPressed: () {},
        child: const Text('Buy now'),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              //  margin: const EdgeInsets.all(5),
              height: 50,
              color: Colors.blue[100],
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
                    size: 30,
                    color: widget.item.favorite == true
                        ? Colors.red
                        : Colors.white,
                  )),
            ),
          ),
          Expanded(
              flex: 3,
              child: Container(
                height: 50,
                color: Colors.blueGrey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.shopping_cart),
                    Text(
                      ' Add to Card',
                      style: TextStyle(fontSize: 25),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
