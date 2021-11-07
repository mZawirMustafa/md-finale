import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'dart:convert';

class CreatePost extends StatefulWidget {
  const CreatePost({required this.createchannel, Key? key}) : super(key: key);
  final WebSocketChannel createchannel;

  @override
  _CreatePostState createState() => _CreatePostState(this.createchannel);
}

class _CreatePostState extends State<CreatePost> {
  _CreatePostState(this.createchannel);
  WebSocketChannel createchannel;
  final _controllerTitle = TextEditingController();
  final _controllerDesc = TextEditingController();
  final _controllerImgUrl = TextEditingController();
  bool _buttonAllowStatus = false;

  @override
  void initState() {
    _controllerTitle.addListener(_ifCreateValid);
    _controllerDesc.addListener(_ifCreateValid);
    _controllerImgUrl.addListener(_ifCreateValid);
    super.initState();
  }

  void _ifCreateValid() {
    setState(() {
      if (_controllerTitle.text.isNotEmpty &&
          _controllerDesc.text.isNotEmpty &&
          _controllerImgUrl.text.isNotEmpty) {
        _buttonAllowStatus = true;
      } else {
        _buttonAllowStatus = false;
      }
    });
  }

  void posting() {
    createchannel.sink.add(
        '{ "type": "create_post", "data": { "title" : "${_controllerTitle.text}", "description": "${_controllerDesc.text}", "image": "${_controllerImgUrl.text}"}}');

    // _controllerTitle.clear();
    // _controllerDesc.clear();
    // _controllerImgUrl.clear();
  }

  @override
  void dispose() {
    _controllerTitle.dispose();
    _controllerDesc.dispose();
    _controllerImgUrl.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'Create a post',
            style: TextStyle(color: Colors.blueAccent),
          ),
          centerTitle: true,
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
                child: TextFormField(
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
                  validator: (value) =>
                      value!.isEmpty ? 'Title can\'nt be empty' : null,
                  controller: _controllerTitle,
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
                child: TextFormField(
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
                  validator: (value) =>
                      value!.isEmpty ? 'Description can\'nt be empty' : null,
                  controller: _controllerDesc,
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
                child: TextFormField(
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
                  validator: (value) =>
                      value!.isEmpty ? 'Image URL can\'nt be empty' : null,
                  controller: _controllerImgUrl,
                ),
              ),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Cancel')),
                        SizedBox(
                          width: 70,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black, // background
                            onPrimary: Colors.blueAccent,
                            onSurface: Colors.black, // foreground
                          ),
                          onPressed: !_buttonAllowStatus
                              ? null
                              : () {
                                  posting();
                                  Navigator.pop(context);
                                },
                          child: const Text('Create Post'),
                        ),
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
