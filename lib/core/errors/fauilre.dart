class Fauilre {
  final String errorMessage;

  Fauilre({required this.errorMessage});
}

class ServerFailure extends Fauilre {
  ServerFailure({required super.errorMessage});
}
