import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'BMI Calculator\nCollege Project',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/images/bigce.png'),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home, color: Colors.blueAccent),
            title: Text('Home'),
            onTap: () {
              if (Get.currentRoute == '/home') {
                Navigator.of(context).pop(); // Just close the drawer if already on home
              } else {
                Get.offAllNamed('/'); // Navigate to home page and remove all previous routes
              }
            },
          ),
          ListTile(
            leading: Icon(Icons.info, color: Colors.blueAccent),
            title: Text('About'),
            onTap: () {
              if (Get.currentRoute == '/about') {
                Navigator.of(context).pop(); // Just close the drawer if already on about
              } else {
                Get.toNamed('/about');
              }
            },
          ),
          ListTile(
            leading: Icon(Icons.logout, color: Colors.red),
            title: Text('Log Out'),
            onTap: () {
              _showLogoutConfirmationDialog(context);
            },
          ),
        ],
      ),
    );
  }

  Future<void> _logOut() async {
    // Clear any user session data
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    // Navigate to the login screen
    Get.offAllNamed('/login');
  }

  // Function to show logout confirmation dialog
  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Logout"),
          content: Text("Are you sure you want to logout?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("No"),
            ),
            TextButton(
              onPressed: () {
                _logOut();
              },
              child: Text("Yes"),
            ),
          ],
        );
      },
    );
  }
}
