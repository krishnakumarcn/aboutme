import 'package:aboutme/enums/device_screen_type.dart';
import 'package:aboutme/responsive/responsive_builder.dart';
import 'package:flutter/widgets.dart';

class ScreenTypeLayout extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const ScreenTypeLayout({Key key, this.mobile, this.tablet, this.desktop})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.Tablet) {
          if (tablet != null) {
            return tablet;
          }
        }
        // If sizing indicates desktop and we have a desktop widget then
        if (sizingInformation.deviceScreenType == DeviceScreenType.Desktop) {
          if (desktop != null) {
            print("Is desktop");
            return desktop;
          }
        }
        print("is mobile");
        // Return mobile layout if nothing else is supplied
        return mobile;
      },
    );
  }
}
