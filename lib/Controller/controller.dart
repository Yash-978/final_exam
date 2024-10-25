import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_exam/modal/Modal.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';




class HomeController extends GetxController
{
  var txtId=TextEditingController();
  var txtBook=TextEditingController();
  var txtAuthor=TextEditingController();
  bool? status;
  RxList bookList=[].obs;
}

class CRUDServices {
  User? user = FirebaseAuth.instance.currentUser;

  Future addDataToFireStore(BookModal book) async {
    try {
      await FirebaseFirestore.instance
          .collection("book")
          .doc(user!.email)
          .collection("bookData")
          .add(book.toMap());
      print('Document Added');
    } catch (e) {
      print("Error occur During the Data Addition in Firebase : $e");
    }
  }

  Stream<QuerySnapshot> readDataFromFireStore() async* {
    try {
      var bookData = FirebaseFirestore.instance
          .collection("book")
          .doc(user!.email)
          .collection("bookData").orderBy('title')
          .snapshots();
      yield* bookData;
    } catch (e) {
      print(e.toString());
    }
  }
  // Stream<QuerySnapshot> searchDataFromFireStore() async* {
  //   try {
  //     var bookData = FirebaseFirestore.instance
  //         .collection("book")
  //         .doc(user!.email)
  //         .collection("bookData").orderBy('name')
  //         .snapshots();
  //     yield* bookData;
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }
}
