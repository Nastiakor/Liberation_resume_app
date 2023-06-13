// /*
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:cv_flutter_libe/utils/utils.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:typed_data';
//
// class LoginPageModel {
//   String email = '';
//   String password = '';
//   String whoIAm = '';
//   String name = '';
//   String lastName = '';
//   Uint8List? image;
//   String? errorMessage;
//   bool isLogin = true;
//
//   void toggleMode() {
//     isLogin = !isLogin;
//     errorMessage = '';
//     email = '';
//     password = '';
//     whoIAm = '';
//     name = '';
//     lastName = '';
//     image = null;
//   }
//
//   void selectImage() async {
//     Uint8List? img = await pickImage(ImageSource.gallery);
//     if (img != null) {
//       image = img;
//     }
//   }
// }
//
// class LoginPageView extends StatelessWidget {
//   final LoginPageModel model;
//   final Function() signIn;
//   final Function() signUp;
//
//   LoginPageView({
//     required this.model,
//     required this.signIn,
//     required this.signUp,
//   });
//
//   final TextEditingController _controllerEmail = TextEditingController();
//   final TextEditingController _controllerPassword = TextEditingController();
//   final TextEditingController _controllerwhoiam = TextEditingController();
//   final TextEditingController _controllerName = TextEditingController();
//   final TextEditingController _controllerLastName = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Firebase Auth'),
//         backgroundColor: Colors.teal,
//       ),
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: <Color>[
//               Colors.greenAccent,
//               Colors.teal,
//             ],
//             tileMode: TileMode.mirror,
//           ),
//         ),
//         height: double.infinity,
//         width: double.infinity,
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Expanded(
//               child: SingleChildScrollView(
//                 child: model.isLogin ? _buildLoginFields() : _buildSignUpFields(),
//               ),
//             ),
//             Text(model.errorMessage ?? ''),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.teal,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//               ),
//               onPressed: model.isLogin ? signIn : signUp,
//               child: Text(
//                 model.isLogin ? 'Login' : 'Register',
//                 style: const TextStyle(color: Colors.white),
//               ),
//             ),
//             TextButton(
//               onPressed: model.toggleMode,
//               child: Text(
//                 model.isLogin ? 'Register instead' : 'Login instead',
//                 style: const TextStyle(color: Colors.white),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildLoginFields() {
//     return Column(
//       children: [
//         TextField(
//           cursorColor: Colors.white,
//           style: const TextStyle(color: Colors.white),
//           obscureText: false,
//           controller: _controllerEmail,
//           decoration: InputDecoration(
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(30),
//               borderSide: const BorderSide(color: Colors.white),
//             ),
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(30),
//               borderSide: const BorderSide(
//                 width: 30,
//                 style: BorderStyle.solid,
//                 color: Colors.white,
//               ),
//             ),
//             labelText: 'Email',
//             labelStyle: const TextStyle(color: Colors.white),
//           ),
//         ),
//         const SizedBox(height: 10),
//         TextField(
//           cursorColor: Colors.white,
//           style: const TextStyle(color: Colors.white),
//           obscureText: true,
//           controller: _controllerPassword,
//           decoration: InputDecoration(
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(30),
//               borderSide: const BorderSide(color: Colors.white),
//             ),
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(30),
//               borderSide: const BorderSide(
//                 width: 30,
//                 style: BorderStyle.solid,
//                 color: Colors.white,
//               ),
//             ),
//             labelText: 'Password',
//             labelStyle: const TextStyle(color: Colors.white),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildSignUpFields() {
//     return Column(
//       children: [
//         Stack(
//           alignment: Alignment.topCenter,
//           children: [
//             model.image != null
//                 ? CircleAvatar(
//               radius: 65,
//               backgroundImage: MemoryImage(model.image!),
//             )
//                 : CircleAvatar(
//               radius: 65,
//               backgroundColor: Colors.white,
//               child: Image.asset("img/logos/profilepic.png"),
//             ),
//             Positioned(
//               child: IconButton(
//                 onPressed: model.selectImage,
//                 icon: const Icon(Icons.add_a_photo),
//               ),
//               bottom: -10,
//               left: 80,
//             ),
//           ],
//         ),
//         const SizedBox(height: 15),
//         TextField(
//           cursorColor: Colors.white,
//           style: const TextStyle(color: Colors.white),
//           obscureText: false,
//           controller: _controllerName,
//           decoration: InputDecoration(
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(30),
//               borderSide: const BorderSide(color: Colors.white),
//             ),
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(30),
//               borderSide: const BorderSide(
//                 width: 30,
//                 style: BorderStyle.solid,
//                 color: Colors.white,
//               ),
//             ),
//             labelText: 'Name',
//             labelStyle: const TextStyle(color: Colors.white),
//           ),
//         ),
//         const SizedBox(height: 10),
//         TextField(
//           cursorColor: Colors.white,
//           style: const TextStyle(color: Colors.white),
//           obscureText: false,
//           controller: _controllerLastName,
//           decoration: InputDecoration(
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(30),
//               borderSide: const BorderSide(color: Colors.white),
//             ),
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(30),
//               borderSide: const BorderSide(
//                 width: 30,
//                 style: BorderStyle.solid,
//                 color: Colors.white,
//               ),
//             ),
//             labelText: 'Last name',
//             labelStyle: const TextStyle(color: Colors.white),
//           ),
//         ),
//         const SizedBox(height: 10),
//         TextField(
//           cursorColor: Colors.white,
//           style: const TextStyle(color: Colors.white),
//           obscureText: false,
//           controller: _controllerwhoiam,
//           decoration: InputDecoration(
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(30),
//               borderSide: const BorderSide(color: Colors.white),
//             ),
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(30),
//               borderSide: const BorderSide(
//                 width: 30,
//                 style: BorderStyle.solid,
//                 color: Colors.white,
//               ),
//             ),
//             labelText: 'Who are you ? Job ...',
//             labelStyle: const TextStyle(color: Colors.white),
//           ),
//         ),
//         const SizedBox(height: 10),
//         TextField(
//           cursorColor: Colors.white,
//           style: const TextStyle(color: Colors.white),
//           obscureText: false,
//           controller: _controllerEmail,
//           decoration: InputDecoration(
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(30),
//               borderSide: const BorderSide(color: Colors.white),
//             ),
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(30),
//               borderSide: const BorderSide(
//                 width: 30,
//                 style: BorderStyle.solid,
//                 color: Colors.white,
//               ),
//             ),
//             labelText: 'Email',
//             labelStyle: const TextStyle(color: Colors.white),
//           ),
//         ),
//         const SizedBox(height: 10),
//         TextField(
//           cursorColor: Colors.white,
//           style: const TextStyle(color: Colors.white),
//           obscureText: true,
//           controller: _controllerPassword,
//           decoration: InputDecoration(
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(30),
//               borderSide: const BorderSide(color: Colors.white),
//             ),
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(30),
//               borderSide: const BorderSide(
//                 width: 30,
//                 style: BorderStyle.solid,
//                 color: Colors.white,
//               ),
//             ),
//             labelText: 'Password',
//             labelStyle: const TextStyle(color: Colors.white),
//           ),
//         ),
//         const SizedBox(height: 10),
//       ],
//     );
//   }
// }
// */
