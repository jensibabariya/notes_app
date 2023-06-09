import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Mycontroller extends GetxController
{
  RxString note="".obs,tittle="".obs;
RxList <Map>l=[{}].obs;
RxList <Map>ln=[{}].obs;
  static Database? database;
  get_Database() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo.db');

    Mycontroller.database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          // When creating the db, create the table
          await db.execute(
              'CREATE TABLE user(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT,note TEXT)');
        });
    get_select();
  }
  get_insert(String note,String tittle)
 {
    String sql="insert into user (name,note) values ('$tittle','$note')";

  Mycontroller.database!.rawInsert(sql);
    print("sql: ${sql}");
  }
  get_update(String nm,String not)
  {
    String sql1="update user set name='${nm}' and note='${not}'";
    Mycontroller.database!.rawUpdate(sql1);
  }
  get_select()
  async {
    String qry="select * from user";
   // Mycontroller.database!.rawQuery(qry);


    l.value= await Mycontroller.database!.rawQuery(qry);
    print("list ${l}");

  }

  get_delete(int id)
  {
    String qry2="delete from user where id='$id'";
    Mycontroller.database!.rawDelete(qry2);
  }
}