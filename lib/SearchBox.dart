import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  final  TextEditingController controller;
  final String hintText;
  final ValueChanged<String>? onChanged;

  const SearchBox({
    Key? key,
    required this.controller,
    this.hintText = 'Search',
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size screenSize = MediaQuery.of(context).size;

    return Container(
      width: screenSize.width*0.98,
      height: screenSize.height*0.042,

      padding: EdgeInsets.symmetric(horizontal: screenSize.width*0.035),

      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[300],
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
          prefixIconConstraints: BoxConstraints(
            minHeight: screenSize.height * 0.025,
            minWidth: screenSize.height * 0.035,
          ),
          suffixIcon: IconButton(
            icon: const Icon(Icons.mic, color: Colors.grey),
            onPressed: () {
              // Trigger voice input or speech recognition
            },
          ),
          hintText: "Search",
          contentPadding: EdgeInsets.symmetric(
            vertical: screenSize.height * 0.009, // Responsive vertical padding
            horizontal: 0,
          ),
          hintStyle: const TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}