import 'package:b_sims/src/config/const.dart';
import 'package:b_sims/src/config/model/puk_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadDocumentController extends GetxController {
  RxBool showSetAs = false.obs;

  tapShowSetAs() {
    showSetAs.value = true;
  }

  tapHideSetAs() {
    showSetAs.value = false;
  }
}

class UploadDocumentKedatangan extends StatefulWidget {
  UploadDocumentKedatangan({Key? key}) : super(key: key);

  @override
  State<UploadDocumentKedatangan> createState() =>
      _UploadDocumentKedatanganState();
}

class _UploadDocumentKedatanganState extends State<UploadDocumentKedatangan> {
  final UploadDocumentController controller =
      Get.put(UploadDocumentController());

  String jenisFileValue = "satu";
  String terminalValue = "satu";

  final List<String> jenisFileDropown = [
    'satu',
    'dua',
    'tiga',
    'empat',
    'lima',
  ];

  final List<String> terminalDropdown = [
    'satu',
    'dua',
    'tiga',
    'empat',
    'lima',
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            title: const Text("Upload document PUK"),
            centerTitle: false,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Offstage(
                    offstage: !controller.showSetAs.value,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Row(
                            children: const [
                              Text("Nomor PUK"),
                              SizedBox(
                                width: 10,
                              ),
                              Text("210009137/BM"),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Jenis file"),
                              DropdownButton<String>(
                                value: jenisFileValue,
                                dropdownColor: Colors.white,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    jenisFileValue = newValue!;
                                  });
                                },
                                items: jenisFileDropown
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Terminal"),
                              DropdownButton<String>(
                                value: terminalValue,
                                dropdownColor: Colors.white,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    terminalValue = newValue!;
                                  });
                                },
                                items: terminalDropdown
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: ElevatedButton.icon(
                                  icon: const Icon(
                                    Icons.add,
                                  ),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title:
                                              const Text("Konfirmasi set file"),
                                          content: const Text(
                                            "Set File : Form_Puk 19192.pdf, Sebagai: Form 1D ?",
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              child: const Text("Kembali"),
                                              style: ElevatedButton.styleFrom(
                                                primary: Colors.white,
                                              ),
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                int count = 0;
                                                Navigator.popUntil(context,
                                                    (route) {
                                                  return count++ == 2;
                                                });
                                              },
                                              child: const Text("Continue"),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  label: const Text("Tambah"),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: ElevatedButton.icon(
                                  icon: const Icon(
                                    Icons.close,
                                    color: primaryColor,
                                  ),
                                  onPressed: () => controller.tapHideSetAs(),
                                  label: const Text(
                                    "Tutup",
                                    style: TextStyle(
                                      color: primaryColor,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Offstage(
                    offstage: controller.showSetAs.value,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.yellow.shade100,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.info,
                                color: Colors.orange.shade500,
                                size: 24,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Info : ",
                                style: TextStyle(
                                  color: Colors.orange.shade500,
                                  fontSize: 22,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Klik untuk download, delete dan Set File terkait sesuai kebutuhan PKK untuk menginput jasa lain terkait PKK ",
                            style: TextStyle(
                              color: Colors.orange.shade500,
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                              onPressed: () => controller.tapShowSetAs(),
                              child: const Text("Upload file"),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const ListTableUploadDocumentPuk(),
                ],
              ),
            ),
          ),
        ));
  }
}

class ListTableUploadDocumentPuk extends StatelessWidget {
  const ListTableUploadDocumentPuk({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PaginatedDataTable(
      rowsPerPage: 5,
      showCheckboxColumn: false,
      availableRowsPerPage: const <int>[5, 10, 20],
      columns: kListHeaderTableUploadDocument
          .map((e) => DataColumn(label: Text(e)))
          .toList(),
      source: KedatanganTableSource(),
    );
  }
}

class KedatanganTableSource extends DataTableSource {
  int _selectedIndex = 0;
  final UploadDocumentController controller =
      Get.put(UploadDocumentController());

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= kListPukDocument.length) return null;

    final PUKDocument pukDocument = kListPukDocument[index];

    return DataRow.byIndex(
      index: index,
      selected: pukDocument.selected,
      onSelectChanged: (value) {
        if (pukDocument.selected != value) {
          _selectedIndex += value! ? 1 : -1;
          assert(_selectedIndex >= 0);
          pukDocument.selected = value;
          notifyListeners();
        }
      },
      cells: [
        DataCell(ElevatedButton(
          onPressed: () {
            controller.tapShowSetAs();
          },
          child: const Text("Set as"),
        )),
        DataCell(Text(pukDocument.filename)),
        DataCell(Text(pukDocument.filetype)),
        DataCell(Text(pukDocument.uploadBy)),
        DataCell(Text(pukDocument.uploadAt)),
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
