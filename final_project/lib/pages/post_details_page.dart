import 'package:flutter/material.dart';

class DetailedPost extends StatefulWidget {
  DetailedPost({Key? key}) : super(key: key);

  @override
  _DetailedPostState createState() => _DetailedPostState();
}

class _DetailedPostState extends State<DetailedPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Post Details Page"),
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
              child: Image.network(
                  'https://live.staticflickr.com/4111/5087455746_5371efe625_z.jpg'),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Title',
              style: TextStyle(fontSize: 25),
            ),
            Text(
              "'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'",
              style: TextStyle(fontSize: 15),
            )
          ],
        ),
      ),
    );
  }
}
