import 'package:ebook_store/Screens/bookReadScreen.dart';
import 'package:ebook_store/Screens/loginScreen.dart';
import 'package:flutter/material.dart';

class BookDetailScreen extends StatelessWidget {
  const BookDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Detail'),
      ),
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
                  'assets/images/rich dad.jpg',
                  width: 180,
                  height: 180,
                  alignment: Alignment.center,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Rich Dad Poor Dad',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Author: Robert T. Kiyosaki ',
                  style: TextStyle(fontSize: 15, color: Colors.blueAccent),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Robert T. Kiyosaki is an American entrepreneur, businessman, and author known for his expertise in personal finance and wealth-building strategies.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: Colors.blueAccent),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
                      child: Column(
                        children: [
                          Text(
                            'Rating',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w800,
                                color: Colors.blueAccent),
                          ),
                          Text(
                            '4.5',
                            style: TextStyle(
                                fontSize: 15, color: Colors.blueAccent),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            'Pages',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w800,
                                color: Colors.blueAccent),
                          ),
                          Text(
                            '200',
                            style: TextStyle(
                                fontSize: 15, color: Colors.blueAccent),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            'Language',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w800,
                                color: Colors.blueAccent),
                          ),
                          Text(
                            'ENG',
                            style: TextStyle(
                                fontSize: 15, color: Colors.blueAccent),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            'Audio',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w800,
                                color: Colors.blueAccent),
                          ),
                          Text(
                            '2hr',
                            style: TextStyle(
                                fontSize: 15, color: Colors.blueAccent),
                          ),
                        ],
                      ),
                    )
                  ],
                )
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
                  'About Book',
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
                      'Rich Dad Poor Dad" is a personal finance and self-help book written by Robert T. Kiyosaki. Originally published in 1997, the book has become one of the best-selling personal finance books of all time.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                  ),
                ),
                SizedBox(height: 40),
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
                            onPressed: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => ReadBookScreen())),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                              20,
                            ))),
                            child: Text(
                              'Read Book',
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
                            onPressed: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen())),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                              20,
                            ))),
                            child: Text(
                              'Download',
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
        ],
      ),
    );
  }
}
