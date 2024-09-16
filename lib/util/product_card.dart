import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String discount;
  final String imagepath;
  final String name;
  const ProductCard(
      {super.key,
      required this.discount,
      required this.imagepath,
      required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          //discount
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 90, bottom: 0),
                child: Container(
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 34, 207, 40),
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        discount,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    )),
              ),
            ],
          ),
          //image
          Image.asset(
            imagepath,
            height: 400,
          ),
          const SizedBox(
            height: 80,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 22),
                child: Text("₹"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  name,
                  style: const TextStyle(fontSize: 22),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
