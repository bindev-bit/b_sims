class SearchModel {
  String idJasa;
  String jenis;
  String pelabuhan;
  String noPUK;
  String status;
  String formNota;
  String action;
  bool selected;

  SearchModel({
    required this.idJasa,
    required this.jenis,
    required this.pelabuhan,
    required this.noPUK,
    required this.status,
    required this.formNota,
    required this.action,
    this.selected = false,
  });
}

List<SearchModel> kListSearch = [
  SearchModel(
    idJasa: "2022015709",
    jenis: "Jasa Pandu",
    pelabuhan:
        "Terminal Umum Roro Sekupang - WILAYAH DLKr/DLKp SEKUPANG Nama Kapal : TOLL EMPEROR, LCT",
    noPUK: "220001564/BM",
    status: "Verifikasi oleh PPAT",
    formNota: "NUSABHAKTI TATASEGARA, PT",
    action: "action",
  ),
];
