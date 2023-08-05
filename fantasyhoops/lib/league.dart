import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class League extends StatefulWidget {
  const League({Key? key}) : super(key: key);

  @override
  _LeagueState createState() => _LeagueState();
}

class _LeagueState extends State<League> {
  late List<dynamic> info = [];

  Future getStandings() async {
    http
        .post(
      Uri.parse('http://10.0.2.2:5000/standings'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    )
        .then((response) {
      if (response.statusCode == 200) {
        List<dynamic> result = jsonDecode(response.body);
        print(result);
        setState(() {
          info = result;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getStandings();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: info.isNotEmpty ? ListView.builder(
        itemCount: info.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(info[index]['teamName']),
          );
        },
      )
      : const CircularProgressIndicator()
    );
  }
}
