class Student {
  int id;
  String name;
  String adress;
  Student({this.id, this.name, this.adress});

  factory Student.fromJson(Map<String, dynamic> res) {
    return new Student(
      name: res['espname'] as String,
      adress: res['department'] as String,
    );
  }
}
