enum Status { pending, accepted }

class CitizenMessage {
  final int id;
  final String senderName;
  final String title;
  final Status status;
  final DateTime createdAt;

  const CitizenMessage({
    required this.id,
    required this.senderName,
    required this.title,
    required this.status,
    required this.createdAt,
  });
}