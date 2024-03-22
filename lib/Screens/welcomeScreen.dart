import 'package:ebook_store/Screens/loginScreen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: 370,
            height: 405,
            color: Color.fromARGB(255, 152, 251, 152),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/book image.png',
                  width: 180,
                  alignment: Alignment.center,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'E-Book Store',
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Here you can find best books and you can read and download the PDF of books',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.blueAccent),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Text(
                  'Disclaimer',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
                SizedBox(height: 30),
                Center(
                  child: Container(
                    width: 320,
                    child: Text(
                      'Explore a seamless reading experience for book enthusiasts, offering a diverse collection across genres and authors.Immerse yourself in a world of knowledge with our e-book app, where a vast library awaits to captivate your mind.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                  ),
                ),
                SizedBox(height: 60),
                Container(
                  width: 250,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: ElevatedButton(
                      onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => LoginScreen())),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                        20,
                      ))),
                      child: Text(
                        'Login or Signup',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      )),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
