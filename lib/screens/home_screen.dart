import 'package:flutter/material.dart';
import 'package:hng_stage_one/screens/web_view_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarWidget(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset("assets/user.jpeg", height: 80, width: 80),
            ),
            const SizedBox(height: 20),
            buildRwoWidget("Username", "Kod_Enigma"),
            buildRwoWidget("FullName", "Olamilekan Adeleke"),
            buildRwoWidget("About", "I am a flutter mobile developer"),
            const Spacer(),
            Center( 
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const WebviewScreen(),
                  ));
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(300, 50),
                ),
                child: const Text("Open Github"),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget buildRwoWidget(String title, String valve) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
        ),
        Text(valve, style: const TextStyle(fontSize: 14)),
        const SizedBox(height: 10),
      ],
    );
  }

  AppBar buildAppBarWidget() {
    return AppBar(
      title: const Text(
        "Kod Enigma",
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }
}
