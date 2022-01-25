import 'package:b_sims/src/config/const.dart';
import 'package:b_sims/src/config/model/jasa_model.dart';
import 'package:flutter/material.dart';

class ListTableJasa extends StatefulWidget {
  const ListTableJasa({Key? key}) : super(key: key);

  @override
  _ListTableJasaState createState() => _ListTableJasaState();
}

class _ListTableJasaState extends State<ListTableJasa> {
  @override
  Widget build(BuildContext context) {
    return PaginatedDataTable(
      rowsPerPage: 5,
      showCheckboxColumn: false,
      availableRowsPerPage: const <int>[5, 10, 20],
      columns:
          kListHeaderTableJasa.map((e) => DataColumn(label: Text(e))).toList(),
      source: KepelabuhanTableSource(),
    );
  }
}

class KepelabuhanTableSource extends DataTableSource {
  int _selectedIndex = 0;
  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= kListJasa.length) return null;

    final Jasa jasa = kListJasa[index];

    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text(jasa.puk)),
        DataCell(Text(jasa.pkk)),
        DataCell(Text(jasa.kapal)),
        DataCell(Text(jasa.jasa)),
        DataCell(Text(jasa.status)),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => kListJasa.length;

  @override
  int get selectedRowCount => _selectedIndex;
}
