import 'dart:io';
import 'dart:typed_data';
import 'dart:core';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:day2/student.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  copyDB() async {
    Directory documentsDirectory = await getApplicationSupportDirectory();
    String path = join(documentsDirectory.path, "student.db");

    if (FileSystemEntity.typeSync(path) == FileSystemEntityType.notFound) {
      ByteData data = await rootBundle.load(join("assets", "student.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      await new File(path).writeAsBytes(bytes);
    }
  }

  openDB() async {
    Directory appDocDir = await getApplicationSupportDirectory();
    String databasePath = join(appDocDir.path, "student.db");
    return await openDatabase(databasePath);
  }

  Future<List<Student>> getStudents() async {
    List<Student> data = new List<Student>();
    Database db = await openDB();

    var list = await db.query("Students");
    for (var item in list.toList()) {
      data.add(
          Student(id: item["id"], name: item["name"], adress: item["address"]));
    }
    db.close();
    return data;
  }

  Future<int> insertStudent(Student student) async {
    Database db = await openDB();
    Map<String, String> values = {
      "name": student.name,
      "address": student.adress
    };

    var result = db.insert("Students", values);
    db.close();
    return result;
  }

  Future<int> updateStudent(Student student) async {
    Database db = await openDB();
    Map<String, String> values = {
      "name": student.name,
      "address": student.adress
    };

    var result =
        db.update("Students", values, where: "id=?", whereArgs: [student.id]);
    db.close();
    return result;
  }

  Future<int> deleteStudent(int id) async {
    Database db = await openDB();

    var result = db.delete("Students", where: "id=?", whereArgs: [id]);
    db.close();
    return result;
  }

  countStudent() async {
    Database db = await openDB();
    var count = Sqflite.firstIntValue(
        await db.rawQuery("SELECT COUNT(*) FORM Students"));
    db.close();
    return count;
  }
}
