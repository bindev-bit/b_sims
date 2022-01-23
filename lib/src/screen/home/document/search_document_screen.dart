import 'package:b_sims/src/widget/list_table.dart';
import 'package:flutter/material.dart';

class SearchDocumentScreen extends StatefulWidget {
  const SearchDocumentScreen({Key? key}) : super(key: key);

  @override
  State<SearchDocumentScreen> createState() => _SearchDocumentScreenState();
}

class _SearchDocumentScreenState extends State<SearchDocumentScreen> {
  bool _tapCari = false;

  final List<String> _listCari = [
    "Nomor PKK/PUK",
    "ID Kota",
    "Jenis Jasa",
    "Nama Kapal",
    "Status Jasa",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dokumen kepelabuhan"),
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
              Container(
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
                      "1. Filter data sesuai dengan kebutuhan pencarian",
                      style: TextStyle(
                        color: Colors.orange.shade500,
                      ),
                    ),
                    Text(
                      "2. Klik request rencana untuk lihat rencana PKK/PUK",
                      style: TextStyle(
                        color: Colors.orange.shade500,
                      ),
                    ),
                    Text(
                      "3. Klik tambah jasa baru untuk menginput jasa lain terkait PKK",
                      style: TextStyle(
                        color: Colors.orange.shade500,
                      ),
                    ),
                  ],
                ),
              ),
              ..._listCari.map(
                (e) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 5,
                        child: Text("$e :"),
                      ),
                      Expanded(
                        flex: 7,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 10,
                            ),
                            isDense: true,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: ElevatedButton.icon(
                  onPressed: () => setState(() {
                    _tapCari = true;
                  }),
                  label: const Text("Cari"),
                  icon: const Icon(Icons.search),
                ),
              ),
              Offstage(
                offstage: !_tapCari,
                child: const ListTableDocument(),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
