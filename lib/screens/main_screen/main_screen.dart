import 'package:flutter/material.dart';
import '../home_screen/home_screen.dart';
import '../music_library_screen/music_library_screen.dart';
import '../../constants/constants.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  /// A boolean field to keep track of DARK mode. By default, LIGHT mode.
  bool _darkModeOn = false;
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    /// MaterialApp widget is displayed on the screen.
    return MaterialApp(
      title: 'AUTO PLAY',
      themeMode: _darkModeOn ? ThemeMode.dark : ThemeMode.light,
      theme: lightThemeData,
      darkTheme: darkThemeData,
      home: Builder(
        builder: (BuildContext context) {
          /// An IconButton when pressed switches the application theme from light to dark and vice versa.
          IconButton themeSwitcher = IconButton(
            icon: Icon(
              _darkModeOn ? Icons.dark_mode : Icons.light_mode_rounded,
              color: Colors.tealAccent,
            ),
            onPressed: () => setState(() {
              _darkModeOn = !_darkModeOn;
              showSnackBar(context, _darkModeOn ? "Switched to dark mode" : "Switched to light mode");
            }),
          );

          /// An IconButton which opens more options pop-up dialog.
          IconButton moreIconButton = IconButton(
            icon: Icon(
              _selectedIndex == 3 ? Icons.more_vert_rounded : Icons.more_vert_outlined,
              color: _darkModeOn ? Colors.tealAccent : Colors.black,
            ),
            onPressed: () => showSnackBar(context, "Display more options"),
          );

          /// Color to use in dark mode for inactive icons.
          Color inactiveIconColor = _darkModeOn ? Colors.white : Colors.black;

          /// An IconButton to redirect to home screen.
          IconButton homeIconButton = IconButton(
            icon: Icon(
              _selectedIndex == 1 ? Icons.home_filled : Icons.home_outlined,
              color: _selectedIndex == 1 ? Colors.tealAccent : inactiveIconColor,
            ),
            onPressed: () => setState(() => _selectedIndex = 1),
          );

          /// An IconButton to redirect to music library screen.
          IconButton libraryIconButton = IconButton(
            icon: Icon(
              _selectedIndex == 2 ? Icons.my_library_music_rounded : Icons.my_library_music_outlined,
              color: _selectedIndex == 2 ? Colors.tealAccent : inactiveIconColor,
            ),
            onPressed: () => setState(() => _selectedIndex = 2),
          );

          /// List of IconButtons for Bottom Navigation Bar.
          List<IconButton> bottomNavigationItems = [
            themeSwitcher,
            homeIconButton,
            libraryIconButton,
            moreIconButton,
          ];

          /// A Container widget acting as a bottom navigation bar, which holds icon buttons to perform different actions for the app.
          Widget customBottomNavigationBar = Container(
            height: MediaQuery.of(context).size.height * 0.084,
            width: MediaQuery.of(context).size.width,
            color: Colors.transparent,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                for (var index = 0; index < bottomNavigationItems.length; index++)
                  Expanded(
                    flex: 1,
                    child: bottomNavigationItems[index],
                  ),
              ],
            ),
          );

          /// The widget that is returned on screen.
          return Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            bottomNavigationBar: customBottomNavigationBar,
            body: _selectedIndex == 1 ? const HomeScreen() : const MusicLibraryScreen(),
          );
        },
      ),
    );
  }
}
