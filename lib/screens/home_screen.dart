import 'package:flutter/material.dart';

import '../shared/adaptive_text_size.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarWidget(context),
    );
  }

  AppBar buildAppBarWidget(BuildContext context) {
    return AppBar(
      title: Text(
        "Kod Enigma",
        style: TextStyle(
          fontSize: AdaptiveTextSize.adaptiveTextSize(context, 16),
          color: Colors.grey.shade600,
        ),
      ),
    );
  }
}
