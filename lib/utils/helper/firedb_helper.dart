import 'package:cloud_firestore/cloud_firestore.dart';

import '../../screen/home/model/home_model.dart';

class FireHelper{

  static FireHelper helper = FireHelper._();
  FireHelper._();

  var db=FirebaseFirestore.instance;

  Future<void> add(dbModel model)
  async {
    await db.collection("shop").add({"product":model.product,"price":model.price,"qua":model.qua});
  }

  Future<List<dbModel>> readFire() async {
    QuerySnapshot data = await db.collection("shop").get();
    List<QueryDocumentSnapshot<Object?>> data1=data.docs;
    List<dbModel> model=data1.map((e) => dbModel.mapToModel(e.data()! as Map,e.id),).toList();
    return model;
  }

  Future<void> update(dbModel model) async {
    await db.collection("shop").doc(model.id).set({"product": model.product,"price": model.price,"quality":model.qua});
  }

  Future<void> delete(String docId) async {
    await db.collection("shop").doc(docId).delete();
  }
  
}