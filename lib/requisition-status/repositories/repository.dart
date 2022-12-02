import '../../core/httpClient/http_client.dart';

class RepositoryStatusCode {
  HttpDio httpCliente;
  RepositoryStatusCode(this.httpCliente);

  Future getdata() async {
    try {
      var result = await httpCliente.getStatusCode();
      return result.toString();
    } catch (e) {
      print('$e');
      return 'Sem Conexão!';
    }
  }
}
