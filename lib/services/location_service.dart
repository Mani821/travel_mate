import 'package:fpdart/fpdart.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import '../core/constants.dart';
import '../data/models/location_model.dart';

class LocationService{
  LocationService();



  /// Get the current location of the user
  Future<Either<Failure, UserLocation>> getUserLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    String userCity = '';
    String userCountry = '';
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return Either.left(Failure("Location permissions are denied"));
        }
      }
      return Either.left(Failure("Location service is not enabled"));
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Either.left( Failure("Location permissions are denied"));
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Either.left( Failure(
          "Location permissions are permanently denied, we cannot request permissions."));
    }

    var location = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
      ),
    );

    List<Placemark> placeMarks =
    await placemarkFromCoordinates(location.latitude, location.longitude);

    if (placeMarks.isNotEmpty) {
      if (placeMarks.first.locality!.isNotEmpty) {
        String? city = placeMarks.first.locality;
        String? country = placeMarks.first.country;
        userCountry = country.toString();
        userCity = city.toString();
      }
    }
    return Either.right(UserLocation(
        latitude: location.latitude,
        longitude: location.longitude,
        city: userCity,
        country: userCountry));
  }

}