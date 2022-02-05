import 'package:b_sims/src/screen/home/document/kedatangan/list_document_kedatangan.dart';
import 'package:b_sims/src/widget/custom_card.dart';
import 'package:flutter/material.dart';

class KedatanganScreen extends StatelessWidget {
  const KedatanganScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Permohonan kedatangan kapal"),
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
                  'Daftar permohonan',
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ListDocumentKedatangan(),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                CustomCard(
                  'Registrasi permohonan',
                  onTap: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
