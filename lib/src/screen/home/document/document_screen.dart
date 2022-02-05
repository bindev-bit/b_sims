import 'package:b_sims/src/config/const.dart';
import 'package:b_sims/src/screen/home/document/jasa/jasa_screen.dart';
import 'package:b_sims/src/screen/home/document/kedatangan/kedatangan_screen.dart';
import 'package:b_sims/src/screen/home/document/kepelabuhan/list_document_kepelabuhan.dart';
import 'package:b_sims/src/screen/home/document/kepelabuhan/search_kepelabuhan_screen.dart';
import 'package:b_sims/src/widget/custom_card.dart';
import 'package:flutter/material.dart';

class DocumentScreen extends StatelessWidget {
  const DocumentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 30,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "Kegiatan kepelabuhan",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Document(),
                        ),
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                      child: Row(
                        children: const [
                          Card(
                            child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Icon(
                                Icons.directions_boat,
                                color: primaryColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Dokumen kepelabuhan",
                            style: TextStyle(
                              fontSize: 16,
                              color: primaryColor,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const KedatanganScreen(),
                        ),
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                      child: Row(
                        children: const [
                          Card(
                            child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Icon(
                                Icons.anchor_outlined,
                                color: primaryColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Pengajuan kedatangan kapal",
                            style: TextStyle(
                              fontSize: 16,
                              color: primaryColor,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const JasaScreen(),
                        ),
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                      child: Row(
                        children: const [
                          Card(
                            child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Icon(
                                Icons.anchor_outlined,
                                color: primaryColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Pengajuan jasa kepelabuhan",
                            style: TextStyle(
                              fontSize: 16,
                              color: primaryColor,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Document extends StatelessWidget {
  const Document({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dokumen kepelabuhan"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "Kegiatan kepelabuhan",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              children: [
                CustomCard(
                  'Daftar dokumen kepelabuhan',
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ListDocumentKepelabuhan(),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                CustomCard(
                  'Jasa pelabuhan',
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const JasaScreen(),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
