import 'package:flutter/material.dart';

import 'SearchBox.dart';

class BlankPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      appBar: AppBar(
        title: Text(
          "Notes",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),

        ),
        backgroundColor: Colors.white,
      ),




    );
  }

}