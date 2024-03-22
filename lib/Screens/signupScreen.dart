import 'dart:io';

import 'package:ebook_store/Screens/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  File? img;
  CircleAvatar getImage() {
    if (img == null) {
      return CircleAvatar(
        maxRadius: 80.0,
        child: Icon(
          Icons.camera_alt_outlined,
          size: 40,
        ),
      );
    } else {
      return CircleAvatar(
        maxRadius: 80.0,
        backgroundImage: Image.file(
          img!,
          fit: BoxFit.fill,
        ).image,
      );
    }
  }

  TextEditingController emailcon = TextEditingController();
  TextEditingController namecon = TextEditingController();
  TextEditingController passcon = TextEditingController();
  bool isChecked = false;
  bool isVisibal = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Signup')),
      body: SingleChildScrollView(
        child: Container(
          width: 370,
          height: 810,
          color: Color.fromARGB(255, 152, 251, 152),
          child: Column(children: [
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext) {
                      return AlertDialog(
                        contentPadding: EdgeInsets.all(20),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ElevatedButton(
                                onPressed: () async {
                                  XFile? selectedImg = await ImagePicker()
                                      .pickImage(source: ImageSource.camera);

                                  setState(() {
                                    img = File(selectedImg!.path);
                                    Navigator.of(context).pop();
                                  });
                                },
                                child: Text("Camera")),
                            SizedBox(
                              height: 10,
                            ),
                            ElevatedButton(
                                onPressed: () async {
                                  XFile? selectedImg;
                                  ImagePicker picker = ImagePicker();
                                  selectedImg = await picker.pickImage(
                                      source: ImageSource.gallery);
                                  setState(() {
                                    img = File(selectedImg!.path);
                                    Navigator.of(context).pop();
                                  });
                                },
                                child: Text("Gallery"))
                          ],
                        ),
                      );
                    });
              },
              child: getImage(),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'SignUp',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              width: 320,
              child: TextFormField(
                controller: namecon,
                decoration: InputDecoration(
                    hintText: 'Enter Name',
                    prefixIcon: Icon(
                      Icons.person,
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
              height: 30,
            ),
            Container(
                width: 250,
                height: 60,
                child: ElevatedButton(
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => LoginScreen())),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ))),
          ]),
        ),
      ),
    );
  }
}
