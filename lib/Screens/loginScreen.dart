import 'package:ebook_store/Screens/homeScreen.dart';
import 'package:ebook_store/Screens/signupScreen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailcon = TextEditingController();
  TextEditingController passcon = TextEditingController();
  bool isChecked = false;
  bool isVisibal = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: 370,
          height: 810,
          color: Color.fromARGB(255, 152, 251, 152),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Image.asset(
                'assets/images/book4.png',
                width: 280,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Login',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 320,
                child: TextFormField(
                  controller: emailcon,
                  decoration: InputDecoration(
                      hintText: 'Enter Email',
                      prefixIcon: Icon(
                        Icons.email,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(33)))),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 320,
                child: TextFormField(
                  controller: passcon,
                  obscureText: !isVisibal,
                  decoration: InputDecoration(
                      hintText: 'Enter Password',
                      prefixIcon: Icon(
                        Icons.password,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          isVisibal ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            isVisibal = !isVisibal;
                          });
                        },
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(33)))),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                value: isChecked,
                onChanged: (value) {
                  setState(() {
                    isChecked = value!;
                  });
                },
                title: Text('Remamber Me!'),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  width: 250,
                  height: 60,
                  child: ElevatedButton(
                      onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => HomeScreen())),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ))),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Dont have an Account?',
                    textAlign: TextAlign.center,
                  ),
                  TextButton(
                      onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => SignupScreen())),
                      child: Text(
                        'SignUp',
                        textAlign: TextAlign.center,
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
