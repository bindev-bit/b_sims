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
    noPUK: "210011234/BM",
    noPKK: "220001564/BM",
    perusahaan: "NUSABHAKTI TATASEGARA, PT",
    terminal: "Terminal Umum Roro Sekupang (Gerakan ke-1)",
  ),
];
