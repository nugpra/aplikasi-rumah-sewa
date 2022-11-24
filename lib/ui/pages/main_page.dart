import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:housequ/cubit/page_cubit.dart';
import 'package:housequ/ui/pages/details_page.dart';
import 'package:housequ/ui/pages/home_page.dart';
import 'package:housequ/ui/pages/news_page.dart';
import 'package:housequ/ui/pages/setting_page.dart';
import 'package:housequ/ui/pages/wishlist_page.dart';
import 'package:housequ/ui/widgets/custom_button_navigation_item.dart';
import '../../shared/themes.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildContent(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return HomePage();
        case 1:
          return WishlistPage();
        case 2:
          return NewsPage();
        case 3:
          return SettingPage();
        default:
          return HomePage();
      }
    }

    Widget customBottomNavigation() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: EdgeInsets.only(
            bottom: 30,
            left: defaultMargin,
            right: defaultMargin,
          ),
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            color: kWihteColor,
            borderRadius: BorderRadius.circular(defaultRadius),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomButtonNavigationItem(
                index: 0,
                imageUrl: 'assets/icon_home.png',
              ),
              CustomButtonNavigationItem(
                index: 1,
                imageUrl: 'assets/icon_love.png',
              ),
              CustomButtonNavigationItem(
                index: 2,
                imageUrl: 'assets/icon_card.png',
              ),
              CustomButtonNavigationItem(
                index: 3,
                imageUrl: 'assets/icon_settings.png',
              ),
            ],
          ),
        ),
      );
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          backgroundColor: kBackgroundColor,
          body: Stack(
            children: [
              buildContent(currentIndex),
              customBottomNavigation(),
            ],
          ),
        );
      },
    );
  }
}
