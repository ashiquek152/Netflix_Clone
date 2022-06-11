import 'dart:io';

bool connected = true;

class InternetCheck {
  Future<bool> checkConnection() async {
    try {
      final result = await InternetAddress.lookup('Google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        connected = true;
        // print('connected');
      }
    } on SocketException catch (_) {
      connected = false;
      // print('not connected');
    }
    return connected;
  }
}
