import 'package:brewcrew/models/brew.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  //Collection reference
  final CollectionReference brewCollection =
      Firestore.instance.collection('brew');

  Future updateUserData(String sugar, String name, int stength) async {
    return await brewCollection.document('uid').setData({
      'sugar': sugar,
      'name': name,
      'strength': stength,
    });
  }

  //list of brew data
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Brew(
        name: doc.data['name'] ?? '',
        strength: doc.data['strength'] ?? '0',
        sugar: doc.data['sugar'] ?? '0',
      );
    }).toList();
  }

  //Get Brew Stream
  Stream<List<Brew>> get brews {
    return brewCollection.snapshots().map(_brewListFromSnapshot);
  }
}
