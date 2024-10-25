import 'package:final_exam/modal/Modal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/controller.dart';
import '../Screens/home_page.dart';

Widget addDataDialog(
  double w,
  double h,
) {
  return AlertDialog(
    title: Text("Add Data"),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: w * 0.9,
          child: TextFormField(
            controller: controller.txtId,
            decoration: InputDecoration(
              label: Text("Id"),
              border: OutlineInputBorder(),
            ),
          ),
        ),
        SizedBox(height: h * 0.01),
        SizedBox(
          width: w * 0.9,
          child: TextFormField(
            controller: controller.txtBook,
            decoration: InputDecoration(
              label: Text("Book"),
              border: OutlineInputBorder(),
            ),
          ),
        ),
        SizedBox(
          height: h * 0.01,
        ),
        SizedBox(
          width: w * 0.9,
          child: TextFormField(
            controller: controller.txtAuthor,
            decoration: InputDecoration(
              label: Text("Author"),
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    ),
    actions: [
      TextButton(
          onPressed: () {
            BookModal book = BookModal(
                title: controller.txtBook.text,
                author: controller.txtAuthor.text,
                status: controller.status.toString());

            CRUDServices().addDataToFireStore(book);
            clearField();
            Get.back();
          },
          child: Text('Save')),
      TextButton(
          onPressed: () {
            Get.back();
          },
          child: Text('Cancel')),
    ],
  );
}

Widget updateDataDialog(
    double w, double h, HomeController controller, int index, id) {
  // int pastId=controller.userInfoList[index].id!;

  controller.txtId =
      TextEditingController(text: controller.bookList[index].id.toString());
  controller.txtBook =
      TextEditingController(text: controller.bookList[index].name);
  controller.txtAuthor =
      TextEditingController(text: controller.bookList[index].email);

  return AlertDialog(
    title: Text("Update Data"),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: w * 0.9,
          child: TextFormField(
            controller: controller.txtId,
            decoration: InputDecoration(
              label: Text("Id"),
              border: OutlineInputBorder(),
            ),
          ),
        ),
        SizedBox(height: h * 0.01),
        SizedBox(
          width: w * 0.9,
          child: TextFormField(
            controller: controller.txtBook,
            decoration: InputDecoration(
              label: Text("Book"),
              border: OutlineInputBorder(),
            ),
          ),
        ),
        SizedBox(
          height: h * 0.01,
        ),
        SizedBox(
          width: w * 0.9,
          child: TextFormField(
            controller: controller.txtAuthor,
            decoration: InputDecoration(
              label: Text("Author"),
              border: OutlineInputBorder(),
            ),
          ),
        ),
        SizedBox(
          height: h * 0.01,
        ),
      ],
    ),
    actions: [
      TextButton(
          onPressed: () {
            BookModal userInfo = BookModal(
              author: controller.txtAuthor.text,
              status: controller.status.toString(),
              title: controller.txtBook.text,
            );

            CRUDServices().addDataToFireStore(userInfo);
            clearField();
            Get.back();
          },
          child: Text('Save')),
      TextButton(
          onPressed: () {
            Get.back();
          },
          child: Text('Cancel')),
    ],
  );
}


