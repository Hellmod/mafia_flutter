import 'dart:io';

import 'package:custom_platform_device_id/platform_device_id.dart';
import 'package:device_info_plus/device_info_plus.dart';


  Future<String> getDeviceIdentifier() async {

    String? deviceId = await PlatformDeviceId.getDeviceId;
    return deviceId ?? 'unknown';
  }
