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
  Future<dynamic> getData({
    required String path,
    String? docID,
    Map<String, dynamic>? query,
  }) async {
    if (docID != null) {
      final snapshot = await firestore.collection(path).doc(docID).get();
      final data = snapshot.data();
      return data;
    } else {
      Query<Map<String, dynamic>> data = firestore.collection(path);
      if (query != null) {
        if (query['field'] != null && query['isEqualTo'] != null) {
          data = data.where(query['field'], isEqualTo: query['isEqualTo']);
        }
        if (query['orderBy'] != null) {
          if (query['descending'] != null) {
            data = data.orderBy(
              query['orderBy'],
              descending: query['descending'],
            );
          } else {
            data = data.orderBy(query['orderBy']);
          }
        }
        if (query['limit'] != null) {
          data = data.limit(query['limit']);
        }
      }
      final snapshot = await data.get();
      final result = snapshot.docs.map((e) => e.data()).toList();
      return result;
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
