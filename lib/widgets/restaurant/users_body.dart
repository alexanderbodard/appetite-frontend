import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UsersBody extends StatelessWidget {

  Widget build(BuildContext context) {
    return TestApp();
  }
}

class TestAppState extends State<TestApp> {
  Future<List<User>> users;

  Widget build(BuildContext context) {
    return FutureBuilder<List<User>>(
      future: users,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data.map((user) => user.username).join('\n'));
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        // By default, show a loading spinner.
        return CircularProgressIndicator();
      },
    );
  }

  @override
  void initState() {
    super.initState();
    users = fetchUsers();
  }
}

class TestApp extends StatefulWidget {
  TestAppState createState() => TestAppState();
}



class User {
  final String url;
  final String username;
  final String email;

  User({this.url, this.username, this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      url: json['url'],
      username: json['username'],
      email: json['email'],
    );
  }
}

Future<List<User>> fetchUsers() async {
  final response =
    await http.get('http://dondernemers.be/users/');

  if (response.statusCode == 200) {
    // If server returns an OK response, parse the JSON.
    return List<User>.from(json.decode(response.body).map((user) => User.fromJson(user)).toList());
  } else {
    // If that response was not OK, throw an error.
    throw Exception('Failed to load post');
  }
}
