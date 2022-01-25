import 'package:b_sims/src/config/const.dart';
import 'package:b_sims/src/config/model/puk_model.dart';
import 'package:b_sims/src/screen/home/document/kedatangan/upload_document_kedatangan.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListTableKedatangan extends StatelessWidget {
  const ListTableKedatangan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PaginatedDataTable(
      rowsPerPage: 5,
      showCheckboxColumn: false,
      availableRowsPerPage: const <int>[5, 10, 20],
      columns:
          kListHeaderTablePuk.map((e) => DataColumn(label: Text(e))).toList(),
      source: KedatanganTableSource(),
    );
  }
}

class KedatanganTableSource extends DataTableSource {
  int _selectedIndex = 0;
  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= kListPuk.length) return null;

    final PUKModel pukModel = kListPuk[index];

    return DataRow.byIndex(
      index: index,
      selected: pukModel.selected,
      onSelectChanged: (value) {
        if (pukModel.selected != value) {
          _selectedIndex += value! ? 1 : -1;
          assert(_selectedIndex >= 0);
          pukModel.selected = value;
          notifyListeners();
        }
      },
      cells: [
        DataCell(ElevatedButton(
          onPressed: () => Get.to(UploadDocumentKedatangan()),
          child: const Text("Upload"),
        )),
        DataCell(Text(pukModel.noPKK)),
        DataCell(Text(pukModel.noPuk)),
        DataCell(Text(pukModel.namaKapal)),
        DataCell(Text(pukModel.terminal)),
        DataCell(Text(pukModel.tglKedatangan)),
        DataCell(Text(pukModel.tglKeberangkatan)),
        DataCell(Text(pukModel.pelabuhanAsal)),
        DataCell(Text(pukModel.pelabuhanTujuan)),
        DataCell(Text(pukModel.submitStatus)),
        DataCell(Text(pukModel.pukStatus)),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => kListPuk.length;

  @override
  int get selectedRowCount => _selectedIndex;
}
