import 'package:flutter/material.dart';

import 'SearchBox.dart';

import 'ToDoPage.dart';

class BlankPage extends StatefulWidget {
  @override
  State<BlankPage> createState() => _BlankPageState();
}

class _BlankPageState extends State<BlankPage> {


  final TextEditingController _firstController = TextEditingController();
  final TextEditingController _secondcontroller = TextEditingController();
  final FocusNode _firstFocus = FocusNode();

  final FocusNode _secondFocus = FocusNode();

  void _handleSubmitted(String value) {
    if (value
        .trim()
        .isNotEmpty) {
      setState(() {
        FocusScope.of(context).requestFocus(_secondFocus);
      });
    }
  }

  @override
  void dispose() {
    _firstController.dispose();
    _firstFocus.dispose();
    super.dispose();
  }


  Future<bool> _onWillPop() async {
    // Get the values from text controllers
    String headline = _firstController.text;
    String bodytext = _secondcontroller.text;

// Navigate to the next page and pass the data
    int itemcount=1;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ToDoPage(headline: headline, bodytext: bodytext),
      ),
    );

    return true;
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Notes",
            style: TextStyle(fontSize: 16,),
          ),
          backgroundColor: Colors.white,
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            children: [
              TextField(
                controller: _firstController,
                focusNode: _firstFocus,
                style: TextStyle(fontSize: 40),
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "",
                  contentPadding: EdgeInsets.only(left: 12),
                ),
                onSubmitted: _handleSubmitted,


              ),

              TextField(
                controller: _secondcontroller,
                focusNode: _secondFocus,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "",
                  contentPadding: EdgeInsets.only(left: 12),
                ),
              ),

            ],
          ),
        )
        ,
      ),
    );
  }
}






