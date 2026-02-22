import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruits_e_commerce_app/core/services/database_service.dart';

class FirestoreService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentID,
  }) async {
    if (documentID != null) {
      await firestore.collection(path).doc(documentID).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
  }

  @override
  Future<dynamic> getData({required String path, String? docID}) async {
    if (docID != null) {
      final snapshot = await firestore.collection(path).doc(docID).get();
      final data = snapshot.data();
      return data;
    } else {
      final snapshot = await firestore.collection(path).get();
      final data = snapshot.docs.map((doc) => doc.data()).toList();
      return data;
    }
  }

  @override
  Future<bool> ifDataExists({
    required String path,
    required String docID,
  }) async {
    final data = await firestore.collection(path).doc(docID).get();
    return data.exists;
  }
}
