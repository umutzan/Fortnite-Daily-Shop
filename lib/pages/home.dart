import 'package:flutter/material.dart';
import 'package:fbr/pages/daily.dart';
import 'package:fbr/pages/settings.dart';
import 'package:fbr/pages/upcoming.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Color(0xFF3e7296),
        appBar: AppBar(
          elevation: 0,
          title: Text(
            "Shop For FBR",
            style: TextStyle(
              fontSize: 27,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => settings()));
              },
            ),
          ],
          bottom: TabBar(
            indicatorColor: Color(0xFF3e7296),
            tabs: [
              Tab(
                text: "Shop",
              ),
              Tab(
                text: "Upcomming",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            daily(),
            upcoming(),
          ],
        ),
      ),
    );
  }
}
