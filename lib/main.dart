import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:tixclick/widgets/custom_button.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 3, 3, 3),
        ),
      ),
      // initialRoute: Day16SplashScreen.id,
      // routes: {
      //   "/loginscreen": (context) => Day9T6TextRich(),
      //   LoginAPIScreen.id: (context) => LoginAPIScreen(),
      //   Day16SplashScreen.id: (context) => Day16SplashScreen(),
      //   Day7GridView.id: (context) => Day7GridView(),
      //   Navt8.id: (context) => Navt8(),
      //   PostApiScreen.id: (context) => PostApiScreen(),
      // },
      home: Bottom(),
    );
  }
}
