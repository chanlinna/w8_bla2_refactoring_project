import 'package:provider/provider.dart';
import 'package:nested/nested.dart';
import 'package:w8_bla2_refactoring_project/data/repositories/location/location_repository.dart';
import 'package:w8_bla2_refactoring_project/data/repositories/location/location_repository_mock.dart';
import 'package:w8_bla2_refactoring_project/data/repositories/ride/ride_repository.dart';
import 'package:w8_bla2_refactoring_project/data/repositories/ride/ride_repository_mock.dart';
import 'package:w8_bla2_refactoring_project/data/repositories/ride_preference/ride_preference_repository.dart';
import 'package:w8_bla2_refactoring_project/data/repositories/ride_preference/ride_preference_repository_mock.dart';
import 'main_common.dart';

List<SingleChildWidget> get devProviders {
  final locationRepo = LocationRepositoryMock();
  final rideRepo = RideRepositoryMock();
  final ridePrefRepo = RidePreferenceRepositoryMock();

  return [
    Provider<LocationRepository>(create: (_) => locationRepo),
    Provider<RideRepository>(create: (_) => rideRepo),
    Provider<RidePreferenceRepository>(create: (_) => ridePrefRepo),
  ];
}

void main() {
  mainCommon(devProviders);
}
