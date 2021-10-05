import 'dart:io';
import 'package:faker/faker.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class RemoteAuthentication {
  Future<void> auth() async {}
}

void main() {
  test('Should call HttpClient with correct url', () async {
    final httpClient = HttpClient();
    final url = faker.internet.httpUrl();
    final sut = RemoteAuthentication(httpClient: httpClient, url: url);
    await sut.auth();
    verify(httpClient.request(url: url));
  });
}
