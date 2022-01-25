class Jasa {
  String puk;
  String pkk;
  String kapal;
  String jasa;
  String status;

  Jasa(
      {required this.puk,
      required this.pkk,
      required this.kapal,
      required this.jasa,
      required this.status});
}

List<Jasa> kListJasa = [
  Jasa(
    puk: "213123",
    pkk: "21222",
    kapal: "kapal",
    jasa: "jasa",
    status: "status",
  ),
];
