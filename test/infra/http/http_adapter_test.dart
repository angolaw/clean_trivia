import 'package:faker/faker.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:meta/meta.dart';

class ClientSpy extends Mock implements Client {}

class HttpAdapter {
  final Client client;

  HttpAdapter(this.client);
  Future<void> request({
    @required String url,
    @required String method,
  }) async {
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    };
    await client.post(url, headers: headers);
  }
}

void main() {
  ClientSpy client;
  HttpAdapter sut;
  String url;
  setUp(() {
    client = ClientSpy();
    sut = HttpAdapter(client);
    url = faker.internet.httpUrl();
  });
  group('POST', () {
    test('should call POST with correct values', () async {
      await sut.request(
        url: url,
        method: 'post',
      );
      verify(client.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
      ));
    });
  });
}
