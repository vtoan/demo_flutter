import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:day2/student.dart';

class JsonPage extends StatefulWidget {
  @override
  _JsonPageState createState() => _JsonPageState();
}

class _JsonPageState extends State<JsonPage> {
  String _data = '';
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Load Json File From Local"),
      ),
      body: Center(
        child: buildFutureBuilderAssets(context),
      ),
    );
  }

  FutureBuilder<String> buildFutureBuilderAssets(BuildContext context) {
    return FutureBuilder(
      future:
          DefaultAssetBundle.of(context).loadString("assets/emprecord.json"),
      builder: (context, snapshot) {
        ;
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Text("Press button to start");
          case ConnectionState.active:
          case ConnectionState.waiting:
            return CircularProgressIndicatorPage();
          case ConnectionState.done:
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              List<Student> listStudent = parseJson(snapshot.data.toString());
              return listStudent.isNotEmpty
                  ? new ListEmployee(students: listStudent)
                  : new Text("file is empty");
            }
        }
        return null;
      },
    );
  }

  String getStringFromBytes(ByteData data) {
    final buffer = data.buffer;
    var list =
        buffer.asUint8ClampedList(data.offsetInBytes, data.lengthInBytes);
    return utf8.decode(list);
  }

  List<Student> parseJson(String response) {
    if (response == null) {
      return [];
    }
    final parsed =
        json.decode(response.toString()).cast<Map<String, dynamic>>();
    return parsed.map<Student>((json) => new Student.fromJson(json)).toList();
  }
}

class ListEmployee extends StatelessWidget {
  List<Student> students;
  ListEmployee({this.students});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(students[index].name),
          subtitle: Text(students[index].adress),
        );
      },
      itemCount: students == null ? 0 : students.length,
    );
  }
}

class CircularProgressIndicatorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: new CircularProgressIndicator(
      backgroundColor: Colors.blue,
    ));
  }
}
