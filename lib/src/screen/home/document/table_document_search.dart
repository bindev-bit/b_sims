import 'package:b_sims/src/config/const.dart';
import 'package:b_sims/src/config/model/kepelabuhan_model.dart';
import 'package:b_sims/src/config/model/search_model.dart';
import 'package:flutter/material.dart';

class ListTableSearch extends StatefulWidget {
  const ListTableSearch({Key? key}) : super(key: key);

  @override
  _ListTableSearchState createState() => _ListTableSearchState();
}

class _ListTableSearchState extends State<ListTableSearch> {
  @override
  Widget build(BuildContext context) {
    return PaginatedDataTable(
      rowsPerPage: 5,
      showCheckboxColumn: false,
      availableRowsPerPage: const <int>[5, 10, 20],
      columns: kListTableHeaderDokumenKepelabuhan
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
    if (index >= kListSearch.length) return null;

    final SearchModel search = kListSearch[index];

    return DataRow.byIndex(
      index: index,
      selected: search.selected,
      onSelectChanged: (value) {
        if (search.selected != value) {
          _selectedIndex += value! ? 1 : -1;
          assert(_selectedIndex >= 0);
          search.selected = value;
          notifyListeners();
        }
      },
      cells: [
        DataCell(Text(search.idJasa)),
        DataCell(Text(search.jenis)),
        DataCell(Text(search.pelabuhan)),
        DataCell(Text(search.noPUK)),
        DataCell(Text(search.status)),
        DataCell(Text(search.formNota)),
        DataCell(Text(search.action)),
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
