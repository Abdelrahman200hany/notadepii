import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nota/core/serviecs/data_base_services.dart';

class FireBaseStorageServices implements DataBaseServices {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentID,
  }) async {
    if (documentID == null) {
      await firestore.collection(path).add(data);
    } else {
      await firestore.collection(path).doc(documentID).set(data);
    }
  }

  // @override
  // Future readData({
  //   String? documentID,
  //   required String path,
  //   Map<String, dynamic>? query,
  // }) async {
  //   if (documentID != null) {
  //     var data = await firestore.collection(path).doc(documentID).get();
  //     return data.data() as Map<String, dynamic>;
  //   } else {
  //     CollectionReference<Map<String, dynamic>> data = firestore.collection(
  //       path,
  //     );

  //     if (query != null) {
  //       if (query['orderBy'] != null) {
  //         var orderByFeild = query['orderBy'];
  //         bool descending = query['descending'];
  //         data.orderBy(orderByFeild, descending: descending);
  //       }
  //       if (query['limit'] != null) {
  //         int limit = query['limit'];
  //         data.limit(limit);
  //       }
  //     }
  //     var result = await data.get();
  //     return result.docs.map((e) => e.data()).toList();
  //   }
  // }

  @override
  Stream readStreamData({
    String? documentID,
    required String path,
    Map<String, dynamic>? query,
  }) {
    if (documentID != null) {
      return firestore
          .collection(path)
          .doc(documentID)
          .snapshots()
          .map((doc) => doc.data());
    } else {
      Query<Map<String, dynamic>> data = firestore.collection(path);

      if (query != null) {
        if (query['orderBy'] != null) {
          data = data.orderBy(
            query['orderBy'],
            descending: query['descending'] ?? false,
          );
        }

        if (query['limit'] != null) {
          data = data.limit(query['limit']);
        }
      }

      return data.snapshots().map(
        (snapshot) => snapshot.docs.map((e) => e.data()).toList(),
      );
    }
  }

  @override
  Future<void> deleteData({
    required String documentID,
    required String path,
  }) async {
    await firestore.collection(path).doc(documentID).delete();
  }

  @override
  Future<void> upDateData({
    required String documentID,
    required String path,
    required Map<String, dynamic> data,
  }) async {
    await firestore.collection(path).doc(documentID).update(data);
  }
}
