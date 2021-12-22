import 'package:flutter/material.dart';
import 'package:foodpad/common/styles.dart';
import 'package:foodpad/widgets/recipe_bottom_sheet.dart';

class ActionBar extends StatelessWidget {
  final String pageName;
  final String recipeId;
  const ActionBar(this.pageName, this.recipeId, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios, color: black),
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
                onTap: () => recipeBottomSheet(context, recipeId),
                child: const Icon(Icons.more_vert_rounded)),
            const SizedBox(width: 8),
          ],
        ),
      ],
    );
  }
}

class ActionBarNoMenu extends StatelessWidget {
  final String pageName;
  const ActionBarNoMenu(this.pageName, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, color: black),
        ),

      ],
    );
  }
}
