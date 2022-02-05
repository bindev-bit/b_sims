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
    puk: "220001564/BM",
    pkk: "21222",
    kapal: "TOLL EMPEROR, LCT",
    jasa: "Jasa Pandu",
    status: "Verifikasi oleh PPAT",
  ),
];
