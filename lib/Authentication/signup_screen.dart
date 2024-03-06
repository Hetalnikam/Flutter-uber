//
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:uber_practice/methods/common_methods.dart';
// import 'package:uber_practice/pages/homepage.dart';
// import '../widgets/loading.dart';
// import 'login_screen.dart';
//
// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }
//
// class _SignUpScreenState extends State<SignUpScreen> {
//   TextEditingController userNameTextEditingController = TextEditingController();
//   TextEditingController userPhoneTextEditingController = TextEditingController();
//   TextEditingController emailTextEditingController = TextEditingController();
//   TextEditingController passwordTextEditingController = TextEditingController();
//
//   CommonMethods cMethods = CommonMethods();
//
//   checkIfNetworkIsAvailable() {
//     cMethods.checkConnectivity(context);
//     signUpFormValidation();
//   }
//
//   signUpFormValidation() {
//     if (userNameTextEditingController.text.trim().length < 4) {
//       CommonMethods.showToast("Your name must be at least 4 characters");
//     } else if (userPhoneTextEditingController.text.trim().length < 10) {
//       CommonMethods.showToast("Your number must be at least 10 characters");
//     } else if (!emailTextEditingController.text.trim().contains("@")) {
//       CommonMethods.showToast("Please enter a valid email address");
//     } else if (passwordTextEditingController.text.trim().length < 6) {
//       CommonMethods.showToast("Your password must be at least 6 characters");
//     } else {
//       registerNewUser();
//     }
//   }
//
//   registerNewUser() async {
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (BuildContext context) => LoadingDialog(messageText: "Registering your account..."),
//     );
//
//     try {
//       UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: emailTextEditingController.text.trim(),
//         password: passwordTextEditingController.text.trim(),
//       );
//
//       if (userCredential != null) {
//         DatabaseReference usersRef = FirebaseDatabase.instance.ref().child("users").child(userCredential.user!.uid);
//         Map userDataMap = {
//           "name": userNameTextEditingController.text.trim(),
//           "email": emailTextEditingController.text.trim(),
//           "phone": userPhoneTextEditingController.text.trim(),
//           "id": userCredential.user!.uid,
//           "password":passwordTextEditingController.text.trim(),
//           "blockStatus": "no",
//         };
//         await usersRef.set(userDataMap);
//
//         // Navigate to the home page upon successful registration
//         Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => HomePage()));
//       }
//     } catch (e) {
//       print("Error during registration: $e");
//       CommonMethods.showToast("Registration failed. Please try again later.");
//     } finally {
//       Navigator.pop(context); // Close loading dialog
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: 80),
//               Text(
//                 "Create an Account",
//                 style: TextStyle(
//                   fontSize: 32,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black87,
//                 ),
//               ),
//               SizedBox(height: 40),
//               TextField(
//                 controller: userNameTextEditingController,
//                 keyboardType: TextInputType.text,
//                 style: TextStyle(color: Colors.black), // Set input text color to black
//                 decoration: InputDecoration(
//                   labelText: "User Name",
//                   labelStyle: TextStyle(color: Colors.black87),
//                 ),
//               ),
//               SizedBox(height: 20),
//               TextField(
//                 controller: userPhoneTextEditingController,
//                 keyboardType: TextInputType.number,
//                 style: TextStyle(color: Colors.black), // Set input text color to black
//                 decoration: InputDecoration(
//                   labelText: "Phone Number",
//                   labelStyle: TextStyle(color: Colors.black87),
//                 ),
//               ),
//               SizedBox(height: 20),
//               TextField(
//                 controller: emailTextEditingController,
//                 keyboardType: TextInputType.emailAddress,
//                 style: TextStyle(color: Colors.black), // Set input text color to black
//                 decoration: InputDecoration(
//                   labelText: "Email",
//                   labelStyle: TextStyle(color: Colors.black87),
//                 ),
//               ),
//               SizedBox(height: 20),
//               TextField(
//                 controller: passwordTextEditingController,
//                 obscureText: true,
//                 keyboardType: TextInputType.text,
//                 style: TextStyle(color: Colors.black), // Set input text color to black
//                 decoration: InputDecoration(
//                   labelText: "Password",
//                   labelStyle: TextStyle(color: Colors.black87),
//                 ),
//               ),
//               SizedBox(height: 40),
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     checkIfNetworkIsAvailable();
//                   },
//                   style: ElevatedButton.styleFrom(
//                     primary: Colors.purple,
//                     padding: EdgeInsets.all(15),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                   child: Text(
//                     "Sign Up",
//                     style: TextStyle(fontSize: 18),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),
//               Center(
//                 child: TextButton(
//                   onPressed: () {
//                     Navigator.push(context, MaterialPageRoute(builder: (c) => LoginScreen()));
//                   },
//                   child: Text(
//                     "Already have an account? Sign in",
//                     style: TextStyle(
//                       color: Colors.purple,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:uber_practice/methods/common_methods.dart';
import 'package:uber_practice/pages/homepage.dart';
import '../widgets/loading.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController userNameTextEditingController = TextEditingController();
  TextEditingController userPhoneTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  CommonMethods cMethods = CommonMethods();

  checkIfNetworkIsAvailable() {
    cMethods.checkConnectivity(context);
    signUpFormValidation();
  }

  signUpFormValidation() {
    if (userNameTextEditingController.text.trim().length < 4) {
      CommonMethods.showToast("Your name must be at least 4 characters");
    } else if (userPhoneTextEditingController.text.trim().length < 10) {
      CommonMethods.showToast("Your number must be at least 10 characters");
    } else if (!emailTextEditingController.text.trim().contains("@")) {
      CommonMethods.showToast("Please enter a valid email address");
    } else if (passwordTextEditingController.text.trim().length < 6) {
      CommonMethods.showToast("Your password must be at least 6 characters");
    } else {
      registerNewUser();
    }
  }

  registerNewUser() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => LoadingDialog(messageText: "Registering your account..."),
    );

    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailTextEditingController.text.trim(),
        password: passwordTextEditingController.text.trim(),
      );

      if (userCredential != null) {
        DatabaseReference usersRef = FirebaseDatabase.instance.ref().child("users").child(userCredential.user!.uid);
        Map userDataMap = {
          "name": userNameTextEditingController.text.trim(),
          "email": emailTextEditingController.text.trim(),
          "phone": userPhoneTextEditingController.text.trim(),
          "id": userCredential.user!.uid,
          "password":passwordTextEditingController.text.trim(),
          "blockStatus": "no",
        };
        await usersRef.set(userDataMap);

        // Navigate to the home page upon successful registration
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => HomePage()));
      }
    } catch (e) {
      print("Error during registration: $e");
      CommonMethods.showToast("Registration failed. Please try again later.");
    } finally {
      Navigator.pop(context); // Close loading dialog
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple, Colors.blue],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Create an Account",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 40),
                  TextField(
                    controller: userNameTextEditingController,
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: Colors.white), // Set input text color to white
                    decoration: InputDecoration(
                      labelText: "User Name",
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: userPhoneTextEditingController,
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.white), // Set input text color to white
                    decoration: InputDecoration(
                      labelText: "Phone Number",
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: emailTextEditingController,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(color: Colors.white), // Set input text color to white
                    decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: passwordTextEditingController,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: Colors.white), // Set input text color to white
                    decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        checkIfNetworkIsAvailable();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        padding: EdgeInsets.all(15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(fontSize: 18, color: Colors.purple),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (c) => LoginScreen()));
                      },
                      child: Text(
                        "Already have an account? Sign in",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
