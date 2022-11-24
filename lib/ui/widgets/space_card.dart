import 'package:flutter/material.dart';
import 'package:housequ/models/city_model.dart';
import 'package:housequ/ui/pages/details_page.dart';
import '../../shared/themes.dart';

class SpaceCard extends StatelessWidget {
  final CityModel city;

  const SpaceCard(
    this.city, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsPage(city),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(top: 16),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: kWihteColor,
          borderRadius: BorderRadius.circular(defaultRadius),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(defaultRadius),
              child: Container(
                width: 130,
                height: 110,
                child: Stack(
                  children: [
                    Image.network(
                      city.imageUrl,
                      fit: BoxFit.cover,
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: 70,
                        height: 30,
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(36),
                          ),
                        ),
                        child: Center(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/icon_star.png',
                              width: 22,
                              height: 22,
                            ),
                            Text(
                              "${city.rating}/5",
                              style: whiteTextstyle.copyWith(
                                fontSize: 13,
                                fontWeight: regular,
                              ),
                            )
                          ],
                        )),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    city.name,
                    style: blackTextstyle.copyWith(
                      fontSize: 18,
                      fontWeight: semibold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text.rich(
                    TextSpan(
                      text: 'Rp. ${city.price}',
                      style: purpleTextstyle.copyWith(
                        fontSize: 16,
                        fontWeight: semibold,
                      ),
                      children: [
                        TextSpan(
                            text: '/Month',
                            style: greyTextstyle.copyWith(
                                fontSize: 16, fontWeight: medium))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    '${city.city}',
                    style: greyTextstyle,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 50 + edge,
            )
          ],
        ),
      ),
    );
  }
}
