// import 'package:ebook_store/Model/books.dart';
// import 'package:ebook_store/Model/global.dart';
// import 'package:flutter/material.dart';

// class UserProfileScreen extends StatefulWidget {
//   const UserProfileScreen({super.key});

//   @override
//   State<UserProfileScreen> createState() => _UserProfileScreenState();
// }

// class _UserProfileScreenState extends State<UserProfileScreen> {
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
//                     ],
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   CircleAvatar(
//                     maxRadius: 80.0,
//                     backgroundImage: AssetImage(
//                       'assets/images/Mazhar.jpg',
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Text(
//                     'Mazhar Iqbal',
//                     style: TextStyle(
//                         color: Colors.blueAccent, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Text(
//                     'mazharkhan@gmail.com',
//                     style: TextStyle(color: Colors.blue),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.fromLTRB(20, 20, 0, 10),
//               child: Container(
//                 alignment: Alignment.bottomLeft,
//                 child: Text(
//                   'Your Books',
//                   style: TextStyle(
//                       color: Colors.blue, fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),
//             ListView.builder(
//                 itemCount: b.bookList.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     leading: Image.asset(
//                       b.bookList[index].coverUrl,
//                       height: 120,
//                     ),
//                     title: Text(
//                       b.bookList[index].title,
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                   );
//                 })
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:ebook_store/Model/ApiHandler.dart';
import 'package:ebook_store/Model/books.dart';

import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
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
              color: Color.fromARGB(255, 152, 251, 152),
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.menu),
                        color: Colors.blueAccent,
                      ),
                      SizedBox(
                        width: 75,
                      ),
                      Text(
                        'E-Book',
                        style:
                            TextStyle(fontSize: 20, color: Colors.blueAccent),
                      ),
                      SizedBox(
                        width: 90,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CircleAvatar(
                    maxRadius: 80.0,
                    backgroundImage: AssetImage(
                      'assets/images/Mazhar.jpg',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Mazhar Iqbal',
                    style: TextStyle(
                        color: Colors.blueAccent, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'mazharkhan@gmail.com',
                    style: TextStyle(color: Colors.blue),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 0, 10),
              child: Container(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Your Books',
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
                height: 340,
                child: ListView.builder(
                  itemCount: _books.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 3,
                      child: ListTile(
                        leading: Image.asset(
                          _books[index].coverUrl,
                          height: 140,
                        ),
                        title: Text(
                          _books[index].bookTitle,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text('Author: ${_books[index].authorName}'),
                      ),
                    );
                  },
                )),
          ],
        ),
      ),
    );
  }
}
