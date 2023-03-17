extension StringTitleX on String {
  String toTitleCase() {
    final params = split(' ');

    if (params.length > 1) {
      String char = '';
      for (var word in params) {
        char += '${word[0].toUpperCase()}${word.substring(1,word.length)} ';
      }

      return char;
    }

    return this[0].toUpperCase() + substring(1,length);
  }
}
