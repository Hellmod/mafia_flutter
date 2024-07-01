
import 'package:custom_platform_device_id/platform_device_id.dart';

  Future<String> getDeviceIdentifier() async {

    String? deviceId = await PlatformDeviceId.getDeviceId;
    return deviceId ?? 'unknown';
  }
