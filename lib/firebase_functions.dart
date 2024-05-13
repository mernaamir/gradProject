import 'package:cloud_firestore/cloud_firestore.dart';

class firebaseFunctions{
  getData() async {
   QuerySnapshot querySnapshot= await FirebaseFirestore.instance.collection("Unversities").get();

  }
}