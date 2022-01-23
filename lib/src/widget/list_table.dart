import 'package:b_sims/src/config/const.dart';
import 'package:flutter/material.dart';

class ListTableDocument extends StatefulWidget {
  const ListTableDocument({Key? key}) : super(key: key);

  @override
  State<ListTableDocument> createState() => _ListTableDocumentState();
}

class _ListTableDocumentState extends State<ListTableDocument> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  @override
  Widget build(BuildContext context) {
    return PaginatedDataTable(
      rowsPerPage: 5,
      showCheckboxColumn: false,
      availableRowsPerPage: const <int>[5, 10, 20],
      columns:
          kListTableKepelabuhan.map((e) => DataColumn(label: Text(e))).toList(),
      source: KepelabuhanTableSource(),
      onRowsPerPageChanged: (value) {
        setState(() {
          _rowsPerPage = value!;
        });
      },
    );
  }
}

class KepelabuhanTableSource extends DataTableSource {
  int _selectedIndex = 0;
  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= kListKepelabuhan.length) return null;

    final Kepelabuhan kepelabuhan = kListKepelabuhan[index];

    return DataRow.byIndex(
      index: index,
      selected: kepelabuhan.selected,
      onSelectChanged: (value) {
        if (kepelabuhan.selected != value) {
          _selectedIndex += value! ? 1 : -1;
          assert(_selectedIndex >= 0);
          kepelabuhan.selected = value;
          notifyListeners();
        }
      },
      cells: [
        DataCell(Text(kepelabuhan.tglRegistrasi)),
        DataCell(Text(kepelabuhan.tglSubmit)),
        DataCell(Text(kepelabuhan.tglProses)),
        DataCell(Text(kepelabuhan.noPUK)),
        DataCell(Text(kepelabuhan.noPKK)),
        DataCell(Text(kepelabuhan.perusahaan)),
        DataCell(Text(kepelabuhan.terminal)),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => kListKepelabuhan.length;

  @override
  int get selectedRowCount => _selectedIndex;
}

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
