// import 'package:flutter/material.dart';
// import 'package:mapbox_gl/mapbox_gl.dart';
//
// class MapPage extends StatefulWidget {
//   @override
//   _MapPageState createState() => _MapPageState();
// }
//
// class _MapPageState extends State<MapPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Map'),
//         backgroundColor: Colors.white,
//         iconTheme: IconThemeData(color: Colors.black),
//       ),
//       body: MapboxMap(
//         accessToken: '',
//         styleString: 'mapbox://styles/mapbox/streets-v11',
//         initialCameraPosition: CameraPosition(
//           target: LatLng(19.0760, 72.8777), // Center of India
//           zoom: 15, // Zoom level adjusted to see the entire country
//         ),
//       ),
//     );
//   }
// }
//
// import 'package:flutter/material.dart';
// import 'package:mapbox_gl/mapbox_gl.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_database/firebase_database.dart';
//
// class MapPage extends StatefulWidget {
//   @override
//   _MapPageState createState() => _MapPageState();
// }
//
// class _MapPageState extends State<MapPage> {
//   final String _firebaseProjectId = 'uber-fdecb'; // Replace with your Firebase project ID
//   final _firebaseRef = FirebaseDatabase.instance.reference();
//
//   String _pickupPoint = '';
//   String _destinationPoint = '';
//
//   @override
//   void initState() {
//     super.initState();
//     // Initialize Firebase
//     Firebase.initializeApp().then((_) {
//       print('Firebase initialized');
//     }).catchError((error) {
//       print('Error initializing Firebase: $error');
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Map'),
//         backgroundColor: Colors.white,
//         iconTheme: IconThemeData(color: Colors.black),
//       ),
//       body: SafeArea( // Wrap entire content with SafeArea to avoid app bar/bottom bar overlapping
//         child: Column(
//           children: [
//             // Constrain MapboxMap height using Flexible and MediaQuery for dynamic sizing
//             Flexible(
//               flex: 3, // Allocate more space (3/5) for the map
//               child: MapboxMap(
//                 accessToken: 'sk.eyJ1IjoiaGV0YWwxMjMiLCJhIjoiY2xzdDk2dWtjMTN3azJscWllZDE3bmJnZiJ9.nbb18M_CEOEtMK9RnAZLRg',
//                 styleString: 'mapbox://styles/mapbox/streets-v11',
//                 initialCameraPosition: CameraPosition(
//                   target: LatLng(19.0760, 72.8777), // Center of India
//                   zoom: 15, // Zoom level adjusted to see the entire country
//                 ),
//               ),
//             ),
//             // Use Expanded for remaining space (2/5) and adjust padding
//             Expanded(
//               flex: 2,
//               child: Padding(
//                 padding: EdgeInsets.all(16.0),
//                 child: Column(
//                   children: [
//                     TextField(
//                       decoration: InputDecoration(
//                         hintText: 'Enter Pickup Point',
//                       ),
//                       onChanged: (value) {
//                         setState(() {
//                           _pickupPoint = value;
//                         });
//                       },
//                     ),
//                     SizedBox(height: 10), // Adjust spacing between TextFields
//                     TextField(
//                       decoration: InputDecoration(
//                         hintText: 'Enter Destination Point',
//                       ),
//                       onChanged: (value) {
//                         setState(() {
//                           _destinationPoint = value;
//                         });
//                       },
//                     ),
//                     SizedBox(height: 4), // Adjust spacing between TextField and button
//                     ElevatedButton(
//                       onPressed: () {
//                         if (_pickupPoint.isNotEmpty && _destinationPoint.isNotEmpty) {
//                           String uniqueId = DateTime.now().millisecondsSinceEpoch.toString();
//                           _firebaseRef.child('user_locations/$uniqueId').set({
//                             'pickupPoint': _pickupPoint,
//                             'destinationPoint': _destinationPoint,
//                           }).catchError((error) {
//                             // Handle Firebase errors
//                             print('Error saving data: $error');
//                           });
//                           // Reset input fields
//                           _pickupPoint = '';
//                           _destinationPoint = '';
//                           // Show success message or update UI as needed
//                         } else {
//                           // Show error message if fields are empty
//                           print('Please enter both pickup and destination points.');
//                         }
//                       },
//                       child: Text('Save and Show'),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// import 'package:flutter/material.dart';
// import 'package:mapbox_gl/mapbox_gl.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// class MapPage extends StatefulWidget {
//   @override
//   _MapPageState createState() => _MapPageState();
// }
//
// class _MapPageState extends State<MapPage> {
//   final String _firebaseProjectId = 'uber-fdecb'; // Replace with your Firebase project ID
//   final _firebaseRef = FirebaseDatabase.instance.reference();
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//
//   String _pickupPoint = '';
//   String _destinationPoint = '';
//   String _userId = ''; // Variable to store user ID
//
//   @override
//   void initState() {
//     super.initState();
//     // Initialize Firebase and get current user
//     Firebase.initializeApp().then((_) {
//       print('Firebase initialized');
//       getCurrentUser();
//     }).catchError((error) {
//       print('Error initializing Firebase: $error');
//     });
//   }
//
//   void getCurrentUser() async {
//     // Handle null user gracefully
//     User? user = await _auth.currentUser;
//     if (user != null) {
//       _userId = user.uid;
//     } else {
//       // Navigate to login or prompt user to sign up
//       // For example, Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
//       print('No user signed in. Redirecting to login...');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Map'),
//         backgroundColor: Colors.white,
//         iconTheme: IconThemeData(color: Colors.black),
//       ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             // Constrain MapboxMap height using Flexible and MediaQuery for dynamic sizing
//             Flexible(
//               flex: 3,
//               child: MapboxMap(
//                 accessToken: 'sk.eyJ1IjoiaGV0YWwxMjMiLCJhIjoiY2xzdDk2dWtjMTN3azJscWllZDE3bmJnZiJ9.nbb18M_CEOEtMK9RnAZLRg', // Replace with your Mapbox access token
//                 styleString: 'mapbox://styles/mapbox/streets-v11',
//                 initialCameraPosition: CameraPosition(
//                   target: LatLng(19.0760, 72.8777), // Center of India
//                   zoom: 15, // Zoom level adjusted to see the entire country
//                 ),
//               ),
//             ),
//             // Use Expanded for remaining space (2/5) and adjust padding
//             Expanded(
//               flex: 2,
//               child: Padding(
//                 padding: EdgeInsets.all(16.0),
//                 child: Column(
//                   children: [
//                     TextField(
//                       decoration: InputDecoration(
//                         hintText: 'Enter Pickup Point',
//                       ),
//                       onChanged: (value) {
//                         setState(() {
//                           _pickupPoint = value;
//                         });
//                       },
//                     ),
//                     SizedBox(height: 10),
//                     TextField(
//                       decoration: InputDecoration(
//                         hintText: 'Enter Destination Point',
//                       ),
//                       onChanged: (value) {
//                         setState(() {
//                           _destinationPoint = value;
//                         });
//                       },
//                     ),
//                     SizedBox(height: 4),
//                     ElevatedButton(
//                       onPressed: () {
//                         if (_userId.isNotEmpty && _pickupPoint.isNotEmpty && _destinationPoint.isNotEmpty) {
//                           String uniqueId = DateTime.now().millisecondsSinceEpoch.toString();
//                           _firebaseRef.child('user_locations/$_userId/$uniqueId').set({
//                             'pickupPoint': _pickupPoint,
//                             'destinationPoint': _destinationPoint,
//                           }).catchError((error) {
//                             // Handle Firebase errors
//                             print('Error saving data: $error');
//                           });
//                           // Reset input fields
//                           setState(() {
//                             _pickupPoint = '';
//                             _destinationPoint = '';
//                           });
//                           // Show success message or update UI as needed
//                         } else {
//                           // Show error message if fields are empty or user is not signed in
//                           if (_userId.isEmpty) {
//                             print('Please sign in to save your location.');
//                           } else {
//                             print('Please enter both pickup and destination points.');
//                           }
//                         }
//                       },
//                       child: Text('Save and Show'),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//
// import 'package:flutter/material.dart';
// import 'package:mapbox_gl/mapbox_gl.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// class MapPage extends StatefulWidget {
//   @override
//   _MapPageState createState() => _MapPageState();
// }
//
// class _MapPageState extends State<MapPage> {
//   final String _firebaseProjectId = 'uber-fdecb'; // Replace with your Firebase project ID
//   final _firebaseRef = FirebaseDatabase.instance.reference();
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//
//   String _pickupPoint = '';
//   String _destinationPoint = '';
//   String _userId = ''; // Variable to store user ID
//   String _transportationMode = 'auto'; // Default transportation mode
//
//   double _fare = 0.0; // Variable to store fare information
//
//   @override
//   void initState() {
//     super.initState();
//     // Initialize Firebase and get current user
//     Firebase.initializeApp().then((_) {
//       print('Firebase initialized');
//       getCurrentUser();
//     }).catchError((error) {
//       print('Error initializing Firebase: $error');
//     });
//   }
//
//   void getCurrentUser() async {
//     // Handle null user gracefully
//     User? user = await _auth.currentUser;
//     if (user != null) {
//       setState(() {
//         _userId = user.uid;
//       });
//     } else {
//       // Navigate to login or prompt user to sign up
//       // For example, Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
//       print('No user signed in. Redirecting to login...');
//     }
//   }
//
//   // Method to draw route on the map
//   void drawRoute() {
//     // Implement logic to draw route on the map based on transportation mode
//     // You can use Mapbox Directions API or any other routing service
//     // For simplicity, we'll just draw a straight line between pickup and destination points
//     // This is a placeholder, you need to implement the actual route drawing logic
//
//     // Calculate fare based on distance and transportation mode
//     // For demonstration purposes, let's assume a simple fare calculation
//     // Fare calculation logic can be based on distance, time, and other factors
//     double distance = 10.0; // Example distance in kilometers
//     if (_transportationMode == 'auto') {
//       _fare = distance * 5.0; // Fare for auto mode (5 Rs per kilometer)
//     } else if (_transportationMode == 'car') {
//       _fare = distance * 10.0; // Fare for car mode (10 Rs per kilometer)
//     }
//
//     // After calculating fare, draw the route on the map and display fare information
//     // This is a placeholder, you need to implement the actual route drawing and fare display logic
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Map'),
//         backgroundColor: Colors.white,
//         iconTheme: IconThemeData(color: Colors.black),
//       ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             Flexible(
//               flex: 3,
//               child: MapboxMap(
//                 accessToken: 'sk.eyJ1IjoiaGV0YWwxMjMiLCJhIjoiY2xzdDk2dWtjMTN3azJscWllZDE3bmJnZiJ9.nbb18M_CEOEtMK9RnAZLRg', // Replace with your Mapbox access token
//                 styleString: 'mapbox://styles/mapbox/streets-v11',
//                 initialCameraPosition: CameraPosition(
//                   target: LatLng(19.0760, 72.8777), // Center of India
//                   zoom: 15,
//                 ),
//               ),
//             ),
//             Expanded(
//               flex: 2,
//               child: Padding(
//                 padding: EdgeInsets.all(16.0),
//                 child: Column(
//                   children: [
//                     TextField(
//                       decoration: InputDecoration(
//                         hintText: 'Enter Pickup Point',
//                       ),
//                       onChanged: (value) {
//                         setState(() {
//                           _pickupPoint = value;
//                         });
//                       },
//                     ),
//                     SizedBox(height: 10),
//                     TextField(
//                       decoration: InputDecoration(
//                         hintText: 'Enter Destination Point',
//                       ),
//                       onChanged: (value) {
//                         setState(() {
//                           _destinationPoint = value;
//                         });
//                       },
//                     ),
//                     SizedBox(height: 4),
//                     Row(
//                       children: [
//                         Text('Transportation Mode:'),
//                         SizedBox(width: 10),
//                         DropdownButton<String>(
//                           value: _transportationMode,
//                           onChanged: (String? newValue) {
//                             setState(() {
//                               _transportationMode = newValue!;
//                             });
//                           },
//                           items: <String>['auto', 'car'].map<DropdownMenuItem<String>>((String value) {
//                             return DropdownMenuItem<String>(
//                               value: value,
//                               child: Text(value),
//                             );
//                           }).toList(),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 10),
//                     ElevatedButton(
//                       onPressed: drawRoute,
//                       child: Text('Save and Show Route'),
//                     ),
//                     SizedBox(height: 10),
//                     Text(
//                       'Fare: $_fare Rs',
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// // }





