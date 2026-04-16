abstract class DataBaseServices {
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentID,
  });

  Future<dynamic> readData({
    String? documentID,
    required String path,
    Map<String, dynamic>? query,
 
  });
  Future<void> deleteData({required String documentID, required String path});
  Future<void> upDateData({
    required String documentID,
    required String path,
    required Map<String, dynamic> data,
  });
}
