import 'package:coffee_shop/screen/home_screen.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    final ht = MediaQuery.of(context).size.height;
    final wt = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/coffee6.png',
              height: ht * 0.25,
            ),
            SizedBox(
              height: ht * 0.02,
            ),
            Text(
              'Coffee day',
              style: TextStyle(
                  fontSize: wt * 0.07,
                  color: Colors.brown[700],
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: ht * 0.02,
            ),
            Text(
              'How do you like your coffee?',
              style: TextStyle(
                fontSize: wt * 0.05,
                color: Colors.brown,
              ),
            ),
            SizedBox(
              height: ht * 0.08,
            ),
            buildButton()
          ],
        ),
      ),
    );
  }

  Widget buildButton() {
    final ht = MediaQuery.of(context).size.height;
    final wt = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      ),
      child: Container(
        height: ht * 0.08,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: Colors.brown),
        child: Center(
            child: Text(
          'Enter Shop',
          style: TextStyle(
              fontSize: wt * 0.05,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
