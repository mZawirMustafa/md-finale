import 'dart:convert';

import 'package:final_project/pages/post_page.dart';
import 'package:flutter/material.dart';

import 'package:web_socket_channel/web_socket_channel.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _controllerName = TextEditingController();
  final channel =
      WebSocketChannel.connect(Uri.parse('ws://besquare-demo.herokuapp.com'));

  bool _buttonAllowStatus = false;

  @override
  void initState() {
    _controllerName.addListener(_ifSignUpValid);

    super.initState();
  }

  void _ifSignUpValid() {
    setState(() {
      if (_controllerName.text.isNotEmpty) {
        _buttonAllowStatus = true;
      } else {
        _buttonAllowStatus = false;
      }
    });
  }

  @override
  void dispose() {
    _controllerName.dispose();

    super.dispose();
  }

  void sendData() {
    channel.sink.add(
        '{ "type": "sign_in", "data": { "name" : "${_controllerName.text}"}}');
    print('${_controllerName.text} sign in success');
    _controllerName.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Log In",
          style: TextStyle(color: Colors.blueAccent),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 15.0, 0, 0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome to ',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Flitter',
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.only(left: 50.0, right: 50.0),
              child: TextFormField(
                decoration: new InputDecoration(
                  labelText: 'Username',
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
                    value!.isEmpty ? 'Username can\'nt be empty' : null,
                controller: _controllerName,
                // onSaved: (value) => _name = value,
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            Container(
              width: 250,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.black, // background
                  onPrimary: Colors.blueAccent,
                  onSurface: Colors.black, // foreground
                ),
                onPressed: !_buttonAllowStatus
                    ? null
                    : () {
                        sendData();

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  PostPage(postchannel: channel)),
                        );
                      },
                child: const Text('Sign In'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
