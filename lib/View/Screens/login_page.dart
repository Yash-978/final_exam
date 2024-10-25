import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../AuthService/service.dart';
//
// var txtEmail = TextEditingController();
// var txtPassword = TextEditingController();
//
// class LoginPage extends StatelessWidget {
//   const LoginPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     double h = MediaQuery.of(context).size.height;
//     double w = MediaQuery.of(context).size.width;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Login'),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             SizedBox(
//               width: w * 0.9,
//               child: TextFormField(
//                 controller: txtEmail,
//                 decoration: InputDecoration(
//                   labelText: 'Email',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: h * 0.01,
//             ),
//             SizedBox(
//               width: w * 0.9,
//               child: TextFormField(
//                 controller: txtPassword,
//                 decoration: InputDecoration(
//                   labelText: 'Passsword',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//             ),
//             SizedBox(
//               width: w * 0.09,
//               child: OutlinedButton(onPressed: () {}, child: Text('Login')),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Login'),
      ),
      body: Form(
        key: formKey,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
              width: w * .9,
              child: TextFormField(
                validator: (value) =>
                value!.isEmpty ? "Email cannot be empty." : null,
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Email"),
                ),
              )),
          SizedBox(
            height: 10,
          ),
          SizedBox(
              width: w * 0.9,
              child: TextFormField(
                validator: (value) => value!.length < 8
                    ? "Password should have at least 8 characters."
                    : null,
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Password"),
                ),
              )),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 65,
            width: w * .9,
            child: ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  AuthService()
                      .loginWithEmail(
                      emailController.text, passwordController.text)
                      .then(
                        (value) {
                      if (value == "Login Successful") {
                        Get.snackbar("Login", "Login Successful");
                        Get.offAllNamed('/home');
                      } else {
                        Get.snackbar("Login", "$value",
                            backgroundColor: Colors.red);
                      }
                    },
                  );
                }
              },
              child: Text(
                "Login",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: w * 0.9,
            height: h * 0.06,
            child: OutlinedButton(
              onPressed: () {

              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/googleLogo.png",
                    height: 30,
                    width: 30,
                  ),
                  Text("Continue with Google"),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't have and account?"),
              TextButton(
                  onPressed: () {
                    Get.toNamed('/signup');
                  },
                  child: Text("Sign Up"))
            ],
          )
        ]),
      ),
    );
  }
}

