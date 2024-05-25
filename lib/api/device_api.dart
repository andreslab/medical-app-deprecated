import 'dart:convert' as convert;
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:http/http.dart' as http;
import 'package:heart/models/models.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DeviceApi {
  DeviceApi();

  Future<String?> _getId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      var iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else if (Platform.isAndroid) {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.id; // unique ID on Android
    }
  }

  Future<void> registerDeviceId() async {
    try {
      var deviceId = await _getId();
      if (deviceId != null) {
        await Supabase.instance.client
            .from('devices')
            .insert({'device_id': deviceId});
      }
    } catch (e) {
      throw Exception('Failed to load record data: ${e.toString()}');
    }
  }
}
