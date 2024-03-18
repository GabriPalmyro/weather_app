import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';

abstract class LocatorService {
  Future<Map<String, dynamic>> getCurrentLocation();
}

@Injectable(as: LocatorService)
class LocatorServiceImpl implements LocatorService {
  @override
  Future<Map<String, dynamic>> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Verifica se os serviços de localização estão habilitados
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Os serviços de localização estão desabilitados.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Permissão de localização negada.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('As permissões de localização estão permanentemente negadas, não podemos solicitar permissões.');
    }

    // Quando temos permissão, obtemos a posição atual do dispositivo
    final position = await Geolocator.getCurrentPosition();

    return {
      'lat': position.latitude.toString(),
      'lon': position.longitude.toString(),
    };
  }
}
