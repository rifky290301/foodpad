import 'package:flutter/material.dart';
import 'package:foodpad/common/styles.dart';
import 'package:foodpad/ui/authentication/login_page.dart';
import 'package:foodpad/ui/settings/about_us.dart';
import 'package:foodpad/ui/settings/account_settings.dart';
import 'package:foodpad/ui/settings/receipt_done_page.dart';
import 'package:share/share.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            physics: const ClampingScrollPhysics(),
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text('Pengaturan', style: helloTextStyle),
              ),
              const SizedBox(height: 16),
              ListTile(
                leading:
                    const Icon(Icons.account_circle, color: black, size: 28),
                title: const Text('Pengaturan Akun', style: blackTextStyle),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return AccountSettingsPage();
                    }),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.task, color: black, size: 29),
                title: const Text('Resep yang sudah diselesaikan',
                    style: blackTextStyle),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ReceiptDonePage();
                      },
                    ),
                  );
                },
              ),
              ListTile(
                  leading: const Icon(Icons.notifications_active,
                      color: black, size: 28),
                  title:
                      const Text('Nyalakan Notifikasi', style: blackTextStyle),
                  trailing: Switch.adaptive(
                      value: isEnabled,
                      onChanged: (value) {
                        setState(() {
                          isEnabled = value;
                          print(isEnabled);
                        });
                      })),
              ListTile(
                leading: const Icon(Icons.share, color: black, size: 29),
                title:
                    const Text('Bagikan aplikasi ini', style: blackTextStyle),
                onTap: () {
                  Share.share(
                      'Halo! Download aplikasi FoodPad sekarang juga dan nikmati serunya mencoba jutaan resep dalam satu aplikasi! https://github.com/rifky290301/foodpad');
                },
              ),
              ListTile(
                leading: const Icon(Icons.info, color: black, size: 28),
                title: const Text('Tentang Kami', style: blackTextStyle),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const AboutUsPage();
                      },
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout, color: orange, size: 28),
                title: const Text('Keluar', style: blackTextStyle),
                onTap: () {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text(
                        'Keluar',
                        style: titleTextStyle,
                      ),
                      content: const Text(
                          'Apakah kamu yakin ingin keluar dari akun ini?',
                          style: blackTextStyle),
                      actions: <Widget>[
                        ElevatedButton(
                          onPressed: () => Navigator.pop(context, 'CANCEL'),
                          child: const Text('Batal',
                              style: TextStyle(fontFamily: font, color: white)),
                        ),
                        TextButton(
                          onPressed: () =>
                              Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (_) => LoginPage()),
                          ),
                          child: const Text('Keluar',
                              style:
                                  TextStyle(fontFamily: font, color: orange)),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
