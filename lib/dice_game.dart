import 'dart:math';

import 'package:flutter/material.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  int clientFirstIndex = 1;
  int clientSecondIndex = 1;
  int clientSum = 0;

  void clientAction() {
    clientFirstIndex = rundom.nextInt(6) + 1;
    clientSecondIndex = rundom.nextInt(6) + 1;
    clientSum = clientSum + clientFirstIndex + clientSecondIndex;
    setState(() {});
    result();
    if (clientSum < 50) {
      manageAppAction();
    } else {}
  }

  int appFirstIndex = 1;
  int appSecondIndex = 1;
  int appSum = 0;

  void manageAppAction() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(content: CircularProgressIndicator());
      },
    );

    Future.delayed(const Duration(seconds: 1)).whenComplete(
      () {
        Navigator.pop(context);
        appAction();
      },
    );
  }

  void appAction() {
    appFirstIndex = rundom.nextInt(6) + 1;
    appSecondIndex = rundom.nextInt(6) + 1;
    appSum = appSum + appFirstIndex + appSecondIndex;
    setState(() {});
    result();
  }

  Random rundom = Random();

  void result() {
    if (clientSum >= 50) {
      showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: const Text('победа у нас!Ураааа! '),
            actions: [
              TextButton(
                onPressed: resetAll,
                child: const Text('Ok'),
              )
            ],
          );
        },
      );
    } else if (appSum >= 50) {
      showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: const Text('ой мы проиграли как жаль.... '),
            actions: [
              TextButton(
                onPressed: resetAll,
                child: const Text('Ok'),
              )
            ],
          );
        },
      );
    }
  }

  void resetAll() {
    clientFirstIndex = 1;
    clientSecondIndex = 1;
    clientSum = 0;

    appFirstIndex = 1;
    appSecondIndex = 1;
    appSum = 0;
    Navigator.pop(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'You $clientSum',
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              const SizedBox(width: 20),
              Expanded(
                child: InkWell(
                  onTap: clientAction,
                  child: Image.asset('assets/icons/dice$clientFirstIndex.png'),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: InkWell(
                  onTap: clientAction,
                  child: Image.asset('assets/icons/dice$clientSecondIndex.png'),
                ),
              ),
              const SizedBox(width: 20),
            ],
          ),
          Row(
            children: [
              const SizedBox(width: 20),
              Expanded(
                child: Image.asset('assets/icons/dice$appFirstIndex.png'),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Image.asset('assets/icons/dice$appSecondIndex.png'),
              ),
              const SizedBox(width: 20),
            ],
          ),
          Text(
            'App $appSum',
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
