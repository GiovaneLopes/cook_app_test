class CookDurationConverter {
  static String cookDurationInHours(int cookDuration) {
    if (cookDuration < 60) {
      return '${cookDuration}min';
    }
    final minutes = cookDuration % 60;
    return '${cookDuration ~/ 60}h ${minutes > 0 ? '${minutes}min' : ''}';
  }
}
