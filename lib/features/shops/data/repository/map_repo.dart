import 'package:_3la_ad_el_eed/features/shops/data/data_source/map_data_source.dart';
import 'package:_3la_ad_el_eed/features/shops/data/models/search_places_model.dart';
import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

abstract class MapRepo {
  Future<bool> isLocationPermissionGranted();
  Future<bool> isLocationServiceEnabled();
  Future<bool> requestLocationPermission();
  Future<bool> requestEnableLocationService();
  Future<Either<String, Position>> getCurrantLocation();
  Future<List<PredictionModel>> placeAutocomlate({required String query});
  Future<LatLng> getLatLngFromPlaceId({required String placeId});
}

class MapRepoImpl implements MapRepo {
  final MapDataSource mapDataSource;

  MapRepoImpl({required this.mapDataSource});
  @override
  Future<bool> requestLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    return permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse;
  }

  @override
  Future<bool> isLocationPermissionGranted() async {
    LocationPermission permission = await Geolocator.checkPermission();
    return permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse;
  }

  @override
  Future<bool> isLocationServiceEnabled() async {
    return await Geolocator.isLocationServiceEnabled();
  }

  @override
  Future<bool> requestEnableLocationService() async {
    Location location = Location();
    return await location.requestService();
  }

  @override
  Future<Either<String, Position>> getCurrantLocation() async {
    if (await isLocationPermissionGranted()) {
      if (await isLocationServiceEnabled()) {
        Position position = await Geolocator.getCurrentPosition();
        return Right(position);
      } else {
        await requestEnableLocationService();
        if (await isLocationServiceEnabled()) {
          Position position = await Geolocator.getCurrentPosition();
          return Right(position);
        } else {
          return Left("No Location Access");
        }
      }
    } else {
      await requestLocationPermission();
      if (await isLocationPermissionGranted()) {
        if (await isLocationServiceEnabled()) {
          Position position = await Geolocator.getCurrentPosition();
          return Right(position);
        } else {
          await requestEnableLocationService();
          if (await isLocationServiceEnabled()) {
            Position position = await Geolocator.getCurrentPosition();
            return Right(position);
          } else {
            return Left("No Location Access");
          }
        }
      } else {
        return Left("No Location Access");
      }
    }
  }

  @override
  Future<List<PredictionModel>> placeAutocomlate({
    required String query,
  }) async {
    final data = await mapDataSource.placeAutocomlate(query: query);
    var predictions = data.map((e) => PredictionModel.fromJson(e)).toList();
    return predictions;
  }

  @override
  Future<LatLng> getLatLngFromPlaceId({required String placeId}) async {
    final data = await mapDataSource.getLatLngFromPlaceId(placeId: placeId);

    final location = data['result']['geometry']['location'];
    final LatLng searchResultPosition = LatLng(
      location['lat'],
      location['lng'],
    );
    return searchResultPosition;
  }
}
