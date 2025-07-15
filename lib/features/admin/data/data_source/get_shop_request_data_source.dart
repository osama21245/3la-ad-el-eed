import 'package:cloud_firestore/cloud_firestore.dart';

abstract interface class GetShopRequestDataSource {
  Future<List<Object?>> getShopRequest();
}

class GetShopRequestDataSourceImpl implements GetShopRequestDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<List<Map<String, dynamic>>> getShopRequest() async {
    CollectionReference collectionReference = _firestore.collection(
      "shop category request",
    );
    QuerySnapshot response = await collectionReference.get();
    List<Map<String, dynamic>> data =
        response.docs.map((doc) {
          Map<String, dynamic> docData = {};
          docData.addAll(doc.data() as Map<String, dynamic>);
          return docData;
        }).toList();
    return data;
  }
}
