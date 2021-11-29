import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:foodpad/common/styles.dart';
import 'package:foodpad/ui/error/no_favorite.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Favorit', style: helloTextStyle),
                      Text('10 Resep kesukaanmu', style: blackTextStyle),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                ListView.builder(
                    itemCount: 10,
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.only(bottom: 12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(6),
                                child: Image.network(
                                  'https://images.unsplash.com/photo-1595295333158-4742f28fbd85?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8& auto=format&fit=crop&w=880&q=80',
                                  width: 90,
                                  height: 90,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(top: 8, bottom: 8, right: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Spageti Seafood Pedas',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: headingTextStyle),
                                  const SizedBox(height: 16),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Icon(Icons.star_rounded,
                                          size: 20, color: orangeSecondary),
                                      Icon(Icons.star_rounded,
                                          size: 20, color: orangeSecondary),
                                      Icon(Icons.star_rounded,
                                          size: 20, color: orangeSecondary),
                                      Icon(Icons.star_rounded,
                                          size: 20, color: orangeSecondary),
                                      Icon(Icons.star_half_rounded,
                                          size: 20, color: orangeSecondary),
                                      const SizedBox(width: 4),
                                      Text(
                                        '4.5/5',
                                        style: TextStyle(
                                            fontFamily: font,
                                            fontSize: 12,
                                            color: gray),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 245,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Row(
                                              children: const [
                                                Icon(Icons.av_timer_outlined,
                                                    size: 18, color: orange),
                                                SizedBox(width: 2),
                                                Text('60 mnt',
                                                    style: TextStyle(
                                                        fontFamily: font,
                                                        fontSize: 12,
                                                        color: gray)),
                                                SizedBox(width: 6),
                                                Icon(Icons.insert_chart,
                                                    size: 18, color: orange),
                                                SizedBox(width: 2),
                                                Text('Mudah',
                                                    style: TextStyle(
                                                        fontFamily: font,
                                                        fontSize: 12,
                                                        color: gray)),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    showDialog<String>(
                                                      context: context,
                                                      builder: (BuildContext
                                                              context) =>
                                                          AlertDialog(
                                                        title: const Text(
                                                          'Hapus Resep Favorit',
                                                          style: titleTextStyle,
                                                        ),
                                                        content: const Text(
                                                            'Apakah kamu yakin ingin menghapus resep ini dari favorit?',
                                                            style:
                                                                blackTextStyle),
                                                        actions: <Widget>[
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    context,
                                                                    'CANCEL'),
                                                            child: const Text(
                                                                'Batal',
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        font,
                                                                    color:
                                                                        orange)),
                                                          ),
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    context,
                                                                    'DELETE'),
                                                            child: const Text(
                                                                'Ya, Hapus',
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        font,
                                                                    color:
                                                                        orange)),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                  child: Icon(
                                                      Icons.delete_forever,
                                                      color: Colors.red,
                                                      size: 28),
                                                )
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
