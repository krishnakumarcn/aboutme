import 'package:aboutme/responsive/sizing_information.dart';
import 'package:aboutme/responsive/utils.dart';
import 'package:flutter/widgets.dart';

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

  const ResponsiveBuilder({Key key, this.builder}) : super(key: key);

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
