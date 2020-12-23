import 'package:flutter/material.dart';
import 'package:photosearcher/photo_viewer_page.dart';
import 'package:photosearcher/src.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

Future<Map> getPics(String category) async {
  String url =
      'https://pixapay.com/api/?key=$apiKey&q=$category&image_type=photo&pretty=true';
  http.Response response = await http.get(url);
  return json.decode(response.body);
}

class MyApp extends StatelessWidget {
  var _categoryNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        color: Colors.white,
        child: Center(
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(30.0),
              ),
              FlutterLogo(),
              SizedBox(
                height: 20.0,
              ),
              ListTile(
                title: TextFormField(
                  controller: _categoryNameController,
                  decoration: InputDecoration(
                    labelText: 'Enter a category',
                    hintText: 'dogs,bikes,cats..',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                ),
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                subtitle: Material(
                  color: Colors.lightBlue,
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
              ListTile(
                title: Material(
                  color: Colors.lightBlue,
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(25.0),
                  child: MaterialButton(
                    child: Text(
                      'Search',
                      style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return SecondPage(
                          category: 'surya',
                        );
                      }));
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
