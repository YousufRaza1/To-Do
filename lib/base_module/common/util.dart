
import 'dart:math';


String generateId() {
  final random = Random();
  final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
  final randomNumber = random.nextInt(1 << 32).toRadixString(16);
  return '$timestamp-$randomNumber';
}