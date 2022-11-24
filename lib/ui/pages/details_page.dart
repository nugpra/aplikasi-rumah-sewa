import 'package:flutter/material.dart';
import 'package:housequ/models/city_model.dart';
import 'package:housequ/ui/widgets/custom_button.dart';
import 'package:housequ/ui/widgets/facility_item.dart';
import 'package:housequ/ui/widgets/photo_item.dart';
import '../../shared/themes.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsPage extends StatelessWidget {
  final CityModel city;
  const DetailsPage(this.city, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> openUrl(String url,
        {bool forceWebView = false, enableJavaScript = false}) async {
      await launch(url);
    }

    bool isClicked = false;

    Future<void> showConfirmation() async {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Confirmation'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text('Apakah kamu ingin menghubungi pemilik rumah sewa?'),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Batal',
                    style: greyTextstyle,
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    await openUrl(city.chatUrl);
                  },
                  child: Text(
                    'Hubungi',
                    style: purpleTextstyle.copyWith(fontWeight: semibold),
                  ),
                ),
              ],
            );
          });
    }

    Widget backgroundImage() {
      return Container(
        width: double.infinity,
        height: 450,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(city.imageUrl),
          ),
        ),
      );
    }

    Widget customShadow() {
      return Container(
        width: double.infinity,
        height: 214,
        margin: EdgeInsets.only(top: 236),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              kWihteColor.withOpacity(0),
              Colors.white.withOpacity(0.95),
            ],
          ),
        ),
      );
    }

    Widget content() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        child: Column(
          children: [
            //NOTE:TITLE
            Container(
              margin: EdgeInsets.only(top: 320),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          city.name,
                          style: blackTextstyle.copyWith(
                            fontSize: 24,
                            fontWeight: semibold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          city.city,
                          style: blackTextstyle.copyWith(
                            fontSize: 16,
                            fontWeight: light,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        margin: EdgeInsets.only(right: 2),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/icon_star.png',
                            ),
                          ),
                        ),
                      ),
                      Text(
                        '${city.rating}/5',
                        style: blackTextstyle.copyWith(
                          fontWeight: semibold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //NOTE : MAIN
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 30,
              ),
              decoration: BoxDecoration(
                color: kWihteColor,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // NOTE: FACILITIES
                  Text(
                    'Main Facilities',
                    style: blackTextstyle.copyWith(
                      fontSize: 16,
                      fontWeight: semibold,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FacilityItem(
                          name: city.nameFacility1,
                          imageUrl: city.imageFacility1,
                          total: city.numberFacility1,
                        ),
                        FacilityItem(
                          name: city.nameFacility2,
                          imageUrl: city.imageFacility2,
                          total: city.numberFacility2,
                        ),
                        FacilityItem(
                          name: city.nameFacility3,
                          imageUrl: city.imageFacility3,
                          total: city.numberFacility3,
                        ),
                      ],
                    ),
                  ),

                  // NOTE: PHOTOS
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Photos',
                    style: blackTextstyle.copyWith(
                      fontSize: 16,
                      fontWeight: semibold,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 1),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PhotoItem(imageUrl: city.photos1),
                          PhotoItem(imageUrl: city.photos2),
                          PhotoItem(imageUrl: city.photos3),
                          PhotoItem(imageUrl: city.photos4),
                          PhotoItem(imageUrl: city.photos5),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  //NOTE: LOCATION
                  Padding(
                    padding: EdgeInsets.only(left: 1),
                    child: Text(
                      'Location',
                      style: blackTextstyle.copyWith(
                        fontSize: 16,
                        fontWeight: semibold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            '${city.address} \n${city.city}',
                            style: greyTextstyle,
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            await openUrl(
                                city.mapUrl);
                          },
                          child: Image.asset(
                            'assets/btn_map.png',
                            width: 40,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // NOTE: PRICE & BOOK BUTTON
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 30),
              child: Row(
                children: [
                  // NOTE: PRICE
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Rp. ${city.price}',
                          style: purpleTextstyle.copyWith(
                            fontSize: 24,
                            fontWeight: semibold,
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          ' /month',
                          style: greyTextstyle.copyWith(
                            fontSize: 18,
                            fontWeight: light,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // NOTE: BOOK BUTTON
                  CustomButton(
                    title: 'Book Now',
                    onPressed: () {
                      showConfirmation();
                    },
                    width: 170,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget addButton() {
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: edge,
          vertical: 50,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/btn_back.png'),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isClicked = !isClicked;
                });
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(isClicked
                        ? 'assets/btn_wishlist_active.png'
                        : 'assets/btn_wishlist.png'),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            backgroundImage(),
            addButton(),
            customShadow(),
            content(),
          ],
        ),
      ),
    );
  }

  void setState(Null Function() param0) {}

}
