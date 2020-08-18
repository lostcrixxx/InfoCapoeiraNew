import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:info_capoeira/screens/exit_screen.dart';
import 'package:info_capoeira/screens/home_screen.dart';
import 'package:info_capoeira/screens/insta_screen.dart';
import 'package:share/share.dart';

import 'screens/face_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int index = 0;
  List<Widget> list = [HomeScreen(), Facebook(), Instagram(), Saida()];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Canal do Youtube'),
        ),
        body: list[index],
        drawer: MyDrawer(
          onTap: (ctx, i) {
            setState(() {
              index = i;
              Navigator.pop(ctx);
            });
          },
        ),
      ),
      theme: ThemeData(
        primaryColor: Colors.green,
      ),
//      home: HomeScreen(),
    );
  }
}

class MyDrawer extends StatelessWidget {
  final Function onTap;

  MyDrawer({this.onTap});

  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.green),
              child: Padding(
                padding: EdgeInsets.all(6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      width: 60,
                      height: 60,
//                      child: CircleAvatar(
//                        backgroundImage: AssetImage('images/happy.jpg'),
//                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Canal Info Capoeira',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      '',
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Página Inicial'),
              onTap: () => onTap(context, 0),
            ),
//            ListTile(
//              leading: Icon(Icons.book),
//              title: Text('Página Facebook'),
//              onTap: () => onTap(context, 1),
//            ),
//            ListTile(
//              leading: Icon(Icons.linked_camera),
//              title: Text('Perfil Instagram'),
//              onTap: () => onTap(context, 2),
//            ),
            Divider(
              height: 1,
            ),
            ListTile(
              leading: Icon(Icons.share),
              title: Text('Compartilhar'),
              onTap: () => Share.share('Baixe o aplicativo do Canal Info Capoeira. https://play.google.com/store/apps/details?id=br.com.envolvedesenvolve.infocapoeira'),
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Sair'),
              onTap: () =>
                  SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
            ),
          ],
        ),
      ),
    );
  }
}
