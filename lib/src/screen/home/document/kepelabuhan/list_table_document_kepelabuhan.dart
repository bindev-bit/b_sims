import 'package:b_sims/src/config/const.dart';
import 'package:b_sims/src/config/model/kepelabuhan_model.dart';
import 'package:flutter/material.dart';

class ListTableKepelabuhan extends StatefulWidget {
  const ListTableKepelabuhan({Key? key}) : super(key: key);

  @override
  _ListTableKepelabuhanState createState() => _ListTableKepelabuhanState();
}

class _ListTableKepelabuhanState extends State<ListTableKepelabuhan> {
  @override
  Widget build(BuildContext context) {
    return PaginatedDataTable(
      rowsPerPage: 5,
      showCheckboxColumn: false,
      availableRowsPerPage: const <int>[5, 10, 20],
      columns: kListHeaderTableKepelabuhan
          .map((e) => DataColumn(label: Text(e)))
          .toList(),
      source: KepelabuhanTableSource(),
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
