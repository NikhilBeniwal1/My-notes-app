import 'package:flutter/material.dart';
import '../models/note.dart';

class EditScreen extends StatefulWidget {
  final Note? note;
  const EditScreen({super.key, this.note});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();

  @override
  void initState() {
    // To do: impliment initState
    if (widget.note != null) {
      _titleController = TextEditingController(text: widget.note!.title);
      _contentController = TextEditingController(text: widget.note!.content);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 40, 16, 0),
        child: Column(
          children: [
            // back arrow button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  padding: EdgeInsets.all(0),
                  icon: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade800.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      )),
                )
              ],
            ),
            Expanded(
                child: ListView(
              children: [
                TextField(
                  controller: _titleController,
                  style: TextStyle(color: Colors.white, fontSize: 30),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Title",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 30)),
                ),
                TextField(
                  maxLines: null,
                  controller: _contentController,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Type something here...",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      )),
                ),
              ],
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(
              context, [_titleController.text, _contentController.text]);
        },
        elevation: 10,
        backgroundColor: Colors.grey.shade800,
        child: Icon(Icons.save_as),
      ),
    );
  }
}
