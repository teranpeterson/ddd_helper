import 'dart:io';

import 'package:ddd_helper/screens/dice_screen.dart';
import 'package:ddd_helper/screens/pdf_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  Widget _createButton(String buttonText, void Function()? onPressed) {
    return Container(
        width: 200,
        margin: const EdgeInsets.all(6),
        child: Platform.isAndroid
            ? ElevatedButton(onPressed: onPressed, child: Text(buttonText))
            : CupertinoButton.filled(
                padding: EdgeInsets.zero,
                onPressed: onPressed,
                child: Text(buttonText),
              ));
  }

  _launchInstructions(BuildContext context) {
    final dialogContent = Row(
      children: [
        Expanded(
            flex: 1,
            child: _createButton(
                "Youtube \u2197",
                () =>
                    _launchUrl("https://www.youtube.com/watch?v=vUlsnAKvfCk"))),
        const SizedBox(
          width: 10,
        ),
        Expanded(
            flex: 1,
            child: _createButton(
                "Pdf",
                () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const PdfScreen())))),
      ],
    );
    showDialog(
        context: context,
        builder: (_) => Platform.isAndroid
            ? AlertDialog(
                content: dialogContent,
              )
            : CupertinoAlertDialog(content: dialogContent));
  }

  Future<void> _launchUrl(String url) async {
    final _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Dungeons, Dice and Danger"),
              _createButton(
                  "Roll Dice",
                  () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const DiceScreen()))),
              _createButton("Instructions", () => _launchInstructions(context)),
              _createButton(
                  "Purchase \u2197",
                  () => _launchUrl(
                      "https://www.amazon.com/Ravensburger-Dungeons-Dice-Danger-Strategy/dp/B09G9NCTJ9")),
            ]),
      ),
    );
  }
}
