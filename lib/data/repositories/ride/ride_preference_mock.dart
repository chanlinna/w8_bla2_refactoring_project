import 'package:w8_bla2_refactoring_project/data/dummy_data.dart';
import 'package:w8_bla2_refactoring_project/data/repositories/ride/ride_repository.dart';
import 'package:w8_bla2_refactoring_project/model/ride/ride.dart';
import 'package:w8_bla2_refactoring_project/model/ride_pref/ride_pref.dart';

class RidePreferenceMock implements RideRepository {
  final List<Ride> _rides = fakeRides;

  @override
  List<Ride> getAllRides() {
    return _rides;
  }

  @override
  List<Ride> getRidesFor(RidePreference preferences){
    return _rides
        .where(
          (ride) =>
              ride.departureLocation == preferences.departure &&
              ride.arrivalLocation == preferences.arrival &&
              ride.availableSeats >= preferences.requestedSeats,
        )
        .toList();
  }
}
