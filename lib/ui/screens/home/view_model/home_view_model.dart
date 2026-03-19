import 'package:flutter/material.dart';
import 'package:w8_bla2_refactoring_project/model/ride_pref/ride_pref.dart';
import 'package:w8_bla2_refactoring_project/ui/states/ride_preferences_state.dart';

class HomeViewModel extends ChangeNotifier {
  final RidePreferenceState ridePreferenceState;

  HomeViewModel({required this.ridePreferenceState}) {
    ridePreferenceState.addListener(notifyListeners);
  }

  RidePreference? get selectedPreference =>
      ridePreferenceState.selectedPreference;
  List<RidePreference> get preferenceHistory =>
      ridePreferenceState.preferenceHistory;

  void selectPreference(RidePreference preference) {
    ridePreferenceState.selectPreference(preference);
  }

  @override
  void dispose() {
    super.dispose();
    ridePreferenceState.removeListener(notifyListeners);
    super.dispose();
  }
}
