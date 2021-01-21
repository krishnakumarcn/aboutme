import 'package:aboutme/enums/device_screen_type.dart';
import 'package:flutter/widgets.dart';

class SizingInformation {
  final Orientation orientation;
  final DeviceScreenType deviceScreenType;
  final Size screenSize;
  final Size localWidgetSize;

  SizingInformation({
    this.orientation,
    this.deviceScreenType,
    this.screenSize,
    this.localWidgetSize,
  });

  @override
  String toString() {
    return 'Orientation:$orientation DeviceType:$deviceScreenType ScreenSize:$screenSize LocalWidgetSize:$localWidgetSize';
  }
}
