import 'package:flutter/material.dart';

class FavouriteTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image(image: AssetImage('assets/images/e-shop.png',
          ),
            height: 100,
            width: 350,
          )
        ],
      ),
    );
  }
}