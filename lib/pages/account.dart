import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uber_practice/pages/setting.dart';
import 'package:uber_practice/pages/messages.dart';
import 'package:uber_practice/pages/manageacc.dart';
import 'package:uber_practice/pages/legal.dart';
import 'package:uber_practice/authentication/login_screen.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F1F1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 70,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage('assets/images/avatarwoman.webp'),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'Hetal Nikam',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              buildInfoItem(
                icon: FontAwesomeIcons.envelope,
                text: 'hetal@gmail.com',
              ),
              SizedBox(height: 10),
              buildInfoItem(
                icon: FontAwesomeIcons.phone,
                text: '+1234567890',
              ),
              SizedBox(height: 30),
              Divider(color: Colors.grey[400]),
              SizedBox(height: 20),
              buildMenuItem(
                icon: Icons.settings,
                text: 'Settings',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
                },
              ),
              SizedBox(height: 10),
              buildMenuItem(
                icon: Icons.message,
                text: 'Messages',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MessagesPage()));
                },
              ),
              SizedBox(height: 10),
              buildMenuItem(
                icon: Icons.manage_accounts,
                text: 'Manage Account',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ManageAccountPage()));
                },
              ),
              SizedBox(height: 10),
              buildMenuItem(
                icon: Icons.gavel,
                text: 'Legal',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LegalPage()));
                },
              ),
              SizedBox(height: 10),
              buildMenuItem(
                icon: Icons.logout,
                text: 'Logout',
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                        (route) => false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMenuItem({required IconData icon, required String text, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.grey[200]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 30,
              color: Colors.black,
            ),
            SizedBox(width: 20),
            Text(
              text,
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontFamily: 'Montserrat',
              ),
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              size: 20,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInfoItem({required IconData icon, required String text}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 20,
          color: Colors.black,
        ),
        SizedBox(width: 10),
        Text(
          text,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontFamily: 'Montserrat',
          ),
        ),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ProfilePage(),
    theme: ThemeData(
      fontFamily: 'Montserrat',
    ),
  ));
}
