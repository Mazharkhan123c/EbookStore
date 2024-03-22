import 'package:ebook_store/Model/books.dart';

import 'package:ebook_store/Screens/addNewBookScreen.dart';
import 'package:ebook_store/Screens/bookDetailScreen.dart';
import 'package:ebook_store/Screens/userProfileScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;

import '../Model/ApiHandler.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //Global b = Global();

  BookApi _api = BookApi();

  List<Books> _books = [];
  @override
  void initState() {
    super.initState();
    _loadBooks();
  }

  void _loadBooks() async {
    try {
      List<Books> books = await _api.getAllBooks();
      setState(() {
        _books = books;
      });
    } catch (e) {
      print('Error loading books: $e');
    }
  }

  TextEditingController searchbarcon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 340,
              width: 405,
              color: const Color.fromARGB(255, 152, 251, 152),
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const AddNewBook()));
                        },
                        icon: const Icon(Icons.menu),
                        color: Colors.blueAccent,
                      ),
                      const SizedBox(
                        width: 75,
                      ),
                      const Text(
                        'E-Book',
                        style:
                            TextStyle(fontSize: 20, color: Colors.blueAccent),
                      ),
                      const SizedBox(
                        width: 90,
                      ),
                      InkWell(
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    const UserProfileScreen())),
                        child: const CircleAvatar(
                          maxRadius: 30.0,
                          backgroundImage: AssetImage(
                            'assets/images/Mazhar.jpg',
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Time to read book and enhance knowledge',
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Container(
                  //   width: 300,
                  //   height: 50,
                  //   child: TextFormField(
                  //     controller: searchbarcon,
                  //     decoration: InputDecoration(
                  //       hintText: 'Search Book by Name',
                  //       filled: true,
                  //       fillColor: Colors.white,
                  //       prefix: Icon(Icons.search, color: Colors.blueAccent),   // yahanpar sirf prefix nahin likhna prefixicon likhna hota hy
                  //       isCollapsed: false,
                  //       border: OutlineInputBorder(
                  //         borderSide: BorderSide(
                  //           color: Colors.blue, // Set border color
                  //           width: 2.0, // Set border width
                  //         ),
                  //         borderRadius:
                  //             BorderRadius.circular(15.0), // Set border radius
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Container(
                    width: 320,
                    child: TextFormField(
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Search Book by Title',
                          prefixIcon:
                              Icon(Icons.search, color: Colors.blueAccent),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(33)))),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                    child: Container(
                        alignment: Alignment.bottomLeft,
                        child: const Text(
                          'Topics',
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        )),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Container(
                            width: 130,
                            height: 50,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0)),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.sports,
                                      color: Color.fromARGB(255, 135, 176, 39)),
                                  const SizedBox(
                                      width:
                                          8), // Add some spacing between the icon and text
                                  const Text('Sports'),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 150,
                            height: 50,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0)),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.airplanemode_on,
                                      color: Colors
                                          .purple), // Use the horror icon here
                                  const SizedBox(
                                      width:
                                          8), // Add some spacing between the icon and text
                                  const Text('Traveling'),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 130,
                            height: 50,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0)),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.whatshot,
                                      color: Colors
                                          .red), // Use the horror icon here
                                  const SizedBox(
                                      width:
                                          8), // Add some spacing between the icon and text
                                  const Text('Horror'),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 150,
                            height: 50,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0)),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.business,
                                      color: Colors
                                          .pink), // Use the horror icon here
                                  const SizedBox(
                                      width:
                                          8), // Add some spacing between the icon and text
                                  const Text('Bussines'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
              child: Container(
                alignment: Alignment.bottomLeft,
                child: const Text(
                  'Trending',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 180,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _books.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const BookDetailScreen())),
                      child: Container(
                        width: 130,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //   Image.network(getb)
                            Image.asset(
                              _books[index].coverUrl,
                              height: 120,
                            ),
                            const SizedBox(height: 8),
                            Text(_books[index].bookTitle),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 5, 0, 0),
              child: Container(
                alignment: Alignment.bottomLeft,
                child: const Text(
                  'Your Intrust',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 180,
              child: ListView.builder(
                itemCount: _books.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const BookDetailScreen())),
                    contentPadding: const EdgeInsets.all(8.0),
                    leading: Image.asset(
                      _books[index].coverUrl,
                      height: 120,
                    ),
                    title: Text(_books[index].bookTitle),
                    subtitle: Text('Author: ${_books[index].authorName}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:ebook_store/Model/books.dart';
// import 'package:ebook_store/Model/global.dart';
// import 'package:flutter/material.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   Global b = Global();

//   TextEditingController searchbarcon = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//               height: 340,
//               width: 405,
//               color: Color.fromARGB(255, 152, 251, 152),
//               child: Column(
//                 children: [
//                   SizedBox(
//                     height: 40,
//                   ),
//                   Row(
//                     children: [
//                       SizedBox(
//                         width: 10,
//                       ),
//                       IconButton(
//                         onPressed: () {},
//                         icon: Icon(Icons.menu),
//                         color: Colors.blueAccent,
//                       ),
//                       SizedBox(
//                         width: 75,
//                       ),
//                       Text(
//                         'E-Book',
//                         style:
//                             TextStyle(fontSize: 20, color: Colors.blueAccent),
//                       ),
//                       SizedBox(
//                         width: 90,
//                       ),
//                       CircleAvatar(
//                         maxRadius: 30.0,
//                         backgroundImage: AssetImage(
//                           'assets/images/Mazhar.jpg',
//                         ),
//                       )
//                     ],
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Text(
//                     'Time to read book and enhance knowledge',
//                     style: TextStyle(color: Colors.blueAccent),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Container(
//                     width: 300,
//                     height: 50,
//                     child: TextFormField(
//                       controller: searchbarcon,
//                       decoration: InputDecoration(
//                         hintText: 'Search Book by Name',
//                         filled: true,
//                         fillColor: Colors.white,
//                         prefix: Icon(Icons.search, color: Colors.blueAccent),
//                         isCollapsed: false,
//                         border: OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: Colors.blue, // Set border color
//                             width: 2.0, // Set border width
//                           ),
//                           borderRadius:
//                               BorderRadius.circular(15.0), // Set border radius
//                         ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
//                     child: Container(
//                         alignment: Alignment.bottomLeft,
//                         child: Text(
//                           'Topics',
//                           style: TextStyle(
//                               color: Colors.blue, fontWeight: FontWeight.bold),
//                         )),
//                   ),
//                   SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     child: Padding(
//                       padding: const EdgeInsets.all(15.0),
//                       child: Row(
//                         children: [
//                           Container(
//                             width: 130,
//                             height: 50,
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(15.0)),
//                             ),
//                             child: Center(
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Icon(Icons.sports,
//                                       color: Color.fromARGB(255, 135, 176, 39)),
//                                   SizedBox(
//                                       width:
//                                           8), // Add some spacing between the icon and text
//                                   Text('Sports'),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             width: 10,
//                           ),
//                           Container(
//                             width: 150,
//                             height: 50,
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(15.0)),
//                             ),
//                             child: Center(
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Icon(Icons.airplanemode_on,
//                                       color: Colors
//                                           .purple), // Use the horror icon here
//                                   SizedBox(
//                                       width:
//                                           8), // Add some spacing between the icon and text
//                                   Text('Traveling'),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             width: 10,
//                           ),
//                           Container(
//                             width: 130,
//                             height: 50,
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(15.0)),
//                             ),
//                             child: Center(
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Icon(Icons.whatshot,
//                                       color: Colors
//                                           .red), // Use the horror icon here
//                                   SizedBox(
//                                       width:
//                                           8), // Add some spacing between the icon and text
//                                   Text('Horror'),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             width: 10,
//                           ),
//                           Container(
//                             width: 150,
//                             height: 50,
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(15.0)),
//                             ),
//                             child: Center(
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Icon(Icons.business,
//                                       color: Colors
//                                           .pink), // Use the horror icon here
//                                   SizedBox(
//                                       width:
//                                           8), // Add some spacing between the icon and text
//                                   Text('Business'),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
//                     child: Container(
//                       alignment: Alignment.bottomLeft,
//                       child: Text(
//                         'Trending',
//                         style: TextStyle(
//                           color: Colors.blue,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 180,
//                     child: ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       itemCount: b.bookList.length,
//                       itemBuilder: (context, index) {
//                         return Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Container(
//                             width: 130,
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(15.0)),
//                             ),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Image.asset(
//                                   b.bookList[index].coverUrl,
//                                   height: 120,
//                                 ),
//                                 SizedBox(height: 8),
//                                 Text(b.bookList[index].title),
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
//                     child: Container(
//                       alignment: Alignment.bottomLeft,
//                       child: Text(
//                         'Your Interests',
//                         style: TextStyle(
//                           color: Colors.blue,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 180,
//                     child: ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       itemCount: b.bookList.length,
//                       itemBuilder: (context, index) {
//                         return ListTile(
//                           contentPadding: EdgeInsets.all(8.0),
//                           leading: Image.asset(
//                             b.bookList[index].coverUrl,
//                             height: 120,
//                           ),
//                           title: Text(b.bookList[index].title),
//                           subtitle: Text('Author: ${b.bookList[index].author}'),
//                         );
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
