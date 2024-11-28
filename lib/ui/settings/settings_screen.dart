import 'package:e_commerce/consts.dart';
import 'package:e_commerce/state-management/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    // Ambil warna teks yang sesuai dengan mode tema
    final textColor = themeProvider.isDarkTheme ? Colors.white : Colors.black;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamed(context, '/home');
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              themeProvider.toggleTheme(!themeProvider.isDarkTheme);
            },
            icon: Icon(
              themeProvider.isDarkTheme ? Icons.dark_mode : Icons.light_mode,
              color:
                  themeProvider.isDarkTheme ? Colors.amberAccent : Colors.black,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(defaultpadding),
              child: Text(
                "Account",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: textColor), // Menggunakan warna dinamis
              ),
            ),
            const ListTile(
              leading: FaIcon(FontAwesomeIcons.solidBell),
              title: Text("Notification Setting"),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              child: const Divider(),
            ),
            const ListTile(
              leading: FaIcon(FontAwesomeIcons.cartShopping),
              title: Text("Shipping Address"),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              child: const Divider(),
            ),
            const ListTile(
              leading: FaIcon(FontAwesomeIcons.wallet),
              title: Text("Payment Info"),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              child: const Divider(),
            ),
            const ListTile(
              leading: FaIcon(FontAwesomeIcons.trash),
              title: Text("Delete Account"),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            Padding(
              padding: const EdgeInsets.all(defaultpadding),
              child: Text(
                "App Settings",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: textColor), // Menggunakan warna dinamis
              ),
            ),
            const ListTile(
              title: Text("Enable Face ID For Log In"),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            const ListTile(
              title: Text("Enable Push Notifications"),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            const ListTile(
              title: Text("Enable Location Service"),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            // Menambahkan ListTile untuk Logout
            Padding(
              padding: const EdgeInsets.all(defaultpadding),
              child: Text(
                "Account Management",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: textColor), // Menggunakan warna dinamis
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.exit_to_app,
                color: Colors.red,
              ),
              title: const Text("Logout"),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              onTap: () {
                Navigator.pushNamed(context, '/on-boarding');
                // Logic logout dapat ditambahkan di sini
                // Misalnya, memanggil fungsi untuk keluar dari akun
                // Navigator.pushNamed(context, '/login'); // Arahkan ke layar login
              },
            ),
          ],
        ),
      ),
    );
  }
}
