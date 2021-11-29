import 'package:flutter/material.dart';
import 'package:foodpad/common/styles.dart';
import 'package:foodpad/ui/receipt_detail/detail_page.dart';
import 'package:foodpad/widgets/receipt_bottom_sheet.dart';

class RecommendedList extends StatelessWidget {
  const RecommendedList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            Text('Rekomendasi Buat Kamu', style: headingTextStyle),
          ],
        ),
        const SizedBox(height: 12),
        GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          childAspectRatio: (160 / 265),
          mainAxisSpacing: 5,
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          children: List.generate(20, (index) {
            return CardRecommended();
          }),
        ),
      ],
    );
  }
}

class CardRecommended extends StatelessWidget {
  const CardRecommended({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: white,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, DetailPage.routeName),
        child: Container(
          width: 160,
          child: Column(
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.network(
                  'https://images.unsplash.com/photo-1595295333158-4742f28fbd85?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8& auto=format&fit=crop&w=880&q=80',
                  height: 180,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(children: [
                  const SizedBox(height: 4),
                  Text('Spageti Seafood Pedas',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: itemTitleTextStyle),
                  const SizedBox(height: 12),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(Icons.star_rounded,
                          size: 18, color: orangeSecondary),
                      Icon(Icons.star_rounded,
                          size: 18, color: orangeSecondary),
                      Icon(Icons.star_rounded,
                          size: 18, color: orangeSecondary),
                      Icon(Icons.star_rounded,
                          size: 18, color: orangeSecondary),
                      Icon(Icons.star_half_rounded,
                          size: 18, color: orangeSecondary),
                      SizedBox(width: 4),
                      Text('4.5/5', style: smallSubtitleTextStyle),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.av_timer_outlined,
                              size: 18, color: orange),
                          SizedBox(width: 2),
                          Text('60 mnt',
                              style: TextStyle(
                                  fontFamily: font, fontSize: 11, color: grey)),
                          SizedBox(width: 6),
                          Icon(Icons.insert_chart, size: 18, color: orange),
                          SizedBox(width: 2),
                          Text('Mudah',
                              style: TextStyle(
                                  fontFamily: font, fontSize: 11, color: grey)),
                        ],
                      ),
                      Row(
                        children: [
                          InkWell(
                              onTap: () => receiptBottomSheet(context),
                              child:
                                  Icon(Icons.more_horiz, size: 20, color: grey))
                        ],
                      ),
                    ],
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
