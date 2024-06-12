/// Extensions on String for capital letters
extension CapExtension on String {
  /// Capitalize a sentence or a word
  String get capitalize {
    if (isEmpty) {
      return this;
    }
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }

  /// Capitalize all words in a sentence
  String get capitalizeWords {
    if (isEmpty) {
      return this;
    }
    return split(' ').map((str) => str.capitalize).join(' ');
  }
}
