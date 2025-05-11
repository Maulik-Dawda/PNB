import 'package:flutter/material.dart';
import 'package:flutter_lec_6/settings.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List ofBasicModel = [
    {Icons: Icons.send_and_archive, "cardName": "Send Money"},
    {Icons: Icons.payments, "cardName": "Bills Pay"},
    {Icons: Icons.add_comment, "cardName": "Add Benificiary"},
    {Icons: Icons.change_circle, "cardName": "Change Password"},
    {Icons: Icons.wallet, "cardName": "E-Wallet"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Dashboard', style: TextStyle(color: Colors.white)),
        ),
        backgroundColor: Color.fromRGBO(16, 53, 127, 1),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromRGBO(16, 53, 127, 1),
              ),
              child: Row(
                children: [
                  CircleAvatar(),
                  SizedBox(width: 10),
                  Text("Maulik Dawda"),
                ],
              ),
            ),
            ListTile(
              onTap: (){
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));
              },
               leading: Icon(Icons.settings),
              title: Text("Settings"),
              trailing: Icon(Icons.forward),
            ) ,
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Image(
                image: AssetImage('assets/images/pnb.png'),
                width: 300,
                height: 70,
              ),
            ),
            Expanded(
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 1,
                ),
                children: [
                  for (int i = 0; i < ofBasicModel.length; i++) ...{
                    Card(
                      color: Color.fromRGBO(244, 244, 244, 1),
                      shadowColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            ofBasicModel[i][Icons],
                            color: Color.fromRGBO(16, 53, 127, 1),
                            size: 35,
                          ),
                          SizedBox(height: 20),
                          Text(ofBasicModel[i]['cardName']),
                        ],
                      ),
                    ),
                  },
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
