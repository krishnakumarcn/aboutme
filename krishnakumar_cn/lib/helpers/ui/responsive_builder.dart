import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:krishnakumar_cn/helpers/ui/sizing_information.dart';

import 'device_screen_type.dart';

/*
* Hello, Welcome to ResponsiveBuilder, nice to meet you.
* You are reading this bacause you might not have any idea why this class is there and because your childhood was awesome.
*
* So, This class ResponsiveBuilder, and it will acts as a single reference point for the UI sizing information.
* If at any point, needs information like, the type of device, orientation, what is the parent size, etc., wrap the child widget with
* this ResponsiveBuilder and the sizeInformation will give all the details. Enjoy maadi!!!!
*
*
* P.S: Idu Zuckerburg-inu Polum illa. Kaaranam idu ivide irikkalle... :/ [Copyright:  Karanan Chanthakkavala aka Detective Kranchand]
* -krishnakumarcn
*/

class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(
      BuildContext context, SizingInformation sizingInformation) builder;
  const ResponsiveBuilder({Key? key, required this.builder}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return LayoutBuilder(builder: (context, boxSizing) {
      var sizingInformation = SizingInformation(
        orientation: mediaQuery.orientation,
        deviceScreenType: getDeviceType(mediaQuery),
        screenSize: mediaQuery.size,
        localWidgetSize: Size(boxSizing.maxWidth, boxSizing.maxHeight),
      );
      return builder(context, sizingInformation);
    });
  }
}

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
  if (deviceWidth > 800) {
    return DeviceScreenType.Desktop;

    /// Can be tablet as well. but currently concentrate on Mobile and Desktop.
  }
  return DeviceScreenType.Mobile;
}
