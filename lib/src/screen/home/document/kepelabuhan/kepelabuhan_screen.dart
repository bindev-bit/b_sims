import 'package:b_sims/src/screen/home/document/kepelabuhan/list_document_kepelabuhan.dart';
import 'package:b_sims/src/widget/custom_card.dart';
import 'package:flutter/material.dart';

class DokumenKepelabuhan extends StatelessWidget {
  const DokumenKepelabuhan({Key? key}) : super(key: key);

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
                      builder: (context) => const ListDocumentKepelabuhan(),
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
