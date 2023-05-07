import 'dart:developer';

import 'package:flutter/material.dart';

class StatefulScreen extends StatefulWidget {
  const StatefulScreen({super.key});

  @override
  State<StatefulScreen> createState() => _StatefulScreenState();
}

class _StatefulScreenState extends State<StatefulScreen> {
  var counter = 1;

  add() {
    setState(() {
      counter++;
    });
  }

  min() {
    setState(() {
      counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    log("build");

    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            ElevatedButton(
                onPressed: () {
                  min();
                },
                child: const Text("-")),
            const SizedBox(
              width: 24,
            ),
            Text("$counter"),
            const SizedBox(
              width: 24,
            ),
            ElevatedButton(
                onPressed: () {
                  add();
                },
                child: const Text("+"))
          ],
        ),
      ),
    );
  }
}
