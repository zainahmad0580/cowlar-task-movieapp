import 'package:flutter_test/flutter_test.dart';
import 'package:movieapp/provider/mqtt_provider.dart';

import 'package:movieapp/utils/constants.dart';

void main() {
  group('MQTTProvider', () {
    test('setReceivedText updates receivedText and historyText', () {
      // Arrange
      final provider = MQTTProvider();
      const newText = 'New received text';

      // Act
      provider.setReceivedText(newText);

      // Assert
      expect(provider.getReceivedText, newText);
      expect(provider.getHistoryText, '\n$newText');
    });

    test('clearHistory clears receivedText and historyText', () {
      // Arrange
      final provider = MQTTProvider();
      provider.setReceivedText('Some received text');

      // Act
      provider.clearHistory();

      // Assert
      expect(provider.getReceivedText, '');
      expect(provider.getHistoryText, '');
    });

    test('setAppConnectionState updates appConnectionState', () {
      // Arrange
      final provider = MQTTProvider();
      const newState = MQTTAppConnectionState.connected;

      // Act
      provider.setAppConnectionState(newState);

      // Assert
      expect(provider.getAppConnectionState, newState);
    });
  });
}
