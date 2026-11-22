import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';

/// A class for managing and monitoring network connectivity status.
///
/// This class provides functionality to check the current network connectivity status
/// and listen for changes in network connectivity. It helps in handling network-related
/// events and managing connectivity-based logic in the application.
class NetworkConnectivity {
  static final NetworkConnectivity _singleton = NetworkConnectivity._internal();

  factory NetworkConnectivity() {
    return _singleton;
  }

  NetworkConnectivity._internal();

  /// Checks if the device has an active internet connection.
  ///
  /// This method queries the current network status and determines if there is
  /// an active internet connection. It returns a [Future] that resolves to a
  /// [bool] indicating whether the device is connected to the internet.
  Future<bool> checkInternet() async {
    late List<ConnectivityResult> result;
    final Connectivity connectivity = Connectivity();
    bool isOnline = false;
    try {
      result = await connectivity.checkConnectivity();
      if (result.contains(ConnectivityResult.mobile) ||
          result.contains(ConnectivityResult.wifi) ||
          result.contains(ConnectivityResult.ethernet) ||
          result.contains(ConnectivityResult.vpn)) {
        try {
          final result = await InternetAddress.lookup('google.com');
          isOnline = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
          return isOnline;
        } on SocketException catch (_) {
          return false;
        }
      } else {
        try {
          final result = await InternetAddress.lookup('google.com');
          isOnline = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
          return isOnline;
        } catch (e) {
          return false;
        }
      }
    } on PlatformException {
      return true;
    }
  }
}
