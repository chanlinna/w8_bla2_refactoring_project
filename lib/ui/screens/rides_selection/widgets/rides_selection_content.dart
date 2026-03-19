import 'package:flutter/material.dart';
import 'package:w8_bla2_refactoring_project/model/ride/ride.dart';
import 'package:w8_bla2_refactoring_project/model/ride_pref/ride_pref.dart';
import 'package:w8_bla2_refactoring_project/ui/screens/rides_selection/view_model/rides_selection_view_model.dart';
import 'package:w8_bla2_refactoring_project/ui/screens/rides_selection/widgets/ride_preference_modal.dart';
import 'package:w8_bla2_refactoring_project/ui/screens/rides_selection/widgets/rides_selection_header.dart';
import 'package:w8_bla2_refactoring_project/ui/screens/rides_selection/widgets/rides_selection_tile.dart';
import 'package:w8_bla2_refactoring_project/ui/theme/theme.dart';
import 'package:w8_bla2_refactoring_project/utils/animations_util.dart';

class RidesSelectionContent extends StatelessWidget {
  final RidesSelectionViewModel viewModel;

  const RidesSelectionContent({super.key, required this.viewModel});

  void onBackTap(BuildContext context) {
    Navigator.pop(context);
  }

  void onFilterPressed() {
    // TODO
  }

  void onRideSelected(Ride ride) {
    // TODO
  }

  void onPreferencePressed(BuildContext context) async {
    final newPreference = await Navigator.of(context).push<RidePreference>(
      AnimationUtils.createRightToLeftRoute(
        RidePreferenceModal(initialPreference: viewModel.selectedPreference!),
      ),
    );

    if (newPreference != null) {
      viewModel.ridePreferenceState.selectPreference(newPreference);
    }
  }

  @override
  Widget build(BuildContext context) {
    final rides = viewModel.matchingRides;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: BlaSpacings.m,
          right: BlaSpacings.m,
          top: BlaSpacings.s,
        ),
        child: Column(
          children: [
            RideSelectionHeader(
              ridePreference: viewModel.selectedPreference!,
              onBackPressed: () => onBackTap(context),
              onFilterPressed: onFilterPressed,
              onPreferencePressed: () => onPreferencePressed(context),
            ),

            const SizedBox(height: 100),

            Expanded(
              child: ListView.builder(
                itemCount: rides.length,
                itemBuilder: (ctx, index) => RideSelectionTile(
                  ride: rides[index],
                  onPressed: () => onRideSelected(rides[index]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
