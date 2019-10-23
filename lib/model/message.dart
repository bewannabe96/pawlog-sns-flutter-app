enum MessageDirections {
  Received,
  Sent,
}

class Message {
  const Message(
    this.direction,
    this.content,
    this.from,
    this.sentDate,
    this.firstInGroup,
    this.showTime,
  );

  final MessageDirections direction;
  final String content;
  final String from;
  final DateTime sentDate;
  final bool firstInGroup;
  final bool showTime;
}
