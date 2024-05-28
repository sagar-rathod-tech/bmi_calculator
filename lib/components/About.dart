import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../views/Home_Screen.dart';
import 'package:get/get.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double cardHeight = screenHeight * 0.3; // 30% of the screen height

    return Scaffold(
      appBar: AppBar(
        title: const Text('About Page'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
            // Get.offAll(() => HomeScreen()); // Navigate back to the previous screen
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Project Name: BMI Calculator',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.deepOrange,
                  fontWeight: FontWeight.bold,
                  fontFamily: "monospace",
                ),
              ),
            ),
            SizedBox(height: 15),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Team Members',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "monospace",
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            gradientCardSample(
              name: 'Sandeep Chavan',
              image: 'assets/images/ID.png',
              details:
              'Computer Science\nPnr No:- 2262191242541\n3rd Year\nBharatratna Indira Gandhi College,Solapur',
              height: cardHeight,
            ),
            gradientCardSample(
              name: 'Kashinath Pujari',
              image: 'assets/images/pujari.jpeg',
              details:
              'Computer Science\nPnr No:- 2262191242549\n3rd Year\nBharatratna Indira Gandhi College,Solapur',
              height: cardHeight,
            ),
            gradientCardSample(
              name: 'Sagar Rathod',
              image: 'assets/images/Sagar.jpeg',
              details:
              'Computer Science\nPnr No:- 2262191242543\n3rd Year\nBharatratna Indira Gandhi College,Solapur',
              height: cardHeight,
            ),
          ],
        ),
      ),
    );
  }

  Widget gradientCardSample({
    required String name,
    required String image,
    required String details,
    required double height,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: height,
        width: double.infinity,
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF846AFF),
              Color(0xFF755EE8),
              Colors.purpleAccent,
              Colors.amber,
            ],
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: "monospace",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    details,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: "monospace",
                      fontSize: 16,
                    ),
                    softWrap: true,
                  ),
                ],
              ),
            ),
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(image),
            ),
          ],
        ),
      ),
    );
  }
}
