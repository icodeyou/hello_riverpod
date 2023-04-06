extension CapExtension on String {
  String get capitalize {
    if (isEmpty) {
      return this;
    }
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }

  String get capitalizeWords {
    if (isEmpty) {
      return this;
    }
    return split(' ').map((String str) => str.capitalize).join(' ');
  }
}
