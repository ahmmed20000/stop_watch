import 'dart:async';

import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:stopwatch/main.dart';

class stopwatch extends StatefulWidget {
  @override
  State<stopwatch> createState() => _stopwatchState();
}

class _stopwatchState extends State<stopwatch> {
  late Stopwatch s;
  late Timer t;
  bool start = false;
  bool stop = false;
  @override
  void initState() {
    super.initState();
    s = Stopwatch();
    t = Timer.periodic(Duration(milliseconds: 20), (timer) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "stop watch app",
          style: TextStyle(fontSize: 30, color: Colors.black),
        ),
        backgroundColor: const Color.fromARGB(255, 127, 169, 243),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                const Text(
                  "  click on the circle to",
                  style: TextStyle(fontSize: 22, color: Colors.black),
                ),
                Text(
                  " start",
                  style: TextStyle(
                      fontSize: 22,
                      color: start
                          ? const Color.fromARGB(255, 104, 236, 108)
                          : Colors.black),
                ),
                const Text(
                  " or ",
                  style: TextStyle(fontSize: 22, color: Colors.black),
                ),
                Text(
                  "stop",
                  style: TextStyle(
                      fontSize: 22,
                      color: stop
                          ? const Color.fromARGB(255, 104, 236, 108)
                          : Colors.black),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () => stopAndStart(),
              child: CircleAvatar(
                radius: 100,
                backgroundColor: const Color.fromARGB(255, 127, 169, 243),
                child: Text(
                  stopwatchMethod(),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
              onPressed: () {
                s.reset();
                s.stop();
                setState(() {
                  start = false;
                  stop = false;
                });
              },
              child: const Text("reset"),
            )
          ],
        ),
      ),
    );
  }

  void stopAndStart() {
    if (s.isRunning) {
      setState(() {
        start = false;
        stop = true;
      });
      s.stop();
    } else {
      s.start();
      setState(() {
        start = true;
        stop = false;
      });
    }
  }

  String stopwatchMethod() {
    var m = s.elapsed.inMilliseconds;
    String mili = (m % 1000).toString().padLeft(3, "0");
    String sec = ((m ~/ 1000) % 60).toString().padLeft(2, "0");
    String min = (((m ~/ 1000) ~/ 60) % 60).toString().padLeft(2, "0");
    return "$min:$sec:$mili";
  }
}
