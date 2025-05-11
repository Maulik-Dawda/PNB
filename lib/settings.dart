import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  List services = [
    {"serviceName": "Send Money", "btnIsTrue": false},
    {"serviceName": "Bills Pay", "btnIsTrue": false},
    {"serviceName": "Add Benificiary", "btnIsTrue": false},
    {"serviceName": "Change Password", "btnIsTrue": false},
    {"serviceName": "E-Wallet", "btnIsTrue": false},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings", style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromRGBO(16, 53, 127, 1),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "MFA",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Icon(Icons.keyboard_arrow_down),
              ],
            ),
            SizedBox(height: 30),
            for (int i = 0; i < services.length; i++) ...{
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(services[i]["serviceName"]),
                      ),
                      Switch.adaptive(
                        value: services[i]["btnIsTrue"],
                        onChanged: (val) {
                          services[i]["btnIsTrue"] = val;
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Divider(color: Colors.grey, thickness: 1),
                  SizedBox(height: 5),
                ],
              ),
            },
            SizedBox(height: 10),
            Divider(color: Colors.black, thickness: 1.5),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Other Settings",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Icon(Icons.keyboard_arrow_down),
              ],
            ),
            SizedBox(height: 10),
            Align(alignment: Alignment.topLeft, child: Text("Biometric")),
          ],
        ),
      ),
    );
  }
}
