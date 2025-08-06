import '../../../../core/comman/classes/firestore_services.dart';

class CreateZoneOnMapRepo {
  CreateZoneOnMapRepo({required this.firestoreService});
  final FirestoreService firestoreService;

  Future<void> fetchZone({required data}) async {
    try {
      await firestoreService.addData(collectionPath: 'zones', data: data);
      print('zone added successfully');
    } catch (error) {
      throw Exception('Failed to create zone: $error');
    }
  }
}
