import 'package:w8_bla2_refactoring_project/data/repositories/ride_preference/ride_preference_repository.dart';
import 'package:w8_bla2_refactoring_project/model/ride_pref/ride_pref.dart';

class RidePreferenceRepositoryMock implements RidePreferenceRepository {
  final List<RidePreference> _preferenceHistory = [];

  @override
  List<RidePreference> getPreferenceHistory() {
    return _preferenceHistory;
  }

  @override
  void addPreference(RidePreference preference) {
    _preferenceHistory.add(preference);
  }
}
