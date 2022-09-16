import 'package:flutter/material.dart';
import '../../constants/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    /// A boolean to check for Brightness passed from context is LIGHT.
    bool lightModeOn = Theme.of(context).brightness != Brightness.dark;

    /// An AppBar which displays the title of the app.
    AppBar appBar = AppBar(
      toolbarHeight: MediaQuery.of(context).size.height * 0.08,
      elevation: Theme.of(context).appBarTheme.elevation,
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      centerTitle: true,
      title: const Text("auto play"),
      titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
    );

    /// FloatingActionButton for picking the directory from where to fetch audio files.
    FloatingActionButton floatingActionButton = FloatingActionButton(
      backgroundColor: lightModeOn ? Colors.white : Colors.teal,
      shape: const CircleBorder(),
      child: Icon(
        Icons.storage_rounded,
        color: lightModeOn ? Colors.tealAccent : Colors.white,
      ),
      /// TODO: Pick a directory from storage
      onPressed: () => showSnackBar(context, "Pick/Choose folder to fetch audio files from."),
    );

    /// Widget returned by the HomeScreen class on screen.
    return Scaffold(
      appBar: appBar,
      floatingActionButton: floatingActionButton,
      body: const Center(
        child: Text("Select a directory to pick songs. \n Click on the button below 🔻"),
      ),
    );
  }
}
