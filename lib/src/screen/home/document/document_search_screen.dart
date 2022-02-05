import 'package:b_sims/src/screen/home/document/table_document_search.dart';
import 'package:flutter/material.dart';

class SearchDocumentScreen extends StatelessWidget {
  const SearchDocumentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pencarian ID PUK"),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: ListTableSearch(),
            ),
          ],
        ),
      ),
    );
  }
}
