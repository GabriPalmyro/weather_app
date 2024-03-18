import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class NetworkProvider {
  Future<Dio> getNetworkInstanceForUrl({
    required String url,
  });
}

@Injectable(as: NetworkProvider)
class NetworkProviderImlp implements NetworkProvider {
  @override
  Future<Dio> getNetworkInstanceForUrl({
    required String url,
  }) async {
    final Dio newInstance = _provideDio(url);
    return newInstance;
  }

  Dio _provideDio(String url) {
    final Dio dio = Dio(BaseOptions(baseUrl: url));
    return dio;
  }
}
