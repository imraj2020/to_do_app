import 'package:flutter/material.dart';
import 'ToDoPage.dart';

class BlankPage extends StatefulWidget {
  final List<Map<String, String>> existingNotes;

  const BlankPage({Key? key, required this.existingNotes}) : super(key: key);

  @override
  State<BlankPage> createState() => _BlankPageState();
}

class _BlankPageState extends State<BlankPage> {
  final TextEditingController _headlineController = TextEditingController();
  final TextEditingController _bodyTextController = TextEditingController();
  final FocusNode _headlineFocus = FocusNode();
  final FocusNode _bodyTextFocus = FocusNode();

  void _handleSubmitted(String value) {
    if (value.trim().isNotEmpty) {
      setState(() {
        FocusScope.of(context).requestFocus(_bodyTextFocus);
      });
    }
  }

  @override
  void dispose() {
    _headlineController.dispose();
    _bodyTextController.dispose();
    _headlineFocus.dispose();
    _bodyTextFocus.dispose();
    super.dispose();
  }

  Future<bool> _onWillPop() async {
    String headline = _headlineController.text;
    String bodytext = _bodyTextController.text;

    if (headline.isNotEmpty || bodytext.isNotEmpty) {
      List<Map<String, String>> updatedNotes = [...widget.existingNotes];
      updatedNotes.add({
        'headline': headline,
        'bodytext': bodytext,
      });

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ToDoPage(notes: updatedNotes),
        ),
      );
    } else {
      Navigator.pop(context);
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Notes", style: TextStyle(fontSize: 16)),
          backgroundColor: Colors.white,
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            children: [
              TextField(
                controller: _headlineController,
                focusNode: _headlineFocus,
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "",
                  contentPadding: EdgeInsets.only(left: 12),
                ),
                onSubmitted: _handleSubmitted,
              ),
              TextField(
                controller: _bodyTextController,
                focusNode: _bodyTextFocus,
                style: TextStyle(fontSize: 16),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "",
                  contentPadding: EdgeInsets.only(left: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}