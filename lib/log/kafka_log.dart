class KafkaLog {
  final String topic;
  final List<Message> messages;

  KafkaLog(this.topic) : messages = [];

  void append(Message message){
    messages.add(message);
  }

  List<Message> readFromOffset(int offset){
    return messages.sublist(offset);
  }

  void acknowledge(int offset){
    messages.removeRange(0, offset + 1 );
    print('Messages acknowledged up to offset $offset. Remaining: $messages');
  }

}


class Message {
  final String key;
  final String value;
  final DateTime timestamp;

  const Message({
    required this.key,
    required this.value,
    required this.timestamp,
  });

  @override
  String toString() {
    return '($key, $value, $timestamp}';
  }
}

void main() {
  final log = KafkaLog('user_events');

  // Simulate message production
  log.append(Message(key: 'user123',value: 'clicked_link', timestamp: DateTime.now()));
  log.append(Message(key: 'user456',value: 'added_to_cart', timestamp: DateTime.now()));
  log.append(Message(key: 'user123',value: 'purchased_item', timestamp: DateTime.now()));

  // Simulate message consumption
  final offsetToRead = 1; // Start reading from the second message
  final messagesRead = log.readFromOffset(offsetToRead);
  print('Messages read from offset $offsetToRead: $messagesRead');
}
