import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Reference getStorageReference() => FirebaseStorage.instance.ref();
CollectionReference getCollectionReference(collectionPath) =>
    FirebaseFirestore.instance.collection(collectionPath);
