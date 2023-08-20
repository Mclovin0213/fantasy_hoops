import 'package:fantasyhoops/createLeague.dart';
import 'package:fantasyhoops/joinLeague.dart';
import 'package:flutter/material.dart';

class InitialLeague extends StatefulWidget {
  const InitialLeague({Key? key}) : super(key: key);

  @override
  _InitialLeagueState createState() => _InitialLeagueState();
}

class _InitialLeagueState extends State<InitialLeague> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black26
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            child: Text("Create League"),
            onPressed: () {
              setState(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder:
                      (BuildContext context) => CreateLeague()
                  )
                );
              });
            },
          ),
          ElevatedButton(
            child: Text("Join League"),
            onPressed: () {
              setState(() {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder:
                        (BuildContext context) => JoinLeague()
                    )
                );
              });
            },
          )
        ],
      ),
    );
  }
}
