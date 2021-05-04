import 'package:flutter/widgets.dart';
import 'package:krishnakumar_cn/helpers/ui/responsive_builder.dart';

import 'device_screen_type.dart';

class ScreenTypeLayout extends StatelessWidget {
  final Widget? mobile;
  final Widget? tablet;
  final Widget? desktop;

  const ScreenTypeLayout({Key? key, this.mobile, this.tablet, this.desktop})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.Desktop) {
          if (desktop != null) {
            print("Is desktop");
            return desktop!;
          }
        }

        print("is mobile");
        return mobile!;
      },
    );
  }
}
