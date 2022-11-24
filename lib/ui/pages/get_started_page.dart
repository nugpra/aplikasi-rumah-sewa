import 'package:flutter/material.dart';
import 'package:housequ/ui/widgets/custom_button.dart';
import '../../shared/themes.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset('assets/splash_image.png')),
            Padding(
              padding: EdgeInsets.only(
                top: 50,
                left: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/icon_house.png'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Find Cozy House\nto Stay and Happy',
                    style: blackTextstyle.copyWith(
                      fontWeight: medium,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Stop membuang banyak waktu\nTemukan hunian versimu sendiri\nDisini!!!',
                    style: greyTextstyle.copyWith(
                      fontWeight: regular,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  CustomButton(
                    title: 'Find Now',
                    width: 210,
                    onPressed: () {
                      Navigator.pushNamed(context, '/sign-up');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
