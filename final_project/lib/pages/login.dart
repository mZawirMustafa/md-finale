import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _controllerName = TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.blueAccent),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "Post Details Page",
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
                        final snackBar = SnackBar(
                          content: const Text('Signed in Successfully'),
                          action: SnackBarAction(
                            label: 'Dismiss',
                            onPressed: () {},
                          ),
                        );

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        _controllerName.clear();
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
