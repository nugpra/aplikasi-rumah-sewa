import 'package:flutter/material.dart';
import '../../shared/themes.dart';

class FacilityItem extends StatelessWidget {
  final String name;
  final String imageUrl;
  final total;

  const FacilityItem(
      {Key? key,
      required this.name,
      required this.imageUrl,
      required this.total})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageUrl),
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text.rich(
          TextSpan(
            text: '$total',
            style: purpleTextstyle.copyWith(
              fontSize: 14,
            ),
            children: [
              TextSpan(
                  text: ' $name',
                  style: greyTextstyle.copyWith(
                    fontSize: 14,
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
