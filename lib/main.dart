import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bookstore/bookstore.dart'; // Import the main page after login

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Store',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.catamaranTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  static const bgImage = 'assets/images/background.jpg';
  static const bookImage = 'assets/images/book.jpg';
  static const defaultPadding = 30.0;
  static const defaultDuration = Duration(milliseconds: 2000);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 244, 244, 1),
      body: ListView(
        children: <Widget>[
          Container(
            height: 400,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(bgImage),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: <Widget>[
                Positioned(
                  left: 30,
                  width: 80,
                  height: 200,
                  child: FadeInUp(
                    duration: Duration(seconds: 1),
                    child: Image.asset(bookImage),
                  ),
                ),
                // Additional Positioned widgets here
                Positioned(
                  child: FadeInUp(
                    duration: defaultDuration,
                    child: Container(
                      margin: EdgeInsets.only(top: 50),
                      child: Center(
                        child: Text(
                          "BOOK STORE",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(defaultPadding),
            child: Column(
              children: <Widget>[
                // Login Form Container
                buildLoginForm(),
                SizedBox(height: 30),
                // Login Button
                buildLoginButton(context),
                SizedBox(height: 20),
                // Sign Up Text
                buildActionText("Don't have an account? Sign up", defaultDuration, () {
                  // Navigation to the signup page
                }),
                SizedBox(height: 20),
                // Forgot Password Text
                buildActionText("Forgot Password?", defaultDuration, () {
                  // Navigation to the forgot password page
                }),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildLoginForm() {
    return FadeInUp(
      duration: Duration(milliseconds: 1800),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: <Widget>[
            buildTextField("Email or Phone number"),
            buildTextField("Password", obscureText: true),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String hintText, {bool obscureText = false}) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color.fromARGB(255, 165, 68, 68),
          ),
        ),
      ),
      child: TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[700]),
        ),
      ),
    );
  }

  Widget buildLoginButton(BuildContext context) {
    return FadeInUp(
      duration: Duration(milliseconds: 1900),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Bookstore()),
          );
        },
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(66, 133, 244, 1),
                Color.fromRGBO(219, 68, 55, 1),
              ],
            ),
          ),
          child: Center(
            child: Text(
              "Login",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildActionText(String text, Duration duration, Function() onTap) {
    return FadeInUp(
      duration: duration,
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          text,
          style: TextStyle(color: Color.fromRGBO(66, 133, 244, 1)),
        ),
      ),
    );
  }
}
