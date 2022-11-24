import 'package:flutter/material.dart';
import 'package:housequ/ui/widgets/tips_card.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../shared/themes.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    Widget newsSpace() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
          left: defaultMargin,
          right: defaultMargin,
          bottom: 80 + edge,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'News Update & Tips',
              style: blackTextstyle.copyWith(
                fontSize: 24,
                fontWeight: semibold,
              ),
            ),
            TipsCard(
              name: 'News Update',
              imageUrl: 'assets/tips1.png',
              mapsUrl: 'https://www.medcom.id/properti/tips-properti/9K5XOWak-milenial-begini-caranya-punya-rumah',
            ),
            TipsCard(
              name: 'Tips & Trick',
              imageUrl: 'assets/tips2.png',
              mapsUrl: 'https://www.mustikaland.co.id/news/tips-cari-kontrakan-rumah-yang-tepat-untuk-pasangan-baru/',
            ),
          ],
        ),
      );
    }

    return ListView(
      children: [
        newsSpace(),
      ],
    );
  }
}
