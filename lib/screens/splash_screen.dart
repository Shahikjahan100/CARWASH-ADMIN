import 'dart:async';

import 'package:carwash_admin/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    //HERE WILL BE THE TIMER AND ALSO A CALLBACK FUNCTION
    Timer(const Duration(seconds: 7), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: ((context) => const LoginScreen()),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Container(
          height: screenHeight,
          width: screenWidth,
          decoration: BoxDecoration(
            color: Colors.blue[600],
          ),
          child: Column(
            children: [
              //ADDING ANIMATIO FOR CARWASH
              Container(
                margin: EdgeInsets.only(top: screenHeight * 0.09),
                child: Lottie.asset(
                  'assets/animation/carwash.json',
                  height: screenHeight * 0.5,
                  width: screenWidth,
                ),
              ),
              //ADDING TEXT FOR THE CARWASH
              Container(
                child: Text(
                  "Car Wash",
                  style: GoogleFonts.ubuntu(
                    color: Colors.white,
                    fontSize: screenHeight * 0.04,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
