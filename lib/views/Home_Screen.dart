import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/Drawer.dart';
import '../controllers/home_controller.dart';

class HomeScreen extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: homeController.scaffoldKey, // Use scaffoldKey from controller
      appBar: AppBar(
        title: Text(
          "BMI APP",
          style: TextStyle(color: Colors.deepOrange),
        ),
        actions: [
          IconButton(
            onPressed: homeController.showLogoutConfirmationDialog,
            icon: Icon(Icons.logout),
          ),
        ],
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(Icons.menu, color: Colors.blue),
            );
          },
        ),
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'BMI',
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: homeController.nameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: "Enter Your Name",
                  labelText: "Name",
                  suffixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 15.0),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: homeController.wtController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Enter Your Weight (In Kg)",
                  labelText: "Weight",
                  suffixIcon: Icon(Icons.monitor_weight),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 15.0),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: homeController.htController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Enter Your Height (In Feet)",
                  labelText: "Height, Feet",
                  suffixIcon: Icon(Icons.height),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 15.0),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: homeController.inController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Enter Your Height (In Inch)",
                  labelText: "Height, Inch",
                  suffixIcon: Icon(Icons.insert_chart_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 15.0),
                ),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: homeController.calculateBMI,
              child: Text(
                "Check BMI",
                style: TextStyle(color: Colors.pink),
              ),
            ),
            SizedBox(height: 20),
            Obx(() {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Color.fromRGBO(255, 0, 0, 1.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        '${homeController.nameController.text}, Your BMI is: ${homeController.bmi.value.toStringAsFixed(2)}',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Category: ${homeController.bmiCategory.value}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: _getCategoryColor(homeController.bmiCategory.value),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Color _getCategoryColor(String category) {
    switch (category) {
      case 'Underweight':
        return Colors.blue;
      case 'Normal weight':
        return Colors.green;
      case 'Overweight':
        return Colors.orange;
      case 'Obesity':
        return Colors.red;
      default:
        return Colors.black;
    }
  }
}