// import 'package:flutter/material.dart';
// import 'package:mapbox_gl/mapbox_gl.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// class MapPage extends StatefulWidget {
//   @override
//   _MapPageState createState() => _MapPageState();
// }
//
// class _MapPageState extends State<MapPage> {
//   final String _firebaseProjectId = 'uber-fdecb'; // Replace with your Firebase project ID
//   final _firebaseRef = FirebaseDatabase.instance.reference();
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//
//   String _pickupPoint = '';
//   String _destinationPoint = '';
//   String _userId = ''; // Variable to store user ID
//   String _transportationMode = 'auto'; // Default transportation mode
//
//   double _fare = 0.0; // Variable to store fare information
//
//   @override
//   void initState() {
//     super.initState();
//     // Initialize Firebase and get current user
//     Firebase.initializeApp().then((_) {
//       print('Firebase initialized');
//       getCurrentUser();
//     }).catchError((error) {
//       print('Error initializing Firebase: $error');
//     });
//   }
//
//   void getCurrentUser() async {
//     // Handle null user gracefully
//     User? user = await _auth.currentUser;
//     if (user != null) {
//       setState(() {
//         _userId = user.uid;
//       });
//     } else {
//       // Navigate to login or prompt user to sign up
//       // For example, Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
//       print('No user signed in. Redirecting to login...');
//     }
//   }
//
//   // Method to draw route on the map
//   void drawRoute() {
//     // Implement logic to draw route on the map based on transportation mode
//     // You can use Mapbox Directions API or any other routing service
//     // For simplicity, we'll just draw a straight line between pickup and destination points
//     // This is a placeholder, you need to implement the actual route drawing logic
//
//     // Calculate fare based on distance and transportation mode
//     // For demonstration purposes, let's assume a simple fare calculation
//     // Fare calculation logic can be based on distance, time, and other factors
//     double distance = 10.0; // Example distance in kilometers
//     if (_transportationMode == 'auto') {
//       _fare = distance * 5.0; // Fare for auto mode (5 Rs per kilometer)
//     } else if (_transportationMode == 'car') {
//       _fare = distance * 10.0; // Fare for car mode (10 Rs per kilometer)
//     }
//
//     // After calculating fare, draw the route on the map and display fare information
//     // This is a placeholder, you need to implement the actual route drawing and fare display logic
//   }
//
//   // Method to show navigation route using installed navigation apps
//   void showNavigationRoute() {
//     if (_pickupPoint.isNotEmpty && _destinationPoint.isNotEmpty) {
//       String origin = Uri.encodeComponent(_pickupPoint);
//       String destination = Uri.encodeComponent(_destinationPoint);
//
//       // Launch navigation app with the specified origin and destination
//       launch('https://www.google.com/maps/dir/?api=1&origin=$origin&destination=$destination');
//     } else {
//       print('Please provide both pickup and destination points.');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Map'),
//         backgroundColor: Colors.white,
//         iconTheme: IconThemeData(color: Colors.black),
//       ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             Flexible(
//               flex: 3,
//               child: MapboxMap(
//                 accessToken: 'sk.eyJ1IjoiaGV0YWwxMjMiLCJhIjoiY2xzdDk2dWtjMTN3azJscWllZDE3bmJnZiJ9.nbb18M_CEOEtMK9RnAZLRg', // Replace with your Mapbox access token
//                 styleString: 'mapbox://styles/mapbox/streets-v11',
//                 initialCameraPosition: CameraPosition(
//                   target: LatLng(19.0760, 72.8777), // Center of India
//                   zoom: 15,
//                 ),
//               ),
//             ),
//             Expanded(
//               flex: 2,
//               child: Padding(
//                 padding: EdgeInsets.all(16.0),
//                 child: Column(
//                   children: [
//                     TextField(
//                       decoration: InputDecoration(
//                         hintText: 'Enter Pickup Point',
//                       ),
//                       onChanged: (value) {
//                         setState(() {
//                           _pickupPoint = value;
//                         });
//                       },
//                     ),
//                     SizedBox(height: 0.05),
//                     TextField(
//                       decoration: InputDecoration(
//                         hintText: 'Enter Destination Point',
//                       ),
//                       onChanged: (value) {
//                         setState(() {
//                           _destinationPoint = value;
//                         });
//                       },
//                     ),
//                     SizedBox(height: 4),
//                     Row(
//                       children: [
//                         Text('Transportation Mode:'),
//                         SizedBox(width: 10),
//                         DropdownButton<String>(
//                           value: _transportationMode,
//                           onChanged: (String? newValue) {
//                             setState(() {
//                               _transportationMode = newValue!;
//                             });
//                           },
//                           items: <String>['auto', 'car'].map<DropdownMenuItem<String>>((String value) {
//                             return DropdownMenuItem<String>(
//                               value: value,
//                               child: Text(value),
//                             );
//                           }).toList(),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 3),
//                     ElevatedButton(
//                       onPressed: drawRoute,
//                       child: Text('Save and Show Route'),
//                     ),
//                     SizedBox(height: 3),
//                     ElevatedButton(
//                       onPressed: showNavigationRoute,
//                       child: Text('Navigate'),
//                     ),
//                     SizedBox(height: 1),
//                     Text(
//                       'Fare: $_fare Rs',
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// import 'package:flutter/material.dart';
// import 'package:mapbox_gl/mapbox_gl.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// class MapPage extends StatefulWidget {
//   @override
//   _MapPageState createState() => _MapPageState();
// }
//
// class _MapPageState extends State<MapPage> {
//   final String _firebaseProjectId = 'uber-fdecb';
//   final _firebaseRef = FirebaseDatabase.instance.reference();
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//
//   String _pickupPoint = '';
//   String _destinationPoint = '';
//   String _userId = '';
//   String _transportationMode = 'auto';
//
//   double _fare = 0.0;
//
//   @override
//   void initState() {
//     super.initState();
//     Firebase.initializeApp().then((_) {
//       print('Firebase initialized');
//       getCurrentUser();
//     }).catchError((error) {
//       print('Error initializing Firebase: $error');
//     });
//   }
//
//   void getCurrentUser() async {
//     User? user = await _auth.currentUser;
//     if (user != null) {
//       setState(() {
//         _userId = user.uid;
//       });
//     } else {
//       print('No user signed in. Redirecting to login...');
//     }
//   }
//
//   void drawRoute() {
//     double distance = 10.0;
//     if (_transportationMode == 'auto') {
//       _fare = distance * 5.0;
//     } else if (_transportationMode == 'car') {
//       _fare = distance * 10.0;
//     }
//   }
//
//   void showNavigationRoute() {
//     if (_pickupPoint.isNotEmpty && _destinationPoint.isNotEmpty) {
//       String origin = Uri.encodeComponent(_pickupPoint);
//       String destination = Uri.encodeComponent(_destinationPoint);
//
//       launch('https://www.google.com/maps/dir/?api=1&origin=$origin&destination=$destination');
//     } else {
//       print('Please provide both pickup and destination points.');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Plan ypur ride'),
//         backgroundColor: Colors.white,
//         iconTheme: IconThemeData(color: Colors.black),
//       ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             Expanded(
//               child: MapboxMap(
//                 accessToken: 'sk.eyJ1IjoiaGV0YWwxMjMiLCJhIjoiY2xzdDk2dWtjMTN3azJscWllZDE3bmJnZiJ9.nbb18M_CEOEtMK9RnAZLRg',
//                 styleString: 'mapbox://styles/mapbox/streets-v11',
//                 initialCameraPosition: CameraPosition(
//                   target: LatLng(19.0760, 72.8777),
//                   zoom: 15,
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Padding(
//                 padding: EdgeInsets.all(16.0),
//                 child: ListView(
//                   children: [
//                     TextField(
//                       decoration: InputDecoration(
//                         hintText: 'Enter Pickup Point',
//                         border: OutlineInputBorder(),
//                       ),
//                       onChanged: (value) {
//                         setState(() {
//                           _pickupPoint = value;
//                         });
//                       },
//                     ),
//                     SizedBox(height: 10),
//                     TextField(
//                       decoration: InputDecoration(
//                         hintText: 'Enter Destination Point',
//                         border: OutlineInputBorder(),
//                       ),
//                       onChanged: (value) {
//                         setState(() {
//                           _destinationPoint = value;
//                         });
//                       },
//                     ),
//                     SizedBox(height: 10),
//                     Row(
//                       children: [
//                         Icon(Icons.directions_car),
//                         SizedBox(width: 16),
//                         DropdownButton<String>(
//                           value: _transportationMode,
//                           onChanged: (String? newValue) {
//                             setState(() {
//                               _transportationMode = newValue!;
//                             });
//                           },
//                           items: <String>['auto', 'car'].map<DropdownMenuItem<String>>((String value) {
//                             return DropdownMenuItem<String>(
//                               value: value,
//                               child: Text(value),
//                             );
//                           }).toList(),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 10),
//                     ElevatedButton(
//                       onPressed: drawRoute,
//                       style: ElevatedButton.styleFrom(
//                         primary: Colors.blue,
//                         onPrimary: Colors.white,
//                       ),
//                       child: Padding(
//                         padding: EdgeInsets.symmetric(vertical: 12),
//                         child: Text('Save and Show Route', style: TextStyle(fontSize: 16)),
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     ElevatedButton(
//                       onPressed: showNavigationRoute,
//                       style: ElevatedButton.styleFrom(
//                         primary: Colors.green,
//                         onPrimary: Colors.white,
//                       ),
//                       child: Padding(
//                         padding: EdgeInsets.symmetric(vertical: 12),
//                         child: Text('Navigate', style: TextStyle(fontSize: 16)),
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     Text(
//                       'Fare: $_fare Rs',
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// import 'package:flutter/material.dart';
// import 'package:mapbox_gl/mapbox_gl.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// class MapPage extends StatefulWidget {
//   @override
//   _MapPageState createState() => _MapPageState();
// }
//
// class _MapPageState extends State<MapPage> {
//   final _firebaseRef = FirebaseDatabase.instance.reference();
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//
//   String _pickupPoint = '';
//   String _destinationPoint = '';
//   String _userId = '';
//   String _transportationMode = 'auto';
//
//   double _fare = 0.0;
//
//   @override
//   void initState() {
//     super.initState();
//     Firebase.initializeApp().then((_) {
//       print('Firebase initialized');
//       getCurrentUser();
//     }).catchError((error) {
//       print('Error initializing Firebase: $error');
//     });
//   }
//
//   void getCurrentUser() async {
//     User? user = await _auth.currentUser;
//     if (user != null) {
//       setState(() {
//         _userId = user.uid;
//       });
//     } else {
//       print('No user signed in. Redirecting to login...');
//     }
//   }
//
//   void drawRoute() {
//     double distance = 10.0;
//     if (_transportationMode == 'auto') {
//       _fare = distance * 5.0;
//     } else if (_transportationMode == 'car') {
//       _fare = distance * 10.0;
//     }
//
//     // Save booking details to Firebase Realtime Database
//     if (_pickupPoint.isNotEmpty && _destinationPoint.isNotEmpty) {
//       String currentTime = DateTime.now().toIso8601String();
//       _firebaseRef.child('bookings').child(_userId).set({
//         'pickupPoint': _pickupPoint,
//         'destinationPoint': _destinationPoint,
//         'time': currentTime,
//       }).then((_) {
//         print('Booking details saved to database');
//       }).catchError((error) {
//         print('Error saving booking details: $error');
//       });
//     } else {
//       print('Please provide both pickup and destination points.');
//     }
//   }
//
//   void showNavigationRoute() {
//     if (_pickupPoint.isNotEmpty && _destinationPoint.isNotEmpty) {
//       String origin = Uri.encodeComponent(_pickupPoint);
//       String destination = Uri.encodeComponent(_destinationPoint);
//
//       launch('https://www.google.com/maps/dir/?api=1&origin=$origin&destination=$destination');
//     } else {
//       print('Please provide both pickup and destination points.');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Plan your ride'),
//         backgroundColor: Colors.white,
//         iconTheme: IconThemeData(color: Colors.black),
//       ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             Expanded(
//               child: MapboxMap(
//                 accessToken: 'sk.eyJ1IjoiaGV0YWwxMjMiLCJhIjoiY2xzdDk2dWtjMTN3azJscWllZDE3bmJnZiJ9.nbb18M_CEOEtMK9RnAZLRg',
//                 styleString: 'mapbox://styles/mapbox/streets-v11',
//                 initialCameraPosition: CameraPosition(
//                   target: LatLng(19.0760, 72.8777),
//                   zoom: 15,
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Padding(
//                 padding: EdgeInsets.all(16.0),
//                 child: ListView(
//                   children: [
//                     TextField(
//                       decoration: InputDecoration(
//                         hintText: 'Enter Pickup Point',
//                         border: OutlineInputBorder(),
//                       ),
//                       onChanged: (value) {
//                         setState(() {
//                           _pickupPoint = value;
//                         });
//                       },
//                     ),
//                     SizedBox(height: 10),
//                     TextField(
//                       decoration: InputDecoration(
//                         hintText: 'Enter Destination Point',
//                         border: OutlineInputBorder(),
//                       ),
//                       onChanged: (value) {
//                         setState(() {
//                           _destinationPoint = value;
//                         });
//                       },
//                     ),
//                     SizedBox(height: 10),
//                     Row(
//                       children: [
//                         Icon(Icons.directions_car),
//                         SizedBox(width: 16),
//                         DropdownButton<String>(
//                           value: _transportationMode,
//                           onChanged: (String? newValue) {
//                             setState(() {
//                               _transportationMode = newValue!;
//                             });
//                           },
//                           items: <String>['auto', 'car'].map<DropdownMenuItem<String>>((String value) {
//                             return DropdownMenuItem<String>(
//                               value: value,
//                               child: Text(value),
//                             );
//                           }).toList(),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 10),
//                     ElevatedButton(
//                       onPressed: drawRoute,
//                       style: ElevatedButton.styleFrom(
//                         primary: Colors.blue,
//                         onPrimary: Colors.white,
//                       ),
//                       child: Padding(
//                         padding: EdgeInsets.symmetric(vertical: 12),
//                         child: Text('Save and Show Route', style: TextStyle(fontSize: 16)),
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     ElevatedButton(
//                       onPressed: showNavigationRoute,
//                       style: ElevatedButton.styleFrom(
//                         primary: Colors.green,
//                         onPrimary: Colors.white,
//                       ),
//                       child: Padding(
//                         padding: EdgeInsets.symmetric(vertical: 12),
//                         child: Text('Navigate', style: TextStyle(fontSize: 16)),
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     Text(
//                       'Fare: $_fare Rs',
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//


//
// import 'package:flutter/material.dart';
// import 'package:mapbox_gl/mapbox_gl.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// class MapPage extends StatefulWidget {
//   @override
//   _MapPageState createState() => _MapPageState();
// }
//
// class _MapPageState extends State<MapPage> {
//   final _firebaseRef = FirebaseDatabase.instance.reference();
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//
//   String _pickupPoint = '';
//   String _destinationPoint = '';
//   String _userId = '';
//   String _transportationMode = 'auto';
//
//   double _fare = 0.0;
//
//   @override
//   void initState() {
//     super.initState();
//     Firebase.initializeApp().then((_) {
//       print('Firebase initialized');
//       getCurrentUser();
//     }).catchError((error) {
//       print('Error initializing Firebase: $error');
//     });
//   }
//
//   void getCurrentUser() async {
//     User? user = await _auth.currentUser;
//     if (user != null) {
//       setState(() {
//         _userId = user.uid;
//       });
//     } else {
//       print('No user signed in. Redirecting to login...');
//     }
//   }
//
//   void drawRoute() {
//     double distance = 10.0;
//     if (_transportationMode == 'auto') {
//       _fare = distance * 5.0;
//     } else if (_transportationMode == 'car') {
//       _fare = distance * 10.0;
//     }
//
//     // Save booking details to Firebase Realtime Database
//     if (_pickupPoint.isNotEmpty && _destinationPoint.isNotEmpty) {
//       DateTime currentTime = DateTime.now();
//       String formattedTime = currentTime.toIso8601String();
//       _firebaseRef.child('bookings').child(_userId).set({
//         'pickupPoint': _pickupPoint,
//         'destinationPoint': _destinationPoint,
//         'time': formattedTime,
//       }).then((_) {
//         print('Booking details saved to database');
//       }).catchError((error) {
//         print('Error saving booking details: $error');
//       });
//     } else {
//       print('Please provide both pickup and destination points.');
//     }
//   }
//
//   void showNavigationRoute() {
//     if (_pickupPoint.isNotEmpty && _destinationPoint.isNotEmpty) {
//       String origin = Uri.encodeComponent(_pickupPoint);
//       String destination = Uri.encodeComponent(_destinationPoint);
//
//       launch('https://www.google.com/maps/dir/?api=1&origin=$origin&destination=$destination');
//     } else {
//       print('Please provide both pickup and destination points.');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Plan your ride'),
//         backgroundColor: Colors.white,
//         iconTheme: IconThemeData(color: Colors.black),
//       ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             Expanded(
//               child: MapboxMap(
//                 accessToken: 'sk.eyJ1IjoiaGV0YWwxMjMiLCJhIjoiY2xzdDk2dWtjMTN3azJscWllZDE3bmJnZiJ9.nbb18M_CEOEtMK9RnAZLRg',
//                 styleString: 'mapbox://styles/mapbox/streets-v11',
//                 initialCameraPosition: CameraPosition(
//                   target: LatLng(19.0760, 72.8777),
//                   zoom: 15,
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Padding(
//                 padding: EdgeInsets.all(16.0),
//                 child: ListView(
//                   children: [
//                     TextField(
//                       decoration: InputDecoration(
//                         hintText: 'Enter Pickup Point',
//                         border: OutlineInputBorder(),
//                       ),
//                       onChanged: (value) {
//                         setState(() {
//                           _pickupPoint = value;
//                         });
//                       },
//                     ),
//                     SizedBox(height: 10),
//                     TextField(
//                       decoration: InputDecoration(
//                         hintText: 'Enter Destination Point',
//                         border: OutlineInputBorder(),
//                       ),
//                       onChanged: (value) {
//                         setState(() {
//                           _destinationPoint = value;
//                         });
//                       },
//                     ),
//                     SizedBox(height: 10),
//                     Row(
//                       children: [
//                         Icon(Icons.directions_car),
//                         SizedBox(width: 16),
//                         DropdownButton<String>(
//                           value: _transportationMode,
//                           onChanged: (String? newValue) {
//                             setState(() {
//                               _transportationMode = newValue!;
//                             });
//                           },
//                           items: <String>['auto', 'car'].map<DropdownMenuItem<String>>((String value) {
//                             return DropdownMenuItem<String>(
//                               value: value,
//                               child: Text(value),
//                             );
//                           }).toList(),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 10),
//                     ElevatedButton(
//                       onPressed: drawRoute,
//                       style: ElevatedButton.styleFrom(
//                         primary: Colors.blue,
//                         onPrimary: Colors.white,
//                       ),
//                       child: Padding(
//                         padding: EdgeInsets.symmetric(vertical: 12),
//                         child: Text('Save and Show Route', style: TextStyle(fontSize: 16)),
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     ElevatedButton(
//                       onPressed: showNavigationRoute,
//                       style: ElevatedButton.styleFrom(
//                         primary: Colors.green,
//                         onPrimary: Colors.white,
//                       ),
//                       child: Padding(
//                         padding: EdgeInsets.symmetric(vertical: 12),
//                         child: Text('Navigate', style: TextStyle(fontSize: 16)),
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     Text(
//                       'Fare: $_fare Rs',
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// void main() {
//   runApp(MaterialApp(
//     home: MapPage(),
//   ));
// }


import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart'; // Import the intl package for date formatting

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final _firebaseRef = FirebaseDatabase.instance.reference();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String _pickupPoint = '';
  String _destinationPoint = '';
  String _userId = '';
  String _transportationMode = 'auto';

  double _fare = 0.0;

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().then((_) {
      print('Firebase initialized');
      getCurrentUser();
    }).catchError((error) {
      print('Error initializing Firebase: $error');
    });
  }

  void getCurrentUser() async {
    User? user = await _auth.currentUser;
    if (user != null) {
      setState(() {
        _userId = user.uid;
      });
    } else {
      print('No user signed in. Redirecting to login...');
    }
  }

  void drawRoute() {
    double distance = 10.0;
    if (_transportationMode == 'auto') {
      _fare = distance * 5.0;
    } else if (_transportationMode == 'car') {
      _fare = distance * 10.0;
    }

    // Save booking details to Firebase Realtime Database
    if (_pickupPoint.isNotEmpty && _destinationPoint.isNotEmpty) {
      DateTime currentTime = DateTime.now();
      String formattedDate = DateFormat('yyyy-MM-dd').format(currentTime);
      String formattedTime = DateFormat('HH:mm:ss').format(currentTime);
      _firebaseRef.child('bookings').child(_userId).push().set({
        'pickupPoint': _pickupPoint,
        'destinationPoint': _destinationPoint,
        'date': formattedDate,
        'time': formattedTime,
      }).then((_) {
        print('Booking details saved to database');
        // Clear fields after saving
        setState(() {
          _pickupPoint = '';
          _destinationPoint = '';
        });
      }).catchError((error) {
        print('Error saving booking details: $error');
      });
    } else {
      print('Please provide both pickup and destination points.');
    }
  }

  void showNavigationRoute() {
    if (_pickupPoint.isNotEmpty && _destinationPoint.isNotEmpty) {
      String origin = Uri.encodeComponent(_pickupPoint);
      String destination = Uri.encodeComponent(_destinationPoint);

      launch('https://www.google.com/maps/dir/?api=1&origin=$origin&destination=$destination');
    } else {
      print('Please provide both pickup and destination points.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Plan your ride'),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: MapboxMap(
                accessToken: 'YOUR_MAPBOX_ACCESS_TOKEN',
                styleString: 'mapbox://styles/mapbox/streets-v11',
                initialCameraPosition: CameraPosition(
                  target: LatLng(19.0760, 72.8777),
                  zoom: 15,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: ListView(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter Pickup Point',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _pickupPoint = value;
                        });
                      },
                    ),
                    SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter Destination Point',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _destinationPoint = value;
                        });
                      },
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.directions_car),
                        SizedBox(width: 16),
                        DropdownButton<String>(
                          value: _transportationMode,
                          onChanged: (String? newValue) {
                            setState(() {
                              _transportationMode = newValue!;
                            });
                          },
                          items: <String>['auto', 'car'].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: drawRoute,
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        onPrimary: Colors.white,
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Text('Save and Show Route', style: TextStyle(fontSize: 16)),
                      ),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: showNavigationRoute,
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        onPrimary: Colors.white,
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Text('Navigate', style: TextStyle(fontSize: 16)),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Fare: $_fare Rs',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MapPage(),
  ));
}
