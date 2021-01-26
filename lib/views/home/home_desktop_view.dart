import 'package:aboutme/responsive/responsive_builder.dart';
import 'package:aboutme/responsive/screen_type_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:js' as js;

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenTypeLayout(
        desktop: HomeDesktopView(),
        mobile: HomeMobileView(),
      ),
    );
  }
}

class HomeDesktopView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ResponsiveBuilder(
            builder: (context, sizingInformation) => Center(
                    child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        height: sizingInformation.screenSize.height * 0.75,
                        // color: Color(0xffcfcfcf),
                        child: Container(
                          margin: EdgeInsets.only(left: 48),
                          child: Card(
                            elevation: 10.0,
                            margin: EdgeInsets.zero,
                            color: Colors.transparent,
                            child: SizedBox(
                              child: Center(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: AspectRatio(
                                    aspectRatio: 1,
                                    child: Image.asset(
                                      "assets/kk.jpg",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )),
                    Expanded(
                      child: Container(
                        height: sizingInformation.screenSize.height * 0.75,
                        margin: EdgeInsets.only(right: 48),
                        color: Color(0xff23636d),
                        child: Card(
                            elevation: 10.0,
                            margin: EdgeInsets.zero,
                            color: Colors.transparent,
                            child: getDetails()),
                      ),
                    ),
                  ],
                )

                    // Stack(
                    //   alignment: Alignment.center,
                    //   children: [
                    //     Container(
                    //       child: Row(
                    //         children: [
                    //           Container(
                    //             width:
                    //                 (sizingInformation.screenSize.width * 0.36) +
                    //                     52,
                    //             color: Color(0xffcfcfcf),
                    //           ),
                    //           Expanded(
                    //             child: Container(
                    //               color: Color(0xff23636d),
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //     Container(
                    //       height: sizingInformation.screenSize.height * 0.75,
                    //       // width: sizingInformation.screenSize.width * 1,
                    //       padding: EdgeInsets.symmetric(horizontal: 48),
                    //       child: Card(
                    //         elevation: 10.0,
                    //         color: Colors.transparent,
                    //         child: Container(
                    //           child: Row(
                    //             children: [
                    //               Center(
                    //                 child: Image.asset(
                    //                   "assets/kk.jpg",
                    //                   height:
                    //                       sizingInformation.screenSize.height *
                    //                           0.75,
                    //                   width: sizingInformation.screenSize.width *
                    //                       0.36,
                    //                   fit: BoxFit.cover,
                    //                 ),
                    //               ),
                    //               Expanded(child: getDetails())
                    //             ],
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    )));
  }

  getExternalLinkButton({String title, String link, String tooltip}) {
    return RaisedButton(
        color: Colors.transparent,
        elevation: 0,
        hoverElevation: 1.0,
        hoverColor: Colors.white.withOpacity(0.05),
        child: Text(
          title,
          style: TextStyle(
              fontSize: 14,
              letterSpacing: 1.2,
              fontWeight: FontWeight.w100,
              color: Colors.white.withOpacity(0.8)),
        ),
        onPressed: () {
          ///for web only.
          js.context.callMethod('open', [link]);
        });
  }

  getDetails() => Container(
        color: Color(0xff04191e),
        child: Column(children: [
          SizedBox(height: 32),
          Expanded(
            child: Wrap(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                getExternalLinkButton(
                    title: "LinkedIn",
                    link: "https://www.linkedin.com/in/krishnakumarcn/",
                    tooltip: "Connect on LinkedIn"),
                getExternalLinkButton(
                    title: "Github",
                    link: "https://www.github.com/krishnakumarcn",
                    tooltip: ""),
                getExternalLinkButton(
                    title: "Stack Overflow",
                    link: "https://stackoverflow.com/users/story/5546443"),
                getExternalLinkButton(
                    title: "Medium",
                    link: "https://medium.com/@krishnakumarcn"),
                getExternalLinkButton(
                    title: "Facebook",
                    link: "https://www.facebook.com/krishnakumarcn/"),
                getExternalLinkButton(
                    title: "Instagram",
                    link: "https://www.instagram.com/krishnakumar_cn"),
              ],
            ),
          ),
          Spacer(),
          Text(
            "KRISHNAKUMAR\nNARAYANAN",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 64,
              color: Colors.white,
              letterSpacing: 2.0,
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 120.0),
            child: Text(
              "Engineer\t Reader\t Movie Enthusiast\t Technology devotee\t Flutter fanatic\t ",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  letterSpacing: 1.0,
                  height: 2.0,
                  wordSpacing: 1.0),
            ),
          ),
          Spacer(),
          Spacer(),
        ]),
      );
}

class HomeMobileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
    );
  }
}
