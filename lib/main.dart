// // import 'package:firebase_core/firebase_core.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:firebase_database/firebase_database.dart';
// // import 'package:flutter/material.dart';
// // import 'package:uber_practice/Authentication/login_screen.dart';
// // import 'package:uber_practice/Authentication/signup_screen.dart';
// // import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
// // import 'package:flutter/foundation.dart';
// // import 'firebase_options.dart';
// //
// //
// // void main() async{
// //
// //
// //   WidgetsFlutterBinding.ensureInitialized();
// //   await Firebase.initializeApp(
// //     options: DefaultFirebaseOptions.currentPlatform,
// //   );
// //
// //   runApp(const MyApp());
// // }
// //
// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Uber ',
// //       debugShowCheckedModeBanner: false,
// //       theme: ThemeData.dark().copyWith(
// //         scaffoldBackgroundColor: Colors.black,
// //       ),
// //
// //       home: const LoginScreen(),
// //
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:uber_practice/Authentication/login_screen.dart';
// import 'package:mapbox_gl/mapbox_gl.dart';
// import 'pages/home_page.dart';
//
// import 'firebase_options.dart'; // Import the updated HomePage widget
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Uber',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData.dark().copyWith(
//         scaffoldBackgroundColor: Colors.black,
//       ),
//       home: SplashScreen(), // Use the SplashScreen as the initial route
//     );
//   }
// }
//
// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     // Add any initialization logic here
//     // For example, you can load data, perform authentication, etc.
//     // Then navigate to the appropriate screen after a delay
//     Future.delayed(Duration(seconds: 10), () {
//       Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => LoginScreen()));
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black, // Set the background color of the scaffold to black
//       body: Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage("assets/images/logo.png"),
//             fit: BoxFit.cover, // Cover the entire screen with the image
//           ),
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:uber_practice/Authentication/login_screen.dart';
// import 'package:mapbox_gl/mapbox_gl.dart';
//
// import 'firebase_options.dart'; // Import the Firebase options file
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Uber',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData.dark().copyWith(
//         scaffoldBackgroundColor: Colors.black,
//       ),
//       home: SplashScreen(), // Use the SplashScreen as the initial route
//     );
//   }
// }
//
// class SplashScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     Future.delayed(Duration(seconds: 10), () {
//       Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => LoginScreen())); // Navigate to LoginScreen after 10 seconds
//     });
//
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage("assets/images/logo.png"),
//             fit: BoxFit.cover,
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Map'),
//         backgroundColor: Colors.white,
//         iconTheme: IconThemeData(color: Colors.black),
//       ),
//       body: MapboxMap(
//         accessToken: 'sk.eyJ1IjoiaGV0YWwxMjMiLCJhIjoiY2xzdDk2dWtjMTN3azJscWllZDE3bmJnZiJ9.nbb18M_CEOEtMK9RnAZLRg',
//         styleString: 'mapbox://styles/mapbox/streets-v11',
//         initialCameraPosition: CameraPosition(
//           target: LatLng(20.5937, 78.9629), // Set the initial camera position to India
//           zoom: 5,
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:uber_practice/Authentication/login_screen.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

import 'firebase_options.dart'; // Import the Firebase options file

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Uber',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
      ),
      home: SplashScreen(), // Use the SplashScreen as the initial route
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 10), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => LoginScreen())); // Navigate to LoginScreen after 10 seconds
    });

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/logo.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: MapboxMap(
        accessToken: 'sk.eyJ1IjoiaGV0YWwxMjMiLCJhIjoiY2xzdDk2dWtjMTN3azJscWllZDE3bmJnZiJ9.nbb18M_CEOEtMK9RnAZLRg',
        styleString: 'mapbox://styles/mapbox/streets-v11',
        initialCameraPosition: CameraPosition(
          target: LatLng(20.5937, 78.9629), // Set the initial camera position to India
          zoom: 5,
        ),
      ),
    );
  }
}