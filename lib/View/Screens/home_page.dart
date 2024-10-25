import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../AuthService/service.dart';
import '../../Controller/controller.dart';
import '../../utils/global.dart';
import '../Component/dialogBox.dart';

HomeController controller = Get.put(HomeController());

class HomePage extends StatelessWidget {
  const HomePage({super.key});



  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => addDataDialog(
              w,
              h,
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('Home'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 25,
                    child: Text(
                      FirebaseAuth.instance.currentUser!.email
                          .toString()[0]
                          .toUpperCase(),
                    ),
                  ),
                  Text(FirebaseAuth.instance.currentUser!.email.toString()),
                ],
              ),
            ),
            ListTile(
              onTap: () {
                AuthService().logout();
                Get.snackbar(
                    FirebaseAuth.instance.currentUser!.email.toString(),
                    "is Logged Out");
                Get.offAllNamed('/login');
              },
              title: Text('Log Out'),
              leading: Icon(Icons.logout),
            )
          ],
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: CRUDServices().readDataFromFireStore(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            Center(
              child: Text(snapshot.error.toString()),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            children: snapshot.data!.docs
                .map(
                  (DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data()! as Map<String, dynamic>;
                    return Container(

                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 25,
                          child: Text(
                            data['status'].toString(),
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                        title: Text(data['author']),
                        subtitle: Text(
                          data['title'],
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                    );
                  },
                )
                .toList()
                .cast(),
          );
        },
      ),
    );
  }
}

void clearField() {
  controller.txtId.clear();
  controller.txtBook.clear();
  controller.txtAuthor.clear();
}
