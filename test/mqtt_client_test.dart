import 'package:flutter_test/flutter_test.dart';
import 'package:movieapp/mqtt/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:movieapp/provider/mqtt_provider.dart';
import 'package:movieapp/utils/constants.dart';

class MockMQTTProvider extends MQTTProvider {
  MQTTAppConnectionState _appConnectionState =
      MQTTAppConnectionState.disconnected;
  String _receivedText = '';
  String _historyText = '';

  @override
  String get getReceivedText => _receivedText;

  @override
  String get getHistoryText => _historyText;

  @override
  MQTTAppConnectionState get getAppConnectionState => _appConnectionState;

  @override
  void setReceivedText(String text) {
    _receivedText = text;
    _historyText = '$_historyText\n$_receivedText';
  }

  @override
  void clearHistory() {
    _receivedText = '';
    _historyText = '';
  }

  @override
  void setAppConnectionState(MQTTAppConnectionState state) {
    _appConnectionState = state;
  }
}

class MockMqttServerClient extends MqttServerClient {
  MockMqttServerClient() : super('mock', 'mock');
}

void main() {
  group('MQTT', () {
    late MQTT mqtt;
    late MockMQTTProvider mockProvider;
    late MockMqttServerClient mockClient;

    setUp(() {
      mockProvider = MockMQTTProvider();
      mockClient = MockMqttServerClient();
      mqtt = MQTT(topic: 'test', state: mockProvider);
      mqtt.setClient(mockClient);
    });

    test('initializeMQTTClient initializes client correctly', () {
      mqtt.initializeMQTTClient();
      expect(mqtt.client!.server, 'test.mosquitto.org');
      expect(mqtt.client!.clientIdentifier, 'Zain');
      expect(mqtt.client!.port, 1883);
      expect(mqtt.client!.keepAlivePeriod, 20);
      expect(mqtt.client!.secure, false);
      expect(mqtt.client!.connectionMessage, isNotNull);
    });

    test('connect sets app connection state to connecting', () async {
      await mqtt.connect();
      expect(mockProvider.getAppConnectionState,
          MQTTAppConnectionState.connecting);
    });

    test('onConnected sets app connection state to connected and subscribes',
        () {
      mqtt.onConnected();
      expect(
          mockProvider.getAppConnectionState, MQTTAppConnectionState.connected);
    });

    test('onSubscribed notifies successful subscription', () {
      mqtt.onSubscribed('test');
    });

    test('onDisconnected sets app connection state to disconnected', () {
      mqtt.onDisconnected();
      expect(mockProvider.getAppConnectionState,
          MQTTAppConnectionState.disconnected);
    });
  });
}
