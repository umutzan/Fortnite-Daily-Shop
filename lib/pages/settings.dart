import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class settings extends StatefulWidget {
  @override
  _settingsState createState() => _settingsState();
}

class _settingsState extends State<settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3e7296),
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "You Can Clear The Cache:",
                  style: TextStyle(fontSize: 22),
                ),
                TextButton(
                  onPressed: () async {
                    final cacheDir = await getTemporaryDirectory();

                    if (cacheDir.existsSync()) {
                      cacheDir.delete(recursive: true);
                      print("+++");
                    } else {
                      print("error");
                    }
                  },
                  child: Text(
                    "Clear",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
