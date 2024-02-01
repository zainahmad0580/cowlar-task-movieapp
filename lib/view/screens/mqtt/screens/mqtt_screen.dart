import 'package:flutter/material.dart';

class MQTTScreen extends StatefulWidget {
  const MQTTScreen({super.key});

  @override
  State<MQTTScreen> createState() => _MQTTScreenState();
}

class _MQTTScreenState extends State<MQTTScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(children: [Text('MQTT Example')]),
    );
  }
}
