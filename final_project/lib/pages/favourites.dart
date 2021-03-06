// import 'package:final_project/pages/about_page.dart';
// import 'package:flutter/material.dart';

// class Favourites extends StatelessWidget {
//   const Favourites({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.black,
//           title: Text(
//             'Favourites',
//             style: TextStyle(color: Colors.blueAccent),
//           ),
//           centerTitle: true,
//         ),
//         endDrawer: Drawer(
//           child: ListView(
//             children: [
//               ListTile(
//                 title: Row(
//                   children: <Widget>[
//                     Padding(
//                       padding: EdgeInsets.only(left: 8.0),
//                       child: Text("Favourites"),
//                     )
//                   ],
//                 ),
//                 onTap: () {},
//               ),
//               ListTile(
//                 title: Row(
//                   children: <Widget>[
//                     Padding(
//                       padding: EdgeInsets.only(left: 8.0),
//                       child: Text("About"),
//                     )
//                   ],
//                 ),
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => AboutApp()),
//                   );
//                 },
//               ),
//               ListTile(
//                 title: Row(
//                   children: <Widget>[
//                     Padding(
//                       padding: EdgeInsets.only(left: 8.0),
//                       child: Text("Log Out"),
//                     )
//                   ],
//                 ),
//                 onTap: () {},
//               )
//             ],
//           ),
//         ),
//         body: Stack(children: [
//           ListView.builder(
//               // itemCount: entry.length,
//               itemBuilder: (context, index) {
//                 return Card(
//                   elevation: 5,
//                   margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//                   child: InkWell(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             // builder: (context) => DetailedPost(
//                             //     image: entry[index]["image"],
//                             //     name: entry[index]["author"],
//                             //     desc: entry[index]["description"])),
//                       );
//                     },
//                     child: Container(
//                       padding: EdgeInsets.all(8),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Container(
//                             child: Image(
//                               width: 100,
//                               height: 100,
//                               image: NetworkImage(
//                                   "${entry[index]["image"].toString()}")
//                                   ,
//                               fit: BoxFit.fill,
//                               errorBuilder: (BuildContext context,
//                                   Object exception, StackTrace? stackTrace) {
//                                 return Container(
//                                     width: 100,
//                                     height: 100,
//                                     child: Image.asset('assets/error404.png'));
//                               },
//                             ),
//                           ),
//                           Expanded(
//                               flex: 3,
//                               child: Container(
//                                 padding: EdgeInsets.only(bottom: 10),
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Row(
//                                       children: [
//                                         Padding(
//                                           padding: EdgeInsets.only(
//                                               left: 8, right: 8),
//                                           child: Text(entry[index]["author"],
//                                               style: TextStyle(
//                                                   fontSize: 20,
//                                                   fontWeight: FontWeight.bold)),
//                                         ),
//                                       ],
//                                     ),
//                                     SizedBox(
//                                       height: 5,
//                                     ),
//                                     Padding(
//                                       padding:
//                                           EdgeInsets.only(left: 8, right: 8),
//                                       child: Text(entry[index]["description"],
//                                           overflow: TextOverflow.ellipsis,
//                                           maxLines: 3,
//                                           style: TextStyle(
//                                             fontSize: 16,
//                                           )),
//                                     ),
//                                     SizedBox(
//                                       height: 15,
//                                     ),
//                                     Padding(
//                                       padding:
//                                           EdgeInsets.only(left: 8, right: 8),
//                                       child: Text(entry[index]["date"],
//                                           style: TextStyle(
//                                             fontSize: 12,
//                                           )),
//                                     ),
//                                   ],
//                                 ),
//                               )),
//                           Column(
//                             children: [
//                               Padding(
//                                 padding: EdgeInsets.only(left: 0, right: 0),
//                                 child: ElevatedButton(
//                                   style: ElevatedButton.styleFrom(
//                                     primary: Colors.lightBlueAccent,
//                                   ),
//                                   onPressed: () {
//                                     // Perform some action
//                                   },
//                                   child: const Icon(Icons.favorite),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(left: 5, right: 0),
//                                 child: ElevatedButton(
//                                   style: ElevatedButton.styleFrom(
//                                       primary: Colors.black),
//                                   onPressed: () {
//                                     // Perform some action
//                                   },
//                                   child: const Icon(Icons.delete),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               }),
//           Align(
//             alignment: Alignment.bottomRight,
//             child: Padding(
//               padding: const EdgeInsets.only(bottom: 18.0, right: 10),
//               child: Container(
//                 width: 65,
//                 height: 65,
//                 child: FloatingActionButton(
//                   heroTag: "btn1",
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) =>
//                               CreatePost(createchannel: postchannel)),
//                     );
//                   },
//                   child: const Icon(Icons.add),
//                   backgroundColor: Colors.blueAccent,
//                 ),
//               ),
//             ),
//           ),
//         ]));
//   }
// }
