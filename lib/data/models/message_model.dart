class Message {
  final String text;
  final String? imageUrl;
  final bool fromUser;

  Message({required this.text, this.imageUrl, required this.fromUser});
}