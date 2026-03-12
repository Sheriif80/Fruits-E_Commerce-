abstract class DatabaseService {
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentID,
  });
  Future<dynamic> getData({
    required String path,
    String? docID,
    Map<String, dynamic>? query,
  });
  Future<List<Map<String, dynamic>>> searchData({
    required String path,
    required String field,
    required String query,
  });
  Future<bool> ifDataExists({required String path, required String docID});
}
