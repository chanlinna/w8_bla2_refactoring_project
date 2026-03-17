import 'package:w8_bla2_refactoring_project/model/ride/locations.dart';

abstract class LocationRepository {
  List<Location> getAvailableLocations();
}