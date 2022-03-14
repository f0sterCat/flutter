// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Privacy Policy',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black26),
        brightness: Brightness.light,
        backgroundColor: Colors.white,
      ),
      body: Markdown(data: _PRIVACY_POLICY),
    );
  }

  static const _PRIVACY_POLICY =
      """Made by FosterCat productions. This is a free app and open for editing. Made for educational purposes.

  For when you can't work with static agenda's and get lost in your unorganized notes
  
  https://github.com/f0sterCat/flutter
  
  x FosterCat""";
}
