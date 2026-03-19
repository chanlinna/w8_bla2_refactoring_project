import 'package:flutter/foundation.dart';
import 'package:w8_bla2_refactoring_project/data/repositories/ride_preference/ride_preference_repository.dart';
import '../../model/ride_pref/ride_pref.dart';

class RidePreferenceState extends ChangeNotifier {
  final RidePreferenceRepository ridePrefRepository;

  RidePreferenceState({required this.ridePrefRepository});

  RidePreference? _selectedPreference;
  List<RidePreference> _preferenceHistory = [];

  RidePreference? get selectedPreference => _selectedPreference;

  List<RidePreference> get preferenceHistory => _preferenceHistory;


  void selectPreference(RidePreference preference) {
    if (preference != _selectedPreference) {
      _selectedPreference = preference;

      ridePrefRepository.addPreference(preference);
      _preferenceHistory = ridePrefRepository.getPreferenceHistory();

      notifyListeners();
    }
  }
}
