import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:clean_trivia/domain/usecases/usecases.dart';
import 'package:clean_trivia/data/usecases/usecases.dart';
import 'package:clean_trivia/data/http/http.dart';

class HttpClientSpy extends Mock implements HttpClient {}

void main() {
  HttpClientSpy httpClient;
  String url;
  RemoteAuthentication sut;
  setUp(() {
    httpClient = HttpClientSpy();
    url = faker.internet.httpUrl();
    sut = RemoteAuthentication(httpClient: httpClient, url: url);
  });
  test('Should call HttpClient with correct url', () async {
    final params = AuthenticationParams(
      email: faker.internet.email(),
      secret: faker.internet.password(),
    );
    when(httpClient.request(url: url, method: 'post'))
        .thenAnswer((_) async => null);
    await sut.auth(params);
    verify(httpClient.request(url: url, method: 'post', body: {
      'email': params.email,
      'password': params.secret,
    }));
  });
  test('Should call HttpClient with correct url and empty body', () async {
    final params = AuthenticationParams(
      email: faker.internet.email(),
      secret: faker.internet.password(),
    );
    when(httpClient.request(url: url, method: 'post'))
        .thenAnswer((_) async => null);
    await sut.auth(params);
    verify(httpClient.request(url: url, method: 'post', body: {}));
  });
}
