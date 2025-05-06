import 'package:flutter/material.dart';

import 'SearchBox.dart';

import 'BlankPage.dart';

class ToDoPage extends StatefulWidget {
  String headline;
  String bodytext;

  // Constructor to accept the data
  ToDoPage({Key? key, this.headline = '', this.bodytext = ''})
    : super(key: key);

  @override
  State<ToDoPage> createState() => _ToDoAppState();
}

class _ToDoAppState extends State<ToDoPage> {
  get searchController => null;

  //List<Map<String, String>> items = [];


  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    final TextEditingController searchController = TextEditingController();

    final List<String> items = [
      ...widget.headline.split('\n'),
      ...widget.bodytext.split('\n'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notes",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            // Main Column with SearchBox and ListView
            Column(
              children: [
                // Search Box
                SearchBox(
                  controller: searchController,
                  onChanged: (text) {
                    print("Search query: $text");
                  },
                ),

                // Scrollable list
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.only(
                      bottom:
                          screenSize.width * 0.19 +
                          16, // Leave space for bottom bar
                    ),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          items[index],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(widget.headline),
                      );
                    },
                  ),
                ),
              ],
            ),

            // Fixed Bottom Container
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: screenSize.width * 0.19,
                width: screenSize.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(color: Colors.grey, width: 0.5),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.only(
                          bottom: screenSize.height * 0.03,
                        ),
                        child: Text(
                          "0 Notes",
                          style: TextStyle(fontSize: 10, color: Colors.black87),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          right: 16.0,
                          bottom: 16.0,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            print("Note icon pressed");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BlankPage(),
                              ),
                            );
                          },
                          child: Image.asset(
                            'assets/icon/notes.png',
                            width: 30,
                            height: 30,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
