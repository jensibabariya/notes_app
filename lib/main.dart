import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/mycontroller.dart';
import 'package:notes_app/note.dart';

void main() {
  runApp(GetMaterialApp(
    theme: ThemeData(
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.white, foregroundColor: Colors.black)),
    debugShowCheckedModeBanner: false,
    home: Dashboard(),
  ));
}

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Mycontroller m = Get.put(Mycontroller());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    m.get_Database();

  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            drawer: Drawer(),
            appBar: AppBar(leading: Icon(CupertinoIcons.home,color: Colors.indigo[900]),
              title: Text(
                "Note App",
              ),
              actions: [
                IconButton(onPressed: () {}, icon: Icon(Icons.search,color: Colors.indigo[900],)),
                IconButton(onPressed: () {}, icon: Icon(Icons.more_vert,color:  Colors.indigo[900],))
              ],
            ),
            floatingActionButton: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Notes();
                    },
                  ));
                },
                child: Icon(CupertinoIcons.add_circled_solid, color: Colors.indigo[900], size: 40)),
            body: Obx(() => Container(
                  margin: EdgeInsets.all(5),
                  child: ListView.builder(
                    itemCount: m.l.length,
                    itemBuilder: (context, index) {
                      int a;
                      a=index;
                      return Container(
                        margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: (index%2==0)?Colors.deepPurple[50]:Colors.lightGreen[50]),
                        child: ListTile(onLongPress: () {


                        },
                            title: Text(
                              "${m.l.value[index]['note']}",
                              textAlign: TextAlign.start,
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                            ),
                            subtitle: Text(
                              "${m.l.value[index]['name']}",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 14),
                              maxLines: 1,
                              textAlign: TextAlign.start,
                            ),
                            trailing: Wrap(
                              children: [
                                IconButton(onPressed: () {

                            m.get_delete(m.l.value[index]['id']);
                            Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                            return Dashboard();
                            },
                            ));
                            }, icon: Icon(
                              Icons.close,
                              color: Colors.black,
                              size: 15,
                            ) ),

                                SizedBox(width: 5,),
                                Text("${DateFormat.MMMMd().format(DateTime.now())}",textAlign: TextAlign.end, )
                              ],
                            )),
                      );
                    },
                  ),
                ))
            // body: Obx(() => GridView.builder(
            //       itemCount: m.l.length,
            //       gridDelegate:
            //           SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            //       itemBuilder: (context, index) {
            //         return Card(
            //             margin: EdgeInsets.all(25),
            //             child: Container(
            //               decoration: BoxDecoration(
            //                   color: Colors.white,
            //                   border: Border.all(color: Colors.black),
            //                   borderRadius: BorderRadius.circular(5)),
            //               child: Column(
            //                 children: [
            //                   Container(
            //                     decoration: UnderlineTabIndicator(
            //                         borderSide: BorderSide(
            //                             color: Colors.black, strokeAlign: 9)),
            //                     margin: EdgeInsets.all(5),
            //                     child: Text(
            //                       '${m.l.value[index]['note']}',
            //                       style: TextStyle(
            //                           // decoration: TextDecoration.underline,
            //                           fontSize: 18,
            //                           fontWeight: FontWeight.bold,
            //                           color: Colors.black),
            //                     ),
            //                   ),
            //                   SizedBox(
            //                     height: 20,
            //                   ),
            //                   Container(
            //                       margin: EdgeInsets.all(5),
            //                       child: ),
            //                   SizedBox(height: 30,),
            //                   Row(crossAxisAlignment: CrossAxisAlignment.center,
            //                     mainAxisAlignment: MainAxisAlignment.end,
            //                     children: [
            //
            //

            //                     ],
            //                   )
            //                 ],
            //               ),
            //             ));
            //       },
            //     ))
            ));
  }
}
