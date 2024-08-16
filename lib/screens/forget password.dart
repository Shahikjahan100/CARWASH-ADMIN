import 'package:carwash_admin/components/toast_message.dart';
import 'package:carwash_admin/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    TextEditingController email = TextEditingController();
    final AuthService authService = AuthService();

    Future<void> resetPassword() async {
      try {
        await authService.resetPassword(email.text.trim());
        showToast("Password reset email sent! Check your inbox",
            Colors.green.shade600);
      } on FirebaseAuthException catch (e) {
        showToast(e.message.toString(), Colors.red);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Forget Password",
          style: GoogleFonts.ubuntu(
            color: Colors.white,
            fontWeight: FontWeight.normal,
            letterSpacing: 2,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[600],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Lottie.asset(
              'assets/animation/carwash.json',
              height: screenHeight * 0.3,
              width: screenWidth,
            ),
            Text(
              "Recover your password",
              style: GoogleFonts.ubuntu(
                  color: Colors.grey[600], fontSize: screenHeight * 0.03),
            ),
            //ADDING A TEXTFIELD FOR VALIDATING AN EMAIL ADDRESS

            Container(
              margin: EdgeInsets.only(
                  top: screenHeight * 0.04, left: 40, right: 40),
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
                  hintText: "Enter a valid email address",
                  hintStyle: GoogleFonts.ubuntu(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    letterSpacing: 3.0,
                    color: Colors.grey.shade500, // Adjust text color
                  ),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.1,
            ),
            //ADDING THE RECOVER-PASSWORD BUTTON
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.blue[600]),
                  minimumSize: MaterialStateProperty.all(
                      Size(screenWidth * 0.5, screenHeight * 0.07))),
              onPressed: resetPassword,
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
    );
  }
}
