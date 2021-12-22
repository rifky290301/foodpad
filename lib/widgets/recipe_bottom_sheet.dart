import 'package:flutter/material.dart';
import 'package:foodpad/api/api_service.dart';
import 'package:foodpad/common/styles.dart';
import 'package:foodpad/provider/favorite_provider.dart';
import 'package:foodpad/provider/report_provider.dart';
import 'package:provider/provider.dart';

enum ReportRecipe { notApplicable, dangerous, notLike, notHalal }
ReportRecipe? _report = ReportRecipe.notApplicable;

FavoriteProvider instanceFavorite = FavoriteProvider(apiService: ApiService());

void recipeBottomSheet(BuildContext context, idRecipe) {
  showModalBottomSheet<void>(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
    ),
    backgroundColor: Colors.white,
    context: context,
    builder: (BuildContext context) {
      return SizedBox(
        height: 190,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            children: [
              const SizedBox(height: 6),
              Container(
                decoration: BoxDecoration(
                  color: grey,
                  borderRadius: BorderRadius.circular(12),
                ),
                height: 5,
                width: 50,
              ),
              const SizedBox(height: 12),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  itemExtent: 50,
                  children: ListTile.divideTiles(
                    color: Colors.transparent,
                    context: context,
                    tiles: [
                      ListTile(
                        title: const Text('Tambahkan ke Favorit',
                            style: itemTextStyle),
                        onTap: () {
                          instanceFavorite.addFavorite(idRecipe);
                          Navigator.pop(context);
                        },
                      ),
                      ChangeNotifierProvider<ReportProvider>(
                        create: (_) => ReportProvider(
                            apiService: ApiService(),
                            idRecipe: idRecipe.toString()),
                        child: Consumer<ReportProvider>(
                            builder: (context, state, _) {
                          if (state.state == ResultStateReport.loading ||
                              state.state == ResultStateReport.error ||
                              state.state == ResultStateReport.noData) {
                            return ListTile(
                              title: const Text('Laporkan resep ini',
                                  style: itemTextStyle),
                              onTap: () {
                                showDialog<void>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return ReportAlertDialog(
                                      idRecipe: idRecipe.toString(),
                                      state: state,
                                    );
                                  },
                                );
                              },
                            );
                          } else {
                            return const ListTile(
                              title: Text(
                                'Laporkan resep ini',
                                style: TextStyle(
                                  fontFamily: font,
                                  fontSize: 14,
                                  color: grey,
                                ),
                              ),
                            );
                          }
                        }),
                      ),
                      ListTile(
                        title: const Text(
                          'Batal',
                          style: TextStyle(
                            fontFamily: font,
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            color: Colors.red,
                          ),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ).toList(),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

class ReportAlertDialog extends StatelessWidget {
  String idRecipe;
  ReportProvider state;
  ReportAlertDialog({Key? key, required this.idRecipe, required this.state})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Laporkan Resep", style: titleTextStyle),
      content: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('Resep ini tidak sesuai dengan aslinya',
                  style: blackTextStyle),
              trailing: Radio<ReportRecipe>(
                value: ReportRecipe.notApplicable,
                groupValue: _report,
                onChanged: (ReportRecipe? value) {
                  setState(() {
                    _report = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Resep ini tidak aman dikonsumsi',
                  style: blackTextStyle),
              trailing: Radio<ReportRecipe>(
                value: ReportRecipe.dangerous,
                groupValue: _report,
                onChanged: (ReportRecipe? value) {
                  setState(() {
                    _report = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Resep ini tidak halal', style: blackTextStyle),
              trailing: Radio<ReportRecipe>(
                value: ReportRecipe.notHalal,
                groupValue: _report,
                onChanged: (ReportRecipe? value) {
                  setState(() {
                    _report = value;
                  });
                },
              ),
            ),
          ],
        );
      }),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () => Navigator.pop(context, 'CANCEL'),
          child: const Text('Batal',
              style: TextStyle(fontFamily: font, color: white)),
        ),
        TextButton(
          onPressed: () {
            state.addreport(_report);
            showDialog<String>(
              barrierDismissible: false,
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text(
                  'Laporan sudah dikirim',
                  style: titleTextStyle,
                ),
                content: const Text(
                    'Terima kasih! Kami akan mengevaluasi resep yang masuk ke dalam aplikasi ini supaya aplikasi ini menjadi lebih baik lagi.',
                    style: blackTextStyle),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    child: const Text('Oke', style: orangeSmallTextStyle),
                  ),
                ],
              ),
            );
          },
          child: const Text('Kirim',
              style: TextStyle(fontFamily: font, color: orange)),
        ),
      ],
    );
  }
}
