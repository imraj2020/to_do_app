import 'package:flutter/material.dart';
import 'BlankPage.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'SearchBox.dart';

class ToDoPage extends StatefulWidget {
  final List<Map<String, String>> notes;

  ToDoPage({
    Key? key,
    this.notes = const [],
  }) : super(key: key);

  @override
  State<ToDoPage> createState() => _ToDoAppState();
}

class _ToDoAppState extends State<ToDoPage> {
  get searchController => null;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    final TextEditingController searchController = TextEditingController();

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



            Column(
              children: [


                // Search Box
                SearchBox(
                  controller: searchController,
                  onChanged: (text) {
                    print("Search query: $text");
                  },
                ),

                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.only(

                      left: 16,
                      right: 16,

                      bottom: screenSize.width * 0.19 + 16,
                    ),
                    itemCount: widget.notes.length,
                    itemBuilder: (context, index) {
                      final note = widget.notes[index];
                      return Slidable(
                        endActionPane: ActionPane(
                          motion: const DrawerMotion(),
                          children: [
                            SlidableAction(
                              onPressed: (context) {
                                // Share functionality
                                print('Share note: ${note['headline']}');
                              },
                              backgroundColor: Colors.blue.shade300,
                              icon: Icons.share,
                            ),
                            SlidableAction(
                              onPressed: (context) {
                                // Archive functionality
                                print('Archive note at index $index');
                              },
                              backgroundColor: Color(0xFF075EEF) ,
                              icon: Icons.archive,
                            ),
                            SlidableAction(
                              onPressed: (context) {
                                // Delete functionality
                                setState(() {
                                  widget.notes.removeAt(index);
                                });
                              },
                              backgroundColor: Colors.red.shade400,
                              icon: Icons.delete,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (note['headline']?.isNotEmpty ?? false)
                              Padding(
                                padding: EdgeInsets.only(left: 16, top: 8),
                                child: Text(
                                  note['headline']!,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            if (note['bodytext']?.isNotEmpty ?? false)
                              Padding(
                                padding: EdgeInsets.only(left: 16, bottom: 8),
                                child: Text(
                                  note['bodytext']!,
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            Divider(height: 1),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
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
                          "${widget.notes.length} Notes",
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BlankPage(existingNotes: widget.notes),
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