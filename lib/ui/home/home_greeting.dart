import 'package:flutter/material.dart';
import 'package:foodpad/common/styles.dart';

class Greeting extends StatelessWidget {
  const Greeting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Halo, Delvin', style: helloTextStyle),
                Text('Mau masak apa hari ini?',
                    style: TextStyle(fontFamily: font, color: black)),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://cdn.discordapp.com/attachments/695938257577443379/909992232701030490/pp.jpg',
                ),
                radius: 28),
          ),
        ],
      ),
    );
  }
}
