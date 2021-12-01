import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:foodpad/common/styles.dart';
import 'package:foodpad/ui/home/card_recommended.dart';
import 'package:foodpad/ui/recipe_detail/detail_page.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Favorit', style: helloTextStyle),
                      Text('10 Resep kesukaanmu', style: blackTextStyle),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                ListView.builder(
                    itemCount: 10,
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () =>
                            Navigator.pushNamed(context, DetailPage.routeName),
                        child: Card(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(6),
                                  child: Image.network(
                                    'https://images.unsplash.com/photo-1595295333158-4742f28fbd85?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8& auto=format&fit=crop&w=880&q=80',
                                    width: 85,
                                    height: 85,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 8, bottom: 8, right: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 250,
                                      child: Text(
                                          'Spageti Seafood Pedas dfasdf asdf asdf adsf das fs fdas f',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: itemTitleTextStyle),
                                    ),
                                    const SizedBox(height: 18),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
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
                                              color: grey),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 250,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
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
                                                          color: grey)),
                                                  SizedBox(width: 6),
                                                  Icon(Icons.insert_chart,
                                                      size: 18, color: orange),
                                                  SizedBox(width: 2),
                                                  Text('Mudah',
                                                      style: TextStyle(
                                                          fontFamily: font,
                                                          fontSize: 12,
                                                          color: grey)),
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
                                                            style:
                                                                titleTextStyle,
                                                          ),
                                                          content: const Text(
                                                              'Apakah kamu yakin ingin menghapus resep ini dari favorit?',
                                                              style:
                                                                  blackTextStyle),
                                                          actions: <Widget>[
                                                            ElevatedButton(
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
                                                                          white)),
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
                                                    child: const Icon(
                                                        Icons.delete_forever,
                                                        color: orange,
                                                        size: 26),
                                                  ),
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
                        ),
                      );
                    }),
                Divider(
                  color: grey,
                ),
                SizedBox(height: 8),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text('Rekomendasi Buat Kamu', style: headingTextStyle),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 278,
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return HomeCardRecommended();
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
