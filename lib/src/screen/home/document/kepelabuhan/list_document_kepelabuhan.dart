import 'package:b_sims/src/screen/home/document/document_search_screen.dart';
import 'package:b_sims/src/screen/home/document/kepelabuhan/list_table_document_kepelabuhan.dart';
import 'package:flutter/material.dart';

class ListDocumentKepelabuhan extends StatefulWidget {
  const ListDocumentKepelabuhan({Key? key}) : super(key: key);

  @override
  _ListDocumentKepelabuhanState createState() =>
      _ListDocumentKepelabuhanState();
}

class _ListDocumentKepelabuhanState extends State<ListDocumentKepelabuhan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dokumen kepelabuhan"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 20,
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
              child: ListTableKepelabuhan(),
            ),
          ],
        ),
      ),
    );
  }
}
