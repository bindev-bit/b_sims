class Kepelabuhan {
  String tglRegistrasi;
  String tglSubmit;
  String tglProses;
  String noPUK;
  String noPKK;
  String perusahaan;
  String terminal;
  bool selected;

  Kepelabuhan({
    required this.tglRegistrasi,
    required this.tglSubmit,
    required this.tglProses,
    required this.noPUK,
    required this.noPKK,
    required this.perusahaan,
    required this.terminal,
    this.selected = false,
  });
}

List<Kepelabuhan> kListKepelabuhan = [
  Kepelabuhan(
    tglRegistrasi: "12/10/22",
    tglSubmit: "13/10/22",
    tglProses: "15/10/22",
    noPUK: "1233441",
    noPKK: "1222",
    perusahaan: "PT SMOE Indonesia",
    terminal: "asdasd",
  ),
];
