import 'package:final_project/pages/create_post_page.dart';
import 'package:final_project/pages/favourites.dart';
import 'package:final_project/pages/login.dart';
import 'package:final_project/pages/post_details_page.dart';
import 'package:flutter/material.dart';
import 'package:final_project/pages/about_page.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'dart:convert';

class PostPage extends StatefulWidget {
  PostPage({required this.postchannel, Key? key}) : super(key: key);
  final WebSocketChannel postchannel;

  @override
  _PostPageState createState() => _PostPageState(this.postchannel);
}

class _PostPageState extends State<PostPage> {
  _PostPageState(this.postchannel);
  WebSocketChannel postchannel;

  final snackBar = SnackBar(
    content: const Text(
        'Apologies, I could not figure the implementation for this functionality'),
    action: SnackBarAction(
      label: 'Undo',
      onPressed: () {},
    ),
  );

  dynamic decodedResponse;
  List entry = [];
  List favs = [];
  @override
  void initState() {
    super.initState();

    widget.postchannel.stream.listen((response) {
      decodedResponse = jsonDecode(response);
      if (decodedResponse['type'] == 'all_posts') {
        entry = decodedResponse['data']['posts'];
      }
      setState(() {});
    });
    _getPost();
  }

  void _getPost() {
    widget.postchannel.sink.add('{"type":"get_posts"}');
  }

  @override
  Widget build(BuildContext context) {
    var sorted = entry.reversed.toList();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'Home Feed',
            style: TextStyle(color: Colors.blueAccent),
          ),
          centerTitle: true,
        ),
        endDrawer: Drawer(
          child: ListView(
            children: [
              ListTile(
                title: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text("Favourites"),
                    )
                  ],
                ),
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => Favourites()),
                  // );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
              ),
              ListTile(
                title: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text("About"),
                    )
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutApp()),
                  );
                },
              ),
              ListTile(
                title: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text("Log Out"),
                    )
                  ],
                ),
                onTap: () {
                  postchannel.sink.close();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SignUp()),
                  );
                },
              )
            ],
          ),
        ),
        body: Stack(children: [
          ListView.builder(
              itemCount: sorted.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailedPost(
                                image: sorted[index]["image"],
                                name: sorted[index]["author"],
                                title: sorted[index]["title"],
                                desc: sorted[index]["description"])),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: Image(
                              width: 100,
                              height: 100,
                              image: NetworkImage("${sorted[index]["image"]}"),
                              fit: BoxFit.fill,
                              errorBuilder: (BuildContext context,
                                  Object exception, StackTrace? stackTrace) {
                                return Container(
                                    width: 100,
                                    height: 100,
                                    child: Image.asset('assets/error404.png'));
                              },
                            ),
                          ),
                          Expanded(
                              flex: 3,
                              child: Container(
                                padding: EdgeInsets.only(bottom: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 8, right: 8),
                                      child: Text(sorted[index]["title"],
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 8, right: 8),
                                      child: Text(sorted[index]["description"],
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 3,
                                          style: TextStyle(
                                            fontSize: 16,
                                          )),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 8, right: 8),
                                      child: Text(sorted[index]["date"],
                                          style: TextStyle(
                                            fontSize: 12,
                                          )),
                                    ),
                                  ],
                                ),
                              )),
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 0, right: 0),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.lightBlueAccent,
                                  ),
                                  onPressed: () {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  },
                                  child: const Icon(Icons.favorite),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 0, right: 0),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.black),
                                  onPressed: () {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  },
                                  child: const Icon(Icons.delete),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 18.0, right: 10),
              child: Container(
                width: 65,
                height: 65,
                child: FloatingActionButton(
                  heroTag: "btn1",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              CreatePost(createchannel: postchannel)),
                    );
                  },
                  child: const Icon(Icons.add),
                  backgroundColor: Colors.blueAccent,
                ),
              ),
            ),
          ),
        ]));
  }
}
