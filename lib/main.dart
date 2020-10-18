import 'package:app_band_name/providers/socket_provider.dart';
import 'package:app_band_name/src/pages/home_page.dart';
import 'package:app_band_name/src/pages/status.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Socketprovider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'home',
        routes: {
          '/': (_) => HomePage(),
          'status': (_) => StatusPage(),
        },
      ),
    );
  }
}
