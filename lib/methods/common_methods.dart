//
//
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/material.dart';
//
// class CommonMethods
// {
//   checkConnectivity(BuildContext context) async
//   {
//     var connectionResult = await Connectivity().checkConnectivity();
//
//     if (connectionResult != ConnectivityResult.mobile && connectionResult != ConnectivityResult.wifi)
//     {
//       if(!context.mounted) return;
//       displaySnackBar("No Internet. Connect to Wifi or cellular data",context);
//
//     }
//   }
//     displaySnackBar(String messageText, BuildContext context)
//     {
//       var snackBar = SnackBar(content: Text(messageText));
//       ScaffoldMessenger.of(context).showSnackBar(snackBar);
//     }
//
//
//   }
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class CommonMethods {
  Future<void> checkConnectivity(BuildContext context) async {
    var connectionResult = await Connectivity().checkConnectivity();

    if (connectionResult != ConnectivityResult.mobile &&
        connectionResult != ConnectivityResult.wifi) {
      if (!context.mounted) return;
      showToast("No Internet. Connect to Wifi or cellular data");
    }
  }

  static void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black.withOpacity(0.7),
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
