import 'package:anime_app/Screens/Splash.dart';
import 'package:anime_app/providers/get_data_provider.dart';
import 'package:anime_app/utils/utils.dart'; // Make sure this import is correct
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'constants/styles/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => GetDataProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          scaffoldMessengerKey:
              Utils.messengerKey, // Ensure Utils is correctly imported
          theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
          darkTheme:
              ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
          home: const Splash(),
        ));
  }
}
//
//class Utils {
//  static final messengerKey = GlobalKey<ScaffoldMessengerState>();
//
//  static showError(String? text) {
//    if (text == null) return;
//    final snackBar = SnackBar(
//      content: Text(text),
//      backgroundColor: Colors.red.withOpacity(0.3),
//    );
//
//    messengerKey.currentState!
//      ..removeCurrentSnackBar()
//      ..showSnackBar(snackBar);
//  }
//
//  static showSuccess(String? text) {
//    if (text == null) return;
//    final snackBar = SnackBar(
//      content: Text(text),
//      backgroundColor: Colors.green,
//    );
//
//    messengerKey.currentState!
//      ..removeCurrentSnackBar()
//      ..showSnackBar(snackBar);
//  }
//}
