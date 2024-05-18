class NetworkResponse {
  final int statusCode;
  final String body;
  final Map<String, dynamic> header;

  NetworkResponse({
    required this.statusCode,
    required this.body,
    required this.header,
  });
}
