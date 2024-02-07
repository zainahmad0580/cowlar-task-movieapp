import 'package:flutter/material.dart';
import 'package:movieapp/mqtt/mqtt_client.dart';
import 'package:movieapp/provider/mqtt_provider.dart';
import 'package:movieapp/utils/styles.dart';
import 'package:movieapp/utils/utils.dart';
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
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: size.height * 0.02, horizontal: size.width * 0.03),
        child: SingleChildScrollView(
          child: Column(children: [
            const Text('MQTT', style: ThemeText.appBarBlack),
            SizedBox(height: size.height * 0.03),
            CustomTextField(
                controller: _topicController,
                keyboardType: TextInputType.name,
                hintText: 'Enter Topic',
                labelText: 'Topic'),
            SizedBox(height: size.height * 0.01),
            RoundButton(
                title: 'Connect & Subscribe',
                onPress: () {
                  if (_topicController.text.isNotEmpty) {
                    _configureAndConnect();
                  } else {
                    Utils.toastMessage(msg: 'Please enter a topic');
                  }
                }),
            SizedBox(height: size.height * 0.01),
            RoundButton(title: 'Disconnect', onPress: () => _disconnect()),
            SizedBox(height: size.height * 0.03),
            CustomTextField(
                controller: _messageController,
                keyboardType: TextInputType.name,
                hintText: 'Enter Message',
                labelText: 'Message'),
            SizedBox(height: size.height * 0.01),
            RoundButton(
                title: 'Publish Message',
                onPress: () {
                  if (_messageController.text.isNotEmpty) {
                    _publishMessage(_messageController.text.trim());
                  } else {
                    Utils.toastMessage(msg: 'Please enter a message');
                  }
                }),
            SizedBox(height: size.height * 0.01),
            Consumer<MQTTProvider>(
              builder: (context, value, child) {
                return Text('Published Messages: ${value.getHistoryText}');
              },
            )
          ]),
        ),
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
