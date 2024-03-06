
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
