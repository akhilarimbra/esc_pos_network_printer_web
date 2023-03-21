import 'package:http/http.dart';

Future<void> printReceiptUsingESCPOSNetworkPrinterOnWeb(
    List<int> bytes, String ipAddress, int port) async {
  String escPosNetworkPrinterUrl = 'http://$ipAddress:$port';

  Uri url = Uri.parse(escPosNetworkPrinterUrl);

  Response response = await post(
    url,
    body: bytes,
    headers: {'Content-Type': 'application/octet-stream'},
  );

  if (response.statusCode != 200) {
    throw Exception('Failed to print !');
  }
}
