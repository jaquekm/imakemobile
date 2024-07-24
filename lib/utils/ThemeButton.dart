import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _ThemeButton extends StatefulWidget {
  @override
  _ThemeButtonState createState() => _ThemeButtonState();
}

class _ThemeButtonState extends State<_ThemeButton> {
  bool _isDarkMode = false;

  @override
  void initState() {
    super.initState();
    _loadTheme();
  }

  _loadTheme() async {
    final preferences = await SharedPreferences.getInstance();
    setState(() {
      _isDarkMode = preferences.getBool('isDarkMode')?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        final preferences = await SharedPreferences.getInstance();
        setState(() {
          _isDarkMode = !_isDarkMode;
        });
        preferences.setBool('isDarkMode', _isDarkMode);
      },
      child: Text(_isDarkMode? 'Light Mode' : 'Dark Mode'),
    );
  }
}
