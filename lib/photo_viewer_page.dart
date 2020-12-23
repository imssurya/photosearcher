import 'package:flutter/material.dart';
import 'package:photosearcher/main.dart';

class SecondPage extends StatefulWidget {
  String category;
  SecondPage({this.category});
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Photo Bay',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: FutureBuilder(
        builder: (context, snapshot) {
          Map data = snapshot.data;
          if (snapshot.hasError) {
            print(snapshot.error);
            return Text(
              'Failed to get responce from server',
              style: TextStyle(color: Colors.red, fontSize: 22.0),
            );
          } else if (snapshot.hasData) {
            return Center(
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(5.0),
                      ),
                      Container(
                        child: InkWell(
                          onTap: () {},
                          child: Image.network(
                              '${data['hits'][index]['largeImageURL']}'),
                        ),
                      )
                    ],
                  );
                },
              ),
            );
          } else if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
        future: getPics(widget.category),
      ),
    );
  }
}
