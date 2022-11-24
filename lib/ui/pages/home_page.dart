import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:housequ/cubit/auth_cubit.dart';
import 'package:housequ/cubit/city_cubit.dart';
import 'package:housequ/models/city_model.dart';
import 'package:housequ/ui/widgets/city_card.dart';
import 'package:housequ/ui/widgets/space_card.dart';
import '../../shared/themes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<CityCubit>().fetchCity();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget Header() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
              margin: EdgeInsets.only(
                left: defaultMargin,
                right: defaultMargin,
                top: 30,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Howdy,\n${state.user.name} ',
                          style: blackTextstyle.copyWith(
                            fontSize: 24,
                            fontWeight: semibold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          'Find your own comfort zone',
                          style: greyTextstyle.copyWith(
                            fontSize: 16,
                            fontWeight: light,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images_profile.png'),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return SizedBox();
          }
        },
      );
    }

    Widget PopularDistrict() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Popular District',
              style: blackTextstyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CityCard(
                      name: 'Cikupa',
                      imageUrl: 'assets/cikupa1.jpg',
                    ),
                    CityCard(
                      name: 'Karawaci',
                      imageUrl: 'assets/karawaci.jpg',
                      isPopular: true,
                    ),
                    CityCard(
                      name: 'Tangerang',
                      imageUrl: 'assets/tangerang.png',
                      isPopular: true,
                    ),
                    CityCard(
                      name: 'Ciledug',
                      imageUrl: 'assets/ciledug.png',
                    ),
                    CityCard(
                      name: 'Tigaraksa',
                      imageUrl: 'assets/tigaraksa.jpg',
                    ),
                    CityCard(
                      name: 'Pinang',
                      imageUrl: 'assets/pinang.jpg',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget RecommendedSpace(List<CityModel> city) {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recommended Space',
              style: blackTextstyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
           Column(
            children: city.map((CityModel city) {
              return SpaceCard(city);
            }).toList(),
           ),
            SizedBox(
              height: 60 + edge,
            ),
          ],
        ),
      );
    }

    return BlocConsumer<CityCubit, CityState>(
      listener: (context, state) {
        if (state is CityFailed) {  
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: kRedColor,
              content: Text(state.error),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is CitySuccess) {
          return ListView(
            children: [
              Header(),
              PopularDistrict(),
              RecommendedSpace(state.city),
            ],
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
