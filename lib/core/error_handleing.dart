class GeneralErrors{
  String message;
  GeneralErrors({required this.message});
}
class ServerErrors extends GeneralErrors{
  ServerErrors({required super.message});

}
class ClientErrors extends GeneralErrors{
  ClientErrors({required super.message});

}
class NetworkError extends GeneralErrors{
  NetworkError({required super.message});
}