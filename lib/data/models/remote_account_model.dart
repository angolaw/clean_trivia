class RemoteAccountModel {
  final String token;

  RemoteAccountModel(this.token);

  factory RemoteAccountModel.fromJson(Map json) =>
      RemoteAccountModel(json['accessToken']);
}
