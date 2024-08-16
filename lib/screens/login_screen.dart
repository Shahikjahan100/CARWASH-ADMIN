import 'package:carwash_admin/components/toast_message.dart';
import 'package:carwash_admin/screens/forget%20password.dart';
import 'package:carwash_admin/screens/home_screen.dart';
import 'package:carwash_admin/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    final AuthService _authService = AuthService();
//A METHOD TO ACCESS THE LOGIN FUNCTIONALITY IN AUTH_SERVICES FILE
    Future<void> signIn() async {
      final user = await _authService.signIn(
        email.text.trim(),
        password.text.trim(),
      );
      if (user != null) {
        showToast("Login Successfull!", Colors.green.shade600);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: ((context) => const HomeScreen())));
      } else {
        showToast("Incorrect email or password!", Colors.red.shade600);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login",
          style: GoogleFonts.ubuntu(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 3,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[600],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              // A LOGO OR ANIMATION AT THE TOP
              Lottie.asset(
                'assets/animation/carwash.json',
                height: screenHeight * 0.3,
                width: screenWidth,
              ),
              // ADDING TEXT OF THE APP
              Container(
                margin: EdgeInsets.only(bottom: screenHeight * 0.03),
                child: Text(
                  "Carwash",
                  style: GoogleFonts.ubuntu(
                    fontWeight: FontWeight.bold,
                    fontSize: screenHeight * 0.04,
                    letterSpacing: 2,
                  ),
                ),
              ),
              //ADDING TEXTFIELD FOR THE EMAIL

              Container(
                margin: const EdgeInsets.only(top: 10, left: 40, right: 40),
                child: TextField(
                  controller: email,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        width: 5.0,
                        color: Colors.blue,
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.blue[600],
                    ),
                    hintText: "Email",
                    hintStyle: GoogleFonts.ubuntu(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      letterSpacing: 3.0,
                      color: Colors.grey.shade500, // Adjust text color
                    ),
                  ),
                ),
              ),
              //ADDING TEXTFIELD FOR THE PASSWORD
              Container(
                margin: const EdgeInsets.only(top: 10, left: 40, right: 40),
                child: TextField(
                  controller: password,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(width: 5.0),
                    ),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.blue[600],
                    ),
                    hintText: "Password",
                    hintStyle: GoogleFonts.ubuntu(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      letterSpacing: 3.0,
                      color: Colors.grey.shade500, // Adjust text color
                    ),
                  ),
                ),
              ),
              //ADDING FORGET PASSWORD LINK
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.all(screenHeight * 0.03),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ForgetPassword(),
                            ));
                      },
                      child: Text(
                        "Forget Password?",
                        style: GoogleFonts.ubuntu(
                          color: Colors.blue[600],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              //ADDING THE SIGN-IN BUTTON
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.blue[600]),
                    minimumSize: MaterialStateProperty.all(
                        Size(screenWidth * 0.5, screenHeight * 0.07))),
                onPressed: signIn,
                child: Text(
                  "LOGIN",
                  style: GoogleFonts.ubuntu(
                    letterSpacing: 3,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
