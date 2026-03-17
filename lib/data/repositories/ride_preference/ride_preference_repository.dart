import 'package:w8_bla2_refactoring_project/model/ride_pref/ride_pref.dart';

abstract class RidePreferenceRepository {
  List<RidePreference> getPreferenceHistory();
  void addPreference(RidePreference preference);
}
