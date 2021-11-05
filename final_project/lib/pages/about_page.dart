import 'package:flutter/material.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({Key? key}) : super(key: key);

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
          "About Page",
          style: TextStyle(color: Colors.blueAccent),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Text(
              'About the Application',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 300,
              child: Text(
                'This plaque is to commemorate the brave pirates who gave their lives to keep this box safe from the Robot Menace. Lest we forget...',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Expanded(
                child: Align(
              alignment: FractionalOffset.bottomRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    child: Text(
                      "Application made possible by ",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Container(
                    child: Text(
                      "Zawir ",
                      style: TextStyle(fontSize: 12, color: Colors.blueAccent),
                    ),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
