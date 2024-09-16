import 'package:dealsdray/constant.dart';
import 'package:dealsdray/util/gradient_card.dart';
import 'package:dealsdray/util/icon_button.dart';
import 'package:dealsdray/util/product_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        foregroundColor: Colors.white,
        backgroundColor: Colors.red,
        label: const Text(
          "Chat",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        onPressed: () {},
        icon: const Icon(Icons.chat_bubble_rounded),
      ),
      bottomNavigationBar: mybottombar,
      appBar: myAppbar,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Gradient card
            SizedBox(
              height: 350,
              width: double.infinity,
              child: PageView(
                scrollDirection: Axis.horizontal,
                children: const [
                  GradientCard(
                    title: 'Redmi Note 7S',
                    subtitle: '48MP for everyone',
                    units: '20M',
                    description: 'of Redmi Note 7 series sold globally',
                    source: 'Source: Xleons De Centre, August 17, 2019',
                    price: 'From ₹9,999',
                    imagePath: 'assets/mob5.jpg',
                  ),
                  GradientCard(
                    title: 'Redmi Note 7S',
                    subtitle: '48MP for everyone',
                    units: '20M',
                    description: 'of Redmi Note 7 series sold globally',
                    source: 'Source: Xleons De Centre, August 17, 2019',
                    price: 'From ₹9,999',
                    imagePath: 'assets/mob5.jpg',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            // Normal card
            kyccard,
            const SizedBox(
              height: 20,
            ),

            // 4 icon button
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Mobile
                MyIconButton(
                    buttontext: "Mobile",
                    color: Color.fromARGB(255, 19, 132, 224),
                    iconimagepath: "assets/cell-phone.png"),
                // Laptop
                MyIconButton(
                    buttontext: "Laptop",
                    color: Color.fromARGB(212, 6, 153, 23),
                    iconimagepath: "assets/laptop.png"),

                // Camera
                MyIconButton(
                    buttontext: "Camera",
                    color: Color.fromARGB(255, 243, 60, 179),
                    iconimagepath: "assets/photo-camera.png"),

                // LED
                MyIconButton(
                    buttontext: "LED",
                    color: Color.fromARGB(255, 249, 192, 20),
                    iconimagepath: "assets/led-light.png"),
              ],
            ),
            const SizedBox(
              height: 25,
            ),

            // Listview horizontal
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: const BoxDecoration(color: Colors.blue),
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header text and arrow icon
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "EXCLUSIVE FOR YOU",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          size: 50,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    // Horizontal ListView for scrolling products
                    SizedBox(
                      height: 600, // Adjust the height as needed
                      child: ListView(
                        key: const PageStorageKey<String>('product-list'),
                        scrollDirection: Axis.horizontal,
                        children: const [
                          ProductCard(
                            discount: "32% off",
                            imagepath: "assets/mob3.jpg",
                            name: "Nokia 8.1 (iron, 64 GB)",
                          ),
                          SizedBox(width: 12),
                          ProductCard(
                            discount: "16% off",
                            imagepath: "assets/mob2.jpg",
                            name: "Nokia 8.1 (iron, 64 GB)",
                          ),
                          SizedBox(width: 12),
                          ProductCard(
                            discount: "26% off",
                            imagepath: "assets/mob4.jpg",
                            name: "Nokia 8.1 (iron, 64 GB)",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
