import 'package:cloud_firestore/cloud_firestore.dart';

import 'home_Reprository.dart';

class HomeRepositoryImplematation implements HomeRepository {
  CollectionReference get tarefas => FirebaseFirestore.instance.collection('/tarefas');
  @override
  Future<List<Map>> getRepository() async {
   return (await tarefas.get()).docs.map((e) =>{ 'name': e.data()['name']}).toList();
  }

  @override
  Stream<List<Map>> getStreamRepository() {
    return tarefas.snapshots().map((event) => event.docs.map((e) => {'name': e.data()["name"]}).toList());
  }

}