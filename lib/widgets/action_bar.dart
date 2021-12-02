import 'package:flutter/material.dart';
import 'package:foodpad/common/styles.dart';
import 'package:foodpad/widgets/recipe_bottom_sheet.dart';

class ActionBar extends StatelessWidget {
  final String pageName;
  ActionBar(this.pageName);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back_ios, color: black),
            ),
          ],
        ),
        Row(
          children: [
            Text(pageName, style: titleTextStyle),
          ],
        ),
        Row(
          children: [
            InkWell(
                onTap: () => recipeBottomSheet(context),
                child: Icon(Icons.more_vert_rounded)),
            SizedBox(width: 8),
          ],
        ),
      ],
    );
  }
}
