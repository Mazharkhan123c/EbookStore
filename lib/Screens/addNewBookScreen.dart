import 'dart:io';


import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddNewBook extends StatefulWidget {
  const AddNewBook({super.key});

  @override
  State<AddNewBook> createState() => _AddNewBookState();
}

class _AddNewBookState extends State<AddNewBook> {
  File? img;
  XFile? selectedImg;

  Container getImage() {
    if (img == null) {
      return Container(
          width: 150,
          height: 180,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Icon(Icons.camera_alt_outlined));
    } else {
      return Container(
        width: 150,
        height: 180,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: selectedImg != null
            ? Image.file(
                img!,
                fit: BoxFit.fill,
              )
            : Placeholder(), // You can replace Placeholder with any other widget or leave it empty
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add New Book')),
      body: Column(
        children: [
          Container(
            width: 370,
            height: 300,
            color: Color.fromARGB(255, 152, 251, 152),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext) {
                            return AlertDialog(
                              contentPadding: const EdgeInsets.all(20),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 180,
                                    height: 60,
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        ImagePicker picker = ImagePicker();

                                        selectedImg = await picker.pickImage(
                                            source: ImageSource.camera);

                                        setState(() {
                                          img = File(selectedImg!.path);
                                          Navigator.of(context).pop();
                                        });
                                      },
                                      child: Text('Camera'),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width: 180,
                                    height: 60,
                                    child: ElevatedButton(
                                        onPressed: () async {
                                          selectedImg = await ImagePicker()
                                              .pickImage(
                                                  source: ImageSource.gallery);
                                          setState(() {
                                            img = File(selectedImg!.path);
                                            Navigator.of(context).pop();
                                          });
                                        },
                                        child: Text('Gallary')),
                                  ),
                                ],
                              ),
                            );
                          });
                    },
                    child: getImage()

                    /*CircleAvatar(
                        maxRadius: 100,
                        backgroundImage: Image.file(
                          img!,
                          fit: BoxFit.fill,
                        ).image)*/

                    ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
                    child: Row(
                      children: [
                        Container(
                          width: 150,
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                20,
                              ))),
                              child: Text(
                                'Book PDF',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              )),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 150,
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                20,
                              ))),
                              child: Text(
                                'Book Audio',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              )),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    width: 330,
                    height: 50,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Book Title',
                        prefixIcon: Icon(Icons.book, color: Colors.blueAccent),
                        filled: true,
                        fillColor: Color.fromARGB(255, 152, 251, 152),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    width: 330,
                    height: 50,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Book Description',
                        prefixIcon: Icon(Icons.book, color: Colors.blueAccent),
                        filled: true,
                        fillColor: Color.fromARGB(255, 152, 251, 152),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue, // Set border color
                            width: 2.0, // Set border width
                          ),
                          borderRadius:
                              BorderRadius.circular(15.0), // Set border radius
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    width: 330,
                    height: 50,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Author Name',
                        filled: true,
                        fillColor: Color.fromARGB(255, 152, 251, 152),
                        prefixIcon:
                            Icon(Icons.person, color: Colors.blueAccent),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue, // Set border color
                            width: 2.0, // Set border width
                          ),
                          borderRadius:
                              BorderRadius.circular(15.0), // Set border radius
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    width: 330,
                    height: 50,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'About Author',
                        filled: true,
                        fillColor: Color.fromARGB(255, 152, 251, 152),
                        prefixIcon:
                            Icon(Icons.person_2, color: Colors.blueAccent),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue, // Set border color
                            width: 2.0, // Set border width
                          ),
                          borderRadius:
                              BorderRadius.circular(15.0), // Set border radius
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 0, 10),
                    child: Row(
                      children: [
                        Container(
                          width: 150,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Price',
                              filled: true,
                              fillColor: Color.fromARGB(255, 152, 251, 152),
                              prefixIcon: Icon(Icons.price_change,
                                  color: Colors.blueAccent),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.blue, // Set border color
                                  width: 2.0, // Set border width
                                ),
                                borderRadius: BorderRadius.circular(
                                    15.0), // Set border radius
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 150,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Pages',
                              filled: true,
                              fillColor: Color.fromARGB(255, 152, 251, 152),
                              prefixIcon:
                                  Icon(Icons.book, color: Colors.blueAccent),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.blue, // Set border color
                                  width: 2.0, // Set border width
                                ),
                                borderRadius: BorderRadius.circular(
                                    15.0), // Set border radius
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 0, 10),
                    child: Row(
                      children: [
                        Container(
                          width: 150,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Language',
                              filled: true,
                              fillColor: Color.fromARGB(255, 152, 251, 152),
                              prefixIcon: Icon(Icons.language,
                                  color: Colors.blueAccent),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.blue, // Set border color
                                  width: 2.0, // Set border width
                                ),
                                borderRadius: BorderRadius.circular(
                                    15.0), // Set border radius
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 150,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Audio Leng',
                              filled: true,
                              fillColor: Color.fromARGB(255, 152, 251, 152),
                              prefixIcon: Icon(Icons.audiotrack,
                                  color: Colors.blueAccent),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.blue, // Set border color
                                  width: 2.0, // Set border width
                                ),
                                borderRadius: BorderRadius.circular(
                                    15.0), // Set border radius
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
                    child: Row(
                      children: [
                        Container(
                          width: 150,
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                20,
                              ))),
                              child: Text(
                                'Cancel',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              )),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 150,
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                20,
                              ))),
                              child: Text(
                                'Post',
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
            ),
          ),
        ],
      ),
    );
  }
}
