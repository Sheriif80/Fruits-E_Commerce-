import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruits_e_commerce_app/core/services/database_service.dart';

class FirestoreService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    await firestore.collection(path).add(data);
  }

  @override
  Future<Map<String, dynamic>> getData({
    required String path,
    required String userId,
  }) async {
    final snapshot = await firestore.collection(path).doc(userId).get();
    final data = snapshot.data();

    if (data == null) {
      throw StateError('User doc not found: $path/$userId');
    }
    return data; // Map<String, dynamic>
  }
}
