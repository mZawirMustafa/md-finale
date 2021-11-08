import 'package:flutter/material.dart';

class DetailedPost extends StatefulWidget {
  DetailedPost({
    Key? key,
    required this.image,
    required this.name,
    required this.title,
    required this.desc,
  }) : super(key: key);
  final String image;
  final String name;
  final String desc;
  final String title;

  @override
  _DetailedPostState createState() =>
      _DetailedPostState(this.image, this.name, this.title, this.desc);
}

class _DetailedPostState extends State<DetailedPost> {
  _DetailedPostState(this.image, this.name, this.title, this.desc);

  String image;
  String name;
  String desc;
  String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.blueAccent),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('$title', style: TextStyle(color: Colors.blueAccent)),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Container(
              width: 300,
              height: 270,
              child: Image(
                width: 100,
                height: 100,
                image: NetworkImage('$image'),
                fit: BoxFit.fill,
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  return Container(
                      width: 100,
                      height: 100,
                      child: Image.asset('assets/error404.png'));
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              '$name',
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '$desc',
              style: TextStyle(fontSize: 15),
            )
          ],
        ),
      ),
    );
  }
}
