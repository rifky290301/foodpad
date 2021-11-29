import 'package:flutter/material.dart';
import 'package:foodpad/common/styles.dart';

void receiptBottomSheet(BuildContext context) {
  showModalBottomSheet<void>(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
    ),
    backgroundColor: Colors.white,
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: 190,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Column(
            children: [
              SizedBox(height: 6),
              Container(
                decoration: BoxDecoration(
                  color: gray,
                  borderRadius: BorderRadius.circular(12),
                ),
                height: 5,
                width: 50,
              ),
              SizedBox(height: 12),
              Expanded(
                child: ListView(
                  itemExtent: 50,
                  children: ListTile.divideTiles(
                    color: Colors.transparent,
                    context: context,
                    tiles: [
                      ListTile(
                        title: const Text('Tambahkan ke Favorit',
                            style: itemTextStyle),
                        onTap: () {},
                      ),
                      ListTile(
                        title: const Text('Laporkan resep ini',
                            style: itemTextStyle),
                        onTap: () {},
                      ),
                      ListTile(
                          title: const Text('Batal',
                              style: TextStyle(
                                fontFamily: font,
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                color: Colors.red,
                              )),
                          onTap: () {
                            Navigator.pop(context);
                          }),
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
