import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w8_bla2_refactoring_project/ui/screens/home/view_model/home_view_model.dart';
import 'package:w8_bla2_refactoring_project/ui/screens/home/widgets/home_content.dart';
import 'package:w8_bla2_refactoring_project/ui/states/ride_preferences_state.dart';

///
/// This screen allows user to:
/// - Enter his/her ride preference and launch a search on it
/// - Or select a last entered ride preferences and launch a search on it
///
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ridePrefState = context.watch<RidePreferenceState>();

    return ChangeNotifierProvider(
      create: (_) => HomeViewModel(ridePreferenceState: ridePrefState),
      child: Consumer<HomeViewModel>(
        builder: (context, homeViewModel, child) {
          return HomeContent(homeViewModel: homeViewModel);
        },
      ),
    );
  }
}
