import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w8_bla2_refactoring_project/data/repositories/ride/ride_repository.dart';
import 'package:w8_bla2_refactoring_project/ui/screens/rides_selection/view_model/rides_selection_view_model.dart';
import 'package:w8_bla2_refactoring_project/ui/screens/rides_selection/widgets/rides_selection_content.dart';
import 'package:w8_bla2_refactoring_project/ui/states/ride_preferences_state.dart';

///
///  The Ride Selection screen allows user to select a ride, once ride preferences have been defined.
///  The screen also allow user to:
///   -  re-define the ride preferences
///   -  activate some filters.
///
class RidesSelectionScreen extends StatelessWidget {
  const RidesSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ridePrefState = context.read<RidePreferenceState>();
    final rideRepo = context.read<RideRepository>();

    return ChangeNotifierProvider(
      create: (_) => RidesSelectionViewModel(
        ridePreferenceState: ridePrefState,
        rideRepository: rideRepo,
      ),
      child: Consumer<RidesSelectionViewModel>(
        builder: (context, ridesSelectionViewModel, child) {
          return RidesSelectionContent(viewModel: ridesSelectionViewModel);
        },
      ),
    );
  }
}
