import 'package:flutter/material.dart';
import 'package:movieapp/mqtt/mqtt_client.dart';
import 'package:movieapp/provider/mqtt_provider.dart';
import 'package:movieapp/utils/app_colors.dart';
import 'package:movieapp/utils/constants.dart';
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

  MQTT? client;

  @override
  void dispose() {
    _topicController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: size.height * 0.02, horizontal: size.width * 0.03),
        child: SingleChildScrollView(
          child:
              Consumer<MQTTProvider>(builder: (context, mqttProvider, child) {
            return Column(children: [
              const Text('MQTT', style: ThemeText.appBarBlack),
              SizedBox(height: size.height * 0.03),
              CustomTextField(
                  controller: _topicController,
                  keyboardType: TextInputType.name,
                  hintText: 'Enter Topic',
                  labelText: 'Topic'),
              SizedBox(height: size.height * 0.01),
              RoundButton(
                  btnColor: mqttProvider.getAppConnectionState ==
                          MQTTAppConnectionState.connected
                      ? AppColors.greyText
                      : AppColors.btn,
                  title: 'Connect & Subscribe',
                  onPress: () async {
                    if (mqttProvider.getAppConnectionState ==
                        MQTTAppConnectionState.disconnected) {
                      Utils.showLoader(context);
                      if (await Utils.isConnected()) {
                        if (_topicController.text.isNotEmpty) {
                          client = MQTT(
                              topic: _topicController.text,
                              state: mqttProvider);
                          client!.initializeMQTTClient();
                          client!.connect();
                          _topicController.clear();
                        } else {
                          Utils.toastMessage(msg: 'Please enter a topic');
                        }
                      }
                      Utils.hideLoader(context);
                    } else {
                      Utils.toastMessage(msg: 'You need to disconnect first');
                    }
                  }),
              SizedBox(height: size.height * 0.01),
              RoundButton(
                  btnColor: mqttProvider.getAppConnectionState ==
                          MQTTAppConnectionState.connected
                      ? AppColors.btn
                      : AppColors.greyText,
                  title: 'Disconnect',
                  onPress: () {
                    if (mqttProvider.getAppConnectionState ==
                        MQTTAppConnectionState.connected) {
                      Utils.showLoader(context);
                      client == null
                          ? Utils.toastMessage(msg: 'Please connect first')
                          : client!.disconnect();
                      mqttProvider.clearHistory();
                      Utils.hideLoader(context);
                    } else {
                      Utils.toastMessage(msg: 'Please connect first');
                    }
                  }),
              SizedBox(height: size.height * 0.03),
              CustomTextField(
                  controller: _messageController,
                  keyboardType: TextInputType.name,
                  hintText: 'Enter Message',
                  labelText: 'Message'),
              SizedBox(height: size.height * 0.01),
              RoundButton(
                  btnColor: mqttProvider.getAppConnectionState ==
                          MQTTAppConnectionState.connected
                      ? AppColors.btn
                      : AppColors.greyText,
                  title: 'Publish Message',
                  onPress: () async {
                    if (mqttProvider.getAppConnectionState ==
                        MQTTAppConnectionState.connected) {
                      Utils.showLoader(context);
                      if (await Utils.isConnected()) {
                        if (_messageController.text.isNotEmpty) {
                          final String message =
                              'Zain says: ${_messageController.text.trim()}';
                          client!.publish(message);
                          _messageController.clear();
                        } else {
                          Utils.toastMessage(msg: 'Please enter a message');
                        }
                      }
                      Utils.hideLoader(context);
                    } else {
                      Utils.toastMessage(msg: 'Please connect first');
                    }
                  }),
              SizedBox(height: size.height * 0.01),
              Consumer<MQTTProvider>(
                builder: (context, value, child) {
                  return Text('Published Messages: ${value.getHistoryText}');
                },
              )
            ]);
          }),
        ),
      ),
    );
  }
}
