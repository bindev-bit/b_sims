class PUKModel {
  String noPKK;
  String noPuk;
  String namaKapal;
  String terminal;
  String pelabuhanAsal;
  String pelabuhanTujuan;
  String tglKedatangan;
  String tglKeberangkatan;
  String submitStatus;
  String pukStatus;
  bool selected;

  PUKModel({
    required this.noPKK,
    required this.noPuk,
    required this.namaKapal,
    required this.terminal,
    required this.pelabuhanAsal,
    required this.pelabuhanTujuan,
    required this.tglKedatangan,
    required this.tglKeberangkatan,
    required this.submitStatus,
    required this.pukStatus,
    this.selected = false,
  });
}

List<PUKModel> kListPuk = [
  PUKModel(
    noPKK: "noPKK",
    noPuk: "noPuk",
    namaKapal: "namaKapal",
    terminal: "terminal",
    pelabuhanAsal: "pelabuhanAsal",
    pelabuhanTujuan: "pelabuhanTujuan",
    tglKedatangan: "tglKedatangan",
    tglKeberangkatan: "tglKeberangkatan",
    submitStatus: "submitStatus",
    pukStatus: "pukStatus",
  ),
];

class PUKDocument {
  String filename;
  String filetype;
  String uploadBy;
  String uploadAt;
  bool selected;

  PUKDocument({
    required this.filename,
    required this.filetype,
    required this.uploadBy,
    required this.uploadAt,
    this.selected = false,
  });
}

List<PUKDocument> kListPukDocument = [
  PUKDocument(
    filename: "filename",
    filetype: "filetype",
    uploadBy: "uploadBy",
    uploadAt: "uploadAt",
  ),
];
