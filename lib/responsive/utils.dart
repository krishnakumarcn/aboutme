import 'package:aboutme/enums/device_screen_type.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

DeviceScreenType getDeviceType(MediaQueryData mediaQuery) {
  var orientation = mediaQuery.orientation;
  double deviceWidth = 0;

  if (kIsWeb) {
    deviceWidth = mediaQuery.size.width;
  } else {
    if (orientation == Orientation.landscape) {
      deviceWidth = mediaQuery.size.height;
    } else {
      deviceWidth = mediaQuery.size.width;
    }
  }
  // if (deviceWidth > 950) {
  //   return DeviceScreenType.Desktop;
  // }
  if (deviceWidth > 600) {
    return DeviceScreenType.Desktop;

    /// Can be tablet as well. but currently concentrate on Mobile and Desktop.
  }
  return DeviceScreenType.Mobile;
}
