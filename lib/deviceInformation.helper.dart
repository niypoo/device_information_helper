import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:device_information_helper/models/deviceInfo.model.dart';

class DeviceInformationHelper {
  static Future<DeviceInfo> get() async {
    if (Platform.isAndroid) {
      // get device info
      AndroidDeviceInfo info = await DeviceInfoPlugin().androidInfo;

      // return
      return DeviceInfo(
        id: info.id,
        name: info.model,
        os: 'Android',
      );
    }

    if (Platform.isIOS) {
      // get device info
      IosDeviceInfo info = await DeviceInfoPlugin().iosInfo;

      return DeviceInfo(
        id: info.identifierForVendor!,
        name: info.utsname.machine,
        os: 'IOS',
      );
    }

    // if (Platform.isLinux) {
    //   // get device info
    //   LinuxDeviceInfo info = await DeviceInfoPlugin().linuxInfo;

    //   return DeviceInfo(
    //     id: info.id,
    //     name: info.name,
    //     os: 'Linux',
    //   );
    // }

    // if (Platform.isMacOS) {
    //   // get device info
    //   MacOsDeviceInfo info = await DeviceInfoPlugin().macOsInfo;

    //   return DeviceInfo(
    //     id: info.systemGUID,
    //     name: info.model,
    //     os: 'MAC',
    //   );
    // }

    // if (Platform.isWindows) {
    //   // get device info
    //   WindowsDeviceInfo info = await DeviceInfoPlugin().windowsInfo;

    //   return DeviceInfo(
    //     id: info.deviceId,
    //     name: info.productName,
    //     os: 'Windows',
    //   );
    // }

    // in unknown device case
    return DeviceInfo(
      id: '000-000-00',
      name: 'unknown',
      os: 'unknown',
    );
  }
}
