// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//
// import 'services.dart'; // Import the ServicesPage
// import 'activity.dart'; // Import the ActivityPage
// import 'account.dart'; // Import the AccountPage
//
// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   int _selectedIndex = 0;
//
//   static const List<Widget> _widgetOptions = <Widget>[
//     Text(
//       'Home',
//       style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//     ),
//     Text(
//       'Services',
//       style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//     ),
//     Text(
//       'Activity',
//       style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//     ),
//     Text(
//       'Account',
//       style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//     ),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Uber',
//           style: TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         backgroundColor: Colors.white,
//       ),
//       backgroundColor: Colors.white,
//       body: Container(
//         color: Colors.white,
//         child: Column(
//           children: [
//             Container(
//               padding: EdgeInsets.all(16),
//               color: Colors.white,
//               child: TextField(
//                 decoration: InputDecoration(
//                   hintText: 'Enter pickup point',
//                   prefixIcon: Icon(Icons.search, color: Colors.black),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20.0),
//                   ),
//                 ),
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.symmetric(vertical: 8.0),
//               color: Colors.white,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   buildIcon(
//                     icon: FontAwesomeIcons.car,
//                     label: 'Trip',
//                     onTap: () {
//                       _onItemTapped(0); // Navigate to Home page
//                     },
//                   ),
//                   buildIcon(
//                     icon: FontAwesomeIcons.route,
//                     label: 'Rentals',
//                     onTap: () {
//                       _onItemTapped(1); // Navigate to Services page
//                     },
//                   ),
//                   buildIcon(
//                     icon: FontAwesomeIcons.users,
//                     label: 'Group ride',
//                     onTap: () {
//                       _onItemTapped(2); // Navigate to Activity page
//                     },
//                   ),
//                   buildIcon(
//                     icon: FontAwesomeIcons.carAlt,
//                     label: 'Intercity',
//                     onTap: () {
//                       _onItemTapped(3); // Navigate to Account page
//                     },
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 20, // Add desired height between widgets
//             ),
//             SizedBox(
//               height: 120, // Adjust the height according to your content
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.horizontal, // Allow horizontal scrolling if needed
//                 child: Container(
//                   width: MediaQuery.of(context).size.width - 40, // Adjust width to fit the screen
//                   margin: EdgeInsets.symmetric(horizontal: 20),
//                   padding: EdgeInsets.all(20),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     gradient: LinearGradient(
//                       colors: [Colors.red, Colors.orange], // Adjust gradient colors as needed
//                       begin: Alignment.centerLeft,
//                       end: Alignment.centerRight,
//                     ),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.5),
//                         spreadRadius: 5,
//                         blurRadius: 7,
//                         offset: Offset(0, 3), // changes position of shadow
//                       ),
//                     ],
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "READY? Then let's roll!",
//                         textAlign: TextAlign.left,
//                         style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
//                       ),
//                       // SizedBox(height: 8),
//                       // Text(
//                       //   "Tap the icons below to get started",
//                       //   textAlign: TextAlign.left,
//                       //   style: TextStyle(fontSize: 16, color: Colors.white),
//                       // ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: <BottomNavigationBarItem>[
//           buildNavBarItem(Icons.home, 'Home'),
//           buildNavBarItem(Icons.directions_car, 'Services'),
//           buildNavBarItem(Icons.notifications, 'Activity'),
//           buildNavBarItem(Icons.person, 'Account'),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.black,
//         unselectedItemColor: Colors.grey[600],
//         onTap: _onItemTapped,
//         type: BottomNavigationBarType.fixed,
//         backgroundColor: Colors.white,
//       ),
//     );
//   }
//
//   Widget buildIcon({required IconData icon, required String label, required VoidCallback onTap}) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: MediaQuery.of(context).size.width * 0.2,
//         height: MediaQuery.of(context).size.width * 0.2,
//         decoration: BoxDecoration(
//           color: Colors.grey[200], // Change background color
//           borderRadius: BorderRadius.circular(10),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.5),
//               spreadRadius: 2,
//               blurRadius: 5,
//               offset: Offset(0, 3), // changes position of shadow
//             ),
//           ],
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(
//               icon,
//               color: Colors.black87, // Change icon color
//               size: 40,
//             ),
//             SizedBox(height: 8),
//             Text(
//               label,
//               style: TextStyle(color: Colors.black87, fontSize: 16, fontWeight: FontWeight.bold), // Change text color
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   BottomNavigationBarItem buildNavBarItem(IconData icon, String label) {
//     return BottomNavigationBarItem(
//       icon: Icon(icon, color: Colors.black),
//       label: label,
//     );
//   }
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//
//     // Handle navigation
//     switch (index) {
//       case 0:
//       // Navigate to Home page
//         break;
//       case 1:
//       // Navigate to Services page
//         Navigator.push(context, MaterialPageRoute(builder: (context) => ServicesPage()));
//         break;
//       case 2:
//       // Navigate to Activity page
//         Navigator.push(context, MaterialPageRoute(builder: (context) => ActivityPage()));
//         break;
//       case 3:
//       // Navigate to Account page
//         Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
//         break;
//       default:
//         break;
//     }
//   }
// }
//
// void main() {
//   runApp(MaterialApp(
//     home: HomePage(),
//     theme: ThemeData(
//       appBarTheme: AppBarTheme(
//         backgroundColor: Colors.white,
//         titleTextStyle: TextStyle(color: Colors.black),
//         iconTheme: IconThemeData(color: Colors.black),
//       ),
//     ),
//   ));
// }

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'services.dart';
import 'activity.dart';
import 'account.dart';
import 'map_page.dart'; // Import the MapPage

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Uber',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              color: Colors.white,
              child: TextField(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MapPage()));
                },
                decoration: InputDecoration(
                  hintText: 'Enter pickup point',
                  prefixIcon: Icon(Icons.search, color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildIcon(
                    icon: FontAwesomeIcons.car,
                    label: 'Trip',
                    onTap: () {
                      _onItemTapped(0); // Navigate to Home page
                    },
                  ),
                  buildIcon(
                    icon: FontAwesomeIcons.route,
                    label: 'Rentals',
                    onTap: () {
                      _onItemTapped(1); // Navigate to Services page
                    },
                  ),
                  buildIcon(
                    icon: FontAwesomeIcons.users,
                    label: 'Group ride',
                    onTap: () {
                      _onItemTapped(2); // Navigate to Activity page
                    },
                  ),
                  buildIcon(
                    icon: FontAwesomeIcons.carAlt,
                    label: 'Intercity',
                    onTap: () {
                      _onItemTapped(3); // Navigate to Account page
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20, // Add desired height between widgets
            ),
            SizedBox(
              height: 120, // Adjust the height according to your content
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal, // Allow horizontal scrolling if needed
                child: Container(
                  width: MediaQuery.of(context).size.width - 40, // Adjust width to fit the screen
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [Colors.red, Colors.orange], // Adjust gradient colors as needed
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "READY? Then let's roll!",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      // SizedBox(height: 8),
                      // Text(
                      //   "Tap the icons below to get started",
                      //   textAlign: TextAlign.left,
                      //   style: TextStyle(fontSize: 16, color: Colors.white),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          buildNavBarItem(Icons.home, 'Home'),
          buildNavBarItem(Icons.directions_car, 'Services'),
          buildNavBarItem(Icons.notifications, 'Activity'),
          buildNavBarItem(Icons.person, 'Account'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey[600],
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
      ),
    );
  }

  Widget buildIcon({required IconData icon, required String label, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.2,
        height: MediaQuery.of(context).size.width * 0.2,
        decoration: BoxDecoration(
          color: Colors.grey[200], // Change background color
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.black87, // Change icon color
              size: 40,
            ),
            SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(color: Colors.black87, fontSize: 16, fontWeight: FontWeight.bold), // Change text color
            ),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem buildNavBarItem(IconData icon, String label) {
    return BottomNavigationBarItem(
      icon: Icon(icon, color: Colors.black),
      label: label,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Handle navigation
    switch (index) {
      case 0:
      // Navigate to Home page
        break;
      case 1:
      // Navigate to Services page
        Navigator.push(context, MaterialPageRoute(builder: (context) => ServicesPage()));
        break;
      case 2:
      // Navigate to Activity page
        Navigator.push(context, MaterialPageRoute(builder: (context) => ActivityPage()));
        break;
      case 3:
      // Navigate to Account page
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
        break;
      default:
        break;
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: HomePage(),
    theme: ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(color: Colors.black),
        iconTheme: IconThemeData(color: Colors.black),
      ),
    ),
  ));
}
