import 'package:w8_bla2_refactoring_project/data/dummy_data.dart';
import 'package:w8_bla2_refactoring_project/data/repositories/location/location_repository.dart';
import 'package:w8_bla2_refactoring_project/model/ride/locations.dart';

class LocationRepositoryMock implements LocationRepository{
  @override
  List<Location> getAvailableLocations() {
    return fakeLocations;
  }
}