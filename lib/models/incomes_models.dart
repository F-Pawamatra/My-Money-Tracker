class Incomes {
  int id;
  String nama;
  DateTime date;
  String jenis;
  int nominal;

  Incomes({this.nama, this.date, this.jenis, this.nominal});
  Incomes.withId({this.id, this.nama, this.date, this.jenis, this.nominal});

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    map['id'] = id;
    map['nama'] = nama;
    map['date'] = date.toIso8601String();
    map['jenis'] = jenis;
    map['nominal'] = nominal;
    return map;
  }

  factory Incomes.fromMap(Map<String, dynamic> map) {
    return Incomes.withId(
        id: map['id'],
        nama: map['nama'],
        date: DateTime.parse(map['date']),
        jenis: map['jenis'],
        nominal: map['nominal']);
  }
}
