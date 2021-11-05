import 'package:flutter/material.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({Key? key}) : super(key: key);

  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Create a post'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.only(left: 0.0, right: 250.0),
                child: Text(
                  'Title:',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                margin: const EdgeInsets.only(left: 50.0, right: 50.0),
                child: TextField(
                  decoration: new InputDecoration(
                    hintText: 'Enter title here',
                    labelStyle: TextStyle(
                      color: Colors.blueGrey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(width: 5.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.only(left: 0.0, right: 180.0),
                child: Text(
                  'Description:',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                margin: const EdgeInsets.only(left: 50.0, right: 50.0),
                child: TextField(
                  maxLines: 5,
                  maxLength: 100,
                  decoration: new InputDecoration(
                    hintText: 'Enter description here',
                    labelStyle: TextStyle(
                      color: Colors.lightBlueAccent,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(width: 5.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.only(left: 0.0, right: 180.0),
                child: Text(
                  'Image URL:',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                margin: const EdgeInsets.only(left: 50.0, right: 50.0),
                child: TextField(
                  decoration: new InputDecoration(
                    hintText: 'Enter image URL here',
                    labelStyle: TextStyle(
                      color: Colors.blueGrey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(width: 5.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(onPressed: () {}, child: Text('Cancel')),
                        SizedBox(
                          width: 70,
                        ),
                        ElevatedButton(
                            onPressed: () {}, child: Text('Create Post'))
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
