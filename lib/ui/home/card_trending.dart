import 'package:flutter/material.dart';
import 'package:foodpad/common/styles.dart';
import 'package:foodpad/ui/receipt_detail/detail_page.dart';
import 'package:foodpad/widgets/receipt_bottom_sheet.dart';

class HomeCardTrending extends StatelessWidget {
  const HomeCardTrending({Key? key}) : super(key: key);

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
                  'https://kurio-img.kurioapps.com/21/07/09/fa3ee637-aefa-4946-a0f1-e6dd9f7ca281.jpe',
                  height: 160,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(children: [
                  Text('Mie Goreng Ayam Geprek + Telur Goreng',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: itemTitleTextStyle),
                  const SizedBox(height: 12),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(Icons.star_rounded,
                          size: 16, color: orangeSecondary),
                      Icon(Icons.star_rounded,
                          size: 16, color: orangeSecondary),
                      Icon(Icons.star_rounded,
                          size: 16, color: orangeSecondary),
                      Icon(Icons.star_rounded,
                          size: 16, color: orangeSecondary),
                      Icon(Icons.star_half_rounded,
                          size: 16, color: orangeSecondary),
                      SizedBox(width: 4),
                      Text('4.5/5', style: smallSubtitleTextStyle),
                    ],
                  ),
                  SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.av_timer_outlined,
                              size: 18, color: orange),
                          SizedBox(width: 1),
                          Text('90 mnt', style: smallSubtitleTextStyle),
                          SizedBox(width: 4),
                          Icon(Icons.insert_chart, size: 18, color: orange),
                          SizedBox(width: 1),
                          Text('Rumit', style: smallSubtitleTextStyle),
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
