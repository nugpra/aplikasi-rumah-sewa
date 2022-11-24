import 'package:flutter/material.dart';
import 'package:housequ/ui/widgets/space_tile.dart';
import '../../shared/themes.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget wishlistTile() {
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
              'Your Wishlist House',
              style: blackTextstyle.copyWith(
                fontSize: 24,
                fontWeight: semibold,
              ),
            ),
            SpaceTile(
              name: 'Kontrakan Pak Haji',
              city: 'Cikupa, Kab. Tangerang',
              imageUrl: 'assets/city1.png',
            ),
            SpaceTile(
              name: 'Kontrakan Pak Haji',
              city: 'Cikupa, Kab. Tangerang',
              imageUrl: 'assets/city3.png',
            ),
            SpaceTile(
              name: 'Kontrakan Pak Haji',
              city: 'Cikupa, Kab. Tangerang',
              imageUrl: 'assets/city2.png',
            ),
            SpaceTile(
              name: 'Kontrakan Pak Haji',
              city: 'Cikupa, Kab. Tangerang',
              imageUrl: 'assets/city2.png',
            ),
            SpaceTile(
              name: 'Kontrakan Pak Haji',
              city: 'Cikupa, Kab. Tangerang',
              imageUrl: 'assets/city2.png',
            ),
            SpaceTile(
              name: 'Kontrakan Pak Haji',
              city: 'Cikupa, Kab. Tangerang',
              imageUrl: 'assets/city2.png',
            ),
            SpaceTile(
              name: 'Kontrakan Pak Haji',
              city: 'Cikupa, Kab. Tangerang',
              imageUrl: 'assets/city2.png',
            ),

          ],
        ),
      );
    }

    return ListView(
      children: [
        wishlistTile(),
      ],
    );
  }
}
