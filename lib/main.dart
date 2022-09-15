import 'package:flutter/material.dart';
import 'constants/constants.dart';
import 'screens/home_screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  /// A boolean field to keep track of darkMode is ON or OFF. By default, OFF.
  bool darkModeOn = false;

  /// If a scaffoldMessengerKey is specified, the ScaffoldMessenger can be directly manipulated without first obtaining it from a BuildContext via ScaffoldMessenger.of.
  final _messengerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    /// IconButton when pressed switches from light to dark mode and vice versa.
    List<Widget> appBarActionsList = [IconButton(
        icon: Icon(
          darkModeOn ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
        ),
        onPressed: () {
          setState(() {
            darkModeOn = !darkModeOn;
            _messengerKey.currentState?.showSnackBar(
              SnackBar(
                content: Text(
                  darkModeOn ? "Switched to dark mode" : "Switched to light mode",
                ),
              ),
            );
          });
        },
      )];

    /// Leading IconButton when pressed opens a NavigationRail.
    IconButton leadingIconButton = IconButton(
      icon: const Icon(Icons.menu),

      /// TODO: IconButton on press opens a NavigationRail
      onPressed: () => _messengerKey.currentState?.showSnackBar(
        const SnackBar(
          content: Text(
            "Button that opens Navigation Rail",
          ),
        ),
      ),
    );

    /// AppBar for the main screen
    AppBar appBar = AppBar(
      titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
      actionsIconTheme: Theme.of(context).appBarTheme.actionsIconTheme,
      actions: appBarActionsList,
      centerTitle: true,
      leading: leadingIconButton,
      title: const Text(
        "Meta Tag Tunes",
      ),
    );

    /// FloatingActionButton for picking the directory from where to fetch audio files.
    FloatingActionButton floatingActionButton = FloatingActionButton(
      backgroundColor: darkModeOn ? Colors.red : Colors.white,
      child: Icon(
        Icons.storage_rounded,
        color: darkModeOn ? Colors.white : Colors.red,
      ),

      /// TODO: Pick a directory from storage
      onPressed: () => _messengerKey.currentState?.showSnackBar(
        const SnackBar(
          content: Text(
            "FloatingActionButton",
          ),
        ),
      ),
    );

    /// MaterialApp widget is displayed on the screen.
    return MaterialApp(
      scaffoldMessengerKey: _messengerKey,
      title: 'Meta Tag Tunes',
      themeMode: darkModeOn ? ThemeMode.dark : ThemeMode.light,
      theme: lightThemeData,
      darkTheme: darkThemeData,
      home: Scaffold(
        appBar: appBar,
        floatingActionButton: floatingActionButton,
        body: const HomeScreen(),
      ),
    );
  }
}
