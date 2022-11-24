import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../shared/themes.dart';

class TipsCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String mapsUrl;

  const TipsCard(
      {Key? key, required this.name, required this.imageUrl, required this.mapsUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> openUrl(String url,
        {bool forceWebView = false, enableJavaScript = false}) async {
      await launch(url);
    }

    return GestureDetector(
      onTap: () async {
        await openUrl(mapsUrl);
      },
      child: Container(
        margin: EdgeInsets.only(
          top: 16,
        ),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: kWihteColor,
          borderRadius: BorderRadius.circular(defaultRadius),
        ),
        child: Row(
          children: [
            Container(
              width: 80,
              height: 80,
              margin: EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(defaultRadius),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(imageUrl),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: blackTextstyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  margin: EdgeInsets.only(right: 2),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/btn_details.png',
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
