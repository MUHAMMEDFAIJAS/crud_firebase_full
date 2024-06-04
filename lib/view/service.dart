import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lastproject/model/model.dart';

class Service {
  // CollectionReference firebase =
  //     FirebaseFirestore.instance.collection('collections');

  String collectionref = 'colect';
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  late final CollectionReference<Servicemodel> studentref =
      firestore.collection(collectionref).withConverter<Servicemodel>(
            fromFirestore: (snapshot, options) =>
                Servicemodel.fromJson(snapshot.data() ?? {}),
            toFirestore: (value, options) => value.toJson(),
          );

  Future<void> adddata(Servicemodel model) async {
    await studentref.add(model);
  }

  Stream<QuerySnapshot<Servicemodel>> getdata() {
    return studentref.snapshots();
  }

  Future<void> deletedata(String id) async {
    await studentref.doc(id).delete();
  }

  Future<void> update(Servicemodel model, String id) async {
    await studentref.doc(id).update(model.toJson());
  }
  // Future<Servicemodel> adddata(Servicemodel model) async {
  //   await firebase.add(model.toJson());
  //   return model;
  // }

  // Stream<List<Servicemodel>> getdata() {
  //   return firebase.snapshots().map((snapshot) => snapshot.docs
  //       .map((doc) => Servicemodel.fromJson(doc.data() as Map<String, dynamic>))
  //       .toList());
  // }
}
