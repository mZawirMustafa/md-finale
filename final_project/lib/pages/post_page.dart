import 'package:flutter/material.dart';

class PostPage extends StatefulWidget {
  PostPage({Key? key}) : super(key: key);

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Post Page'),
        ),
        body: Card(
          elevation: 5,
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          child: Container(
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Image(
                    width: 50,
                    height: 50,
                    image: NetworkImage(
                        'https://static.thenounproject.com/png/3134331-200.png'),
                    fit: BoxFit.fill,
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
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 8, right: 8),
                                child: Text('Title',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8, right: 8),
                            child: Text(
                                "'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8, right: 8),
                            child: Text('Date Created',
                                style: TextStyle(
                                  fontSize: 12,
                                )),
                          ),
                        ],
                      ),
                    )),
                Padding(
                  padding: EdgeInsets.only(left: 0, right: 0),
                  child: IconButton(
                    icon: const Icon(Icons.restore_from_trash),
                    color: Colors.black,
                    onPressed: () {},
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 0, right: 0),
                  child: IconButton(
                    icon: const Icon(Icons.headphones),
                    color: Colors.black,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
