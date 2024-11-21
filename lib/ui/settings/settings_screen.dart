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
    // inisialisasi themeProvider dikelas kita
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
          actions: [
            IconButton(
                onPressed: () {
                  // kalau kita gak nge set apapun, yg muncul pertama positive = true. pake bang operator. kalau true yg muncul pertama itu yg light mode
                  themeProvider.toggleTheme(!themeProvider.isDarkTheme);
                },
                icon: Icon(
                  themeProvider.isDarkTheme
                      ? Icons.dark_mode
                      : Icons.light_mode,
                  color: themeProvider.isDarkTheme
                      ? Colors.amberAccent
                      : Colors.black,
                ))
          ],
        ),
        body: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(defaultpadding),
              child: Text(
                "Account",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
            ),
            const ListTile(
              leading: FaIcon(FontAwesomeIcons.solidBell),
              title: Text("Notification Setting"),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                  horizontal: 20.0), // Atur margin di sini
              child: const Divider(),
            ),
            const ListTile(
              leading: FaIcon(FontAwesomeIcons.cartShopping),
              title: Text("Shipping Adress"),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                  horizontal: 20.0), // Atur margin di sini
              child: const Divider(),
            ),
            const ListTile(
              leading: FaIcon(FontAwesomeIcons.wallet),
              title: Text("Payment Info"),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                  horizontal: 20.0), // Atur margin di sini
              child: const Divider(),
            ),
            const ListTile(
              leading: FaIcon(FontAwesomeIcons.trash),
              title: Text("Delete Account"),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            const Padding(
              padding: EdgeInsets.all(defaultpadding),
              child: Text(
                "App Settings",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
            ),
            const ListTile(
              title: Text("Eneble Face ID For Log In"),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            const ListTile(
              title: Text("Eneble Push Notifications"),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            const ListTile(
              title: Text("Enable Location Service"),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
          ],
        )));
  }
}
