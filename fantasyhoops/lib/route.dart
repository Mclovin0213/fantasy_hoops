import 'package:fantasyhoops/home.dart';
import 'package:fantasyhoops/league.dart';
import 'package:fantasyhoops/matchUp.dart';
import 'package:fantasyhoops/players.dart';
import 'package:fantasyhoops/roster.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class RoutePage extends StatefulWidget {
  const RoutePage({Key? key}) : super(key: key);

  @override
  State<RoutePage> createState() => _RoutePageState();
}

class _RoutePageState extends State<RoutePage> {
  int _selectedIndex = 0;
  static List<Widget>? _widgetOptions;

  @override
  void initState() {
    super.initState();
    _widgetOptions = [
      const Home(),
      const Roster(),
      const MatchUp(),
      const Players(),
      const League(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions!.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              LineIcons.basketballBall,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              LineIcons.clipboard,
            ),
            label: "Roster"
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.scoreboard,
            ),
            label: "MatchUps"
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.group,
            ),
            label: "Players"
          ),
          BottomNavigationBarItem(
            icon: Icon(
              LineIcons.trophy,
            ),
            label: "League"
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.white,
        iconSize: 22,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        onTap: _onItemTapped,
      ),
    );
  }
}
