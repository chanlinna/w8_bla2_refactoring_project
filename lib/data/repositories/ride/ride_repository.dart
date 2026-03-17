import 'package:w8_bla2_refactoring_project/model/ride/ride.dart';
import 'package:w8_bla2_refactoring_project/model/ride_pref/ride_pref.dart';

abstract class RideRepository {
  List<Ride> getAllRides();

  List<Ride> getRidesFor(RidePreference preferences);
}
