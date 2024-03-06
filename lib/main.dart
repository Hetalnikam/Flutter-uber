
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
        accessToken: '',
        styleString: 'mapbox://styles/mapbox/streets-v11',
        initialCameraPosition: CameraPosition(
          target: LatLng(20.5937, 78.9629), // Set the initial camera position to India
          zoom: 5,
        ),
      ),
    );
  }
}
