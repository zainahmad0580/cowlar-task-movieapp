import 'package:flutter/material.dart';
import 'package:movieapp/mqtt/mqtt_client.dart';
import 'package:movieapp/provider/mqtt_provider.dart';
import 'package:movieapp/view/widgets/custom_text_field.dart';
import 'package:movieapp/view/widgets/round_button.dart';
import 'package:provider/provider.dart';

class MQTTScreen extends StatefulWidget {
  const MQTTScreen({super.key});

  @override
  State<MQTTScreen> createState() => _MQTTScreenState();
}

class _MQTTScreenState extends State<MQTTScreen> {
  final TextEditingController _topicController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  late MQTTProvider currentAppState;
  late MQTT client;

  @override
  void dispose() {
    _topicController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final MQTTProvider appState = Provider.of<MQTTProvider>(context);
    // Keep a listening to the app state.
    currentAppState = appState;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          const Text('MQTT Example'),
          SizedBox(height: size.height * 0.01),
          Row(
            children: [
              Expanded(
                child: RoundButton(
                    title: 'Connect to Broker',
                    onPress: () => _configureAndConnect()),
              ),
              Expanded(
                child: RoundButton(
                    title: 'Disconnect', onPress: () => _disconnect()),
              ),
            ],
          ),
          SizedBox(height: size.height * 0.01),
          CustomTextField(
              controller: _topicController,
              keyboardType: TextInputType.name,
              hintText: 'Enter Topic',
              labelText: 'Topic'),
          RoundButton(title: 'Subscribe to Topic', onPress: () {}),
          SizedBox(height: size.height * 0.01),
          CustomTextField(
              controller: _messageController,
              keyboardType: TextInputType.name,
              hintText: 'Enter Message',
              labelText: 'Message'),
          SizedBox(height: size.height * 0.01),
          RoundButton(
              title: 'Publish Message',
              onPress: () => _publishMessage(_messageController.text.trim())),
          SizedBox(height: size.height * 0.01),
          const Text('Published Message: '),
        ]),
      ),
    );
  }

  void _configureAndConnect() {
    client = MQTT(topic: _topicController.text, state: currentAppState);
    client.initializeMQTTClient();
    client.connect();
  }

  void _disconnect() {
    client.disconnect();
  }

  void _publishMessage(String text) {
    final String message = 'Zain says: $text';
    client.publish(message);
    _messageController.clear();
  }
}
