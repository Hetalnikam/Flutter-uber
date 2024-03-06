
import 'package:flutter/material.dart';

class AccountsPage extends StatefulWidget {
  @override
  _AccountsPageState createState() => _AccountsPageState();
}

class _AccountsPageState extends State<AccountsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              // Implement action for account image tap
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 20), // Increase distance between app bar and widgets
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: _buildCategoryButton('Help'),
                ),
                Expanded(
                  child: _buildCategoryButton('Wallet'),
                ),
                Expanded(
                  child: _buildCategoryButton('Trips'),
                ),
              ],
            ),
          ),

          SizedBox(height: 40), // Reduced space between the two sections
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildSettingsButton('Settings'),
                SizedBox(height: 10), // Adjusted height
                _buildSettingsButton('Messages'),
                SizedBox(height: 10), // Adjusted height
                _buildSettingsButton('Send a Gift'),
                SizedBox(height: 10), // Adjusted height
                _buildSettingsButton('Drive or Deliver with Uber'),
                SizedBox(height: 10), // Adjusted height
                _buildSettingsButton('Legal'),
                SizedBox(height: 10), // Adjusted height
                _buildSettingsButton('Logout'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryButton(String title) {
    return Container(
      height: 50, // Adjust the height as needed
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15), // Adjust the radius as needed
        color: Colors.grey, // Adjust the color as needed
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0), // Adjust the padding as needed
          child: Text(
            title,
            style: TextStyle(
              color: Colors.black, // Adjust the text color as needed
              fontSize: 16, // Adjust the font size as needed
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSettingsButton(String title) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
      ),
      child: ListTile(
        title: Text(title),
        onTap: () {
          // Implement action for settings button tap
        },
      ),
    );
  }
}
