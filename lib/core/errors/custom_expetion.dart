class CustomExpetion implements Exception {
  final String errorMessage;

  CustomExpetion({required this.errorMessage});
  @override
  String toString() {
    return errorMessage;
  }
}
