import 'package:erangaapp/models/Document.dart';

import '../models/Car.dart';
import '../utils//firabase_util.dart';

class DocumentsService {

  Future<List<Document>> getDocuments() async {
    final res = await getCollectionReference('documents').get();
    List<Document> documents = [];

    for (var doc in res.docs) {
      documents.add(Document.fromJSON(doc));
    }
    return documents;
  }
  
}
