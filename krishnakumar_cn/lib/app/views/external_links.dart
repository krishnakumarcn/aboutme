import 'package:flutter/material.dart';
import 'package:krishnakumar_cn/helpers/assets.dart';
import 'package:url_launcher/url_launcher.dart';

class ExternalLinks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        getLinkIcon(asset: Assets.linkedinIcon, url: 'https://www.linkedin.com/in/krishnakumarcn'),
        SizedBox(width: 12),
        getLinkIcon(
            asset: Assets.stackoverflowIcon, url: "https://stackoverflow.com/users/5546443/krishnakumarcn?tab=profile"),
        SizedBox(width: 12),
        getLinkIcon(asset: Assets.githubIcon, url: "https://github.com/krishnakumarcn/"),
        SizedBox(width: 12),
        getLinkIcon(asset: Assets.facebookIcon, url: "https://www.facebook.com/krishnakumarcn/"),
        SizedBox(width: 12),
        getLinkIcon(asset: Assets.instagramIcon, url: "https://www.instagram.com/krishnakumar_cn/"),
        SizedBox(width: 12),
        getLinkIcon(asset: Assets.mediumIcon, url: "https://krishnakumarcn.medium.com/"),
        SizedBox(width: 12),
        getLinkIcon(asset: Assets.youtubeIcon, url: "https://youtu.be/RGOFQ9nnhL4"),
        SizedBox(width: 12),
      ],
    );
  }

  getLinkIcon({required String asset, required String url}) {
    return SizedBox(
      width: 24,
      child: IconButton(
        splashColor: Colors.transparent,
        padding: EdgeInsets.all(0),
        icon: SizedBox(
            height: 18,
            width: 18,
            child: Center(
              child: Image.asset(
                asset,
                color: Colors.white.withOpacity(0.5),
                fit: BoxFit.cover,
              ),
            )),
        onPressed: () async {
          if (await canLaunch(url)) {
            launch(url);
          }
        },
      ),
    );
  }
}
