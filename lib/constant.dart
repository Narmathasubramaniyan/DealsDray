import 'package:flutter/material.dart';

var myAppbar = AppBar(
  backgroundColor: Colors.white,
  elevation: 1,
  leading: const Icon(Icons.menu,
      size: 30,
      color: Color.fromARGB(159, 0, 0, 0)), // Your existing leading icon
  title: Container(
    height: 40,
    decoration: BoxDecoration(
      color: Colors.grey[300], // Background color for the search bar
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Image.asset(
            'assets/search.png', // Your logo image
            height: 30, // Adjust the logo size
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        const Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search here',
              hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none,
            ),
          ),
        ),
        const Icon(Icons.search, color: Colors.grey), // Right-side search icon
      ],
    ),
  ),
  actions: [
    IconButton(
      icon: const Icon(Icons.notifications_none,
          size: 30,
          color: Color.fromARGB(159, 0, 0, 0)), // Your existing action
      onPressed: () {
        // Add your notification functionality here
      },
    ),
  ],
);

//normal card

var kyccard = Container(
  height: 180,
  padding: const EdgeInsets.symmetric(
      horizontal: 25), // Optional: Add padding for better spacing
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(14),
    gradient: const LinearGradient(
      colors: [
        Color.fromARGB(223, 75, 3, 231), // Dark red color
        Color.fromARGB(255, 129, 153, 239), // Indigo/purple color
      ],
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
    ),
  ),
  child: const Padding(
    padding: EdgeInsets.all(12.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center, // Align text to the start
      children: [
        Text(
          'KYC Pending',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
        ),
        SizedBox(height: 10),
        Text(
          'You need to provide the required',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        SizedBox(height: 8),
        Text(
          'documents for your account activation.',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        SizedBox(height: 8),
        Text(
          'Click Here',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            decoration: TextDecoration.underline,
            decorationColor: Colors.white, // Set the color of the underline
            decorationThickness: 2.0, // Set the thickness of the underline
            color: Colors.white, // Set the color of the text
          ),
        ),
      ],
    ),
  ),
);

var mybottombar = BottomAppBar(
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Distribute icons evenly
    children: [
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/home.png",
            color: Colors.red,
            height: 30, // Set height for the icon
          ),
          const Text(
            'Home',
            style: TextStyle(color: Colors.red),
          ),
        ],
      ),
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/windows.png",
            color: Colors.grey,
            height: 30, // Set height for the icon
          ),
          const Text('Categories'),
        ],
      ),
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/logo.png",
            height: 30, // Set height for the icon
          ),
          const Text('Deals'),
        ],
      ),
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/shopping-cart.png",
            color: Colors.grey,
            height: 30, // Set height for the icon
          ),
          const Text('Cart'),
        ],
      ),
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/user.png",
            color: Colors.grey,
            height: 30, // Set height for the icon
          ),
          const Text('Profile'),
        ],
      ),
    ],
  ),
);
