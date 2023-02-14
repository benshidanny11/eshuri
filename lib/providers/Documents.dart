import 'package:flutter/foundation.dart';

import '../models/Document.dart';
import '../utils/firabase_util.dart';

class DocumentsProvider extends ChangeNotifier {

   Future<List<Document>> getDocuments() async {
    final res = await getCollectionReference('documents').get();
    List<Document> documents = [];

    for (var doc in res.docs) {
      documents.add(Document.fromJSON(doc));
    }
    return documents;
  }

  
}