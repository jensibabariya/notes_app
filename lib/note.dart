import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:notes_app/main.dart';
import 'package:notes_app/mycontroller.dart';

class Notes extends StatefulWidget {
  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  Mycontroller m = Get.put(Mycontroller());
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Add Notes"),
        leading: InkWell(onTap: () {
          m.get_Database();
          m.get_insert(t1.text, t2.text);



          if(t1.text!=""&&t2.text!="")
            {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return Dashboard();
                },
              ));
            }
          else
            {

            }
        },
            child: Icon(
          CupertinoIcons.left_chevron,
          color: Colors.indigo[900],
        )),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          // Text(
          //   textAlign: TextAlign.start,
          //   "Add Tittle...",
          //   style: TextStyle(fontSize: 15, color: Colors.black),
          // ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            margin: EdgeInsets.all(10),
            child: TextField(
                cursorColor: Colors.black,
                autofocus: false,
                textAlign: TextAlign.start,
                textAlignVertical: TextAlignVertical.top,
                controller: t1,
                decoration: InputDecoration(
                  hintText: "Title",
                  border: InputBorder.none,
                )),
          ),
          // Text(
          //   //textAlign: TextAlign.start,
          //   maxLines: 5,
          //   "Add Note...",
          //   style: TextStyle(fontSize: 15, color: Colors.black),
          // ),
          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: TextField(
              cursorColor: Colors.black,
              autofocus: false,
              controller: t2,
              textAlignVertical: TextAlignVertical.top,
              decoration: InputDecoration(
                hintText: "Add Note..",
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 60.0),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
