import 'package:b_sims/src/screen/home/document/kedatangan/list_table_kedatangan.dart';
import 'package:flutter/material.dart';

import '../document_search_screen.dart';

class ListDocumentKedatangan extends StatelessWidget {
  const ListDocumentKedatangan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List dokumen PUK"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: Row(
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    label: const Text("Download"),
                    icon: const Icon(Icons.download),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    label: const Text("Sinkron data PUK"),
                    icon: const Icon(Icons.sync),
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.white,
              ),
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SearchDocumentScreen(),
                    ),
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Search table"),
                        Icon(Icons.search)
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20),
              child: ListTableKedatangan(),
            ),
          ],
        ),
      ),
    );
  }
}
