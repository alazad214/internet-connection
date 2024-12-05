import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection/features/notification_screen.dart';
import 'package:internet_connection/features/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List pages = [
    const Center(
      child: Text('Home Screen'),
    ),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: pages[_selectedIndex],
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  BottomNavigationBar _buildBottomNavBar() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }

  AppBar _buildAppbar() {
    return AppBar(
      title: const Text('Home Screen'),
      centerTitle: true,
      backgroundColor: Colors.deepOrangeAccent,
      actions: [
        IconButton(
          onPressed: () {
            Get.to(() => NotificationScreen());
          },
          icon: const Icon(Icons.notifications),
        )
      ],
    );
  }
}
