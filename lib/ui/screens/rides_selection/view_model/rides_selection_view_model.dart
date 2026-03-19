import 'package:flutter/material.dart';
import 'package:w8_bla2_refactoring_project/data/repositories/ride/ride_repository.dart';
import 'package:w8_bla2_refactoring_project/model/ride/ride.dart';
import 'package:w8_bla2_refactoring_project/model/ride_pref/ride_pref.dart';
import 'package:w8_bla2_refactoring_project/ui/states/ride_preferences_state.dart';

class RidesSelectionViewModel extends ChangeNotifier {
  final RidePreferenceState ridePreferenceState;
  final RideRepository rideRepository;

  RidesSelectionViewModel({
    required this.ridePreferenceState,
    required this.rideRepository,
  }){
    ridePreferenceState.addListener(notifyListeners);
  }

  RidePreference? get selectedPreference =>
      ridePreferenceState.selectedPreference;
  List<RidePreference> get preferenceHistory =>
      ridePreferenceState.preferenceHistory;

  List<Ride> get matchingRides {
    if (selectedPreference == null) return [];

    return rideRepository.getRidesFor(selectedPreference!);
  }

  @override
  void dispose() {
    ridePreferenceState.removeListener(notifyListeners);
    super.dispose();
  }
}
