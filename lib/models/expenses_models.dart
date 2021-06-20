class Expenses {
  int id;
  String nama;
  DateTime date;
  String jenis;
  int nominal;

  Expenses({this.nama, this.date, this.jenis, this.nominal});
  Expenses.withId({this.id, this.nama, this.date, this.jenis, this.nominal});

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    map['id'] = id;
    map['nama'] = nama;
    map['date'] = date.toIso8601String();
    map['jenis'] = jenis;
    map['nominal'] = nominal;
    return map;
  }

  factory Expenses.fromMap(Map<String, dynamic> map) {
    return Expenses.withId(
        id: map['id'],
        nama: map['nama'],
        date: DateTime.parse(map['date']),
        jenis: map['jenis'],
        nominal: map['nominal']);
  }
}
