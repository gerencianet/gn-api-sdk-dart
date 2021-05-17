import 'dart:math';

String generateTxId() {
  Random _rnd = Random();
  const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  return String.fromCharCodes(Iterable.generate(
      27, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
}
