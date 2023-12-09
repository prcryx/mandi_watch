import 'package:mandi_watch/data/models/mandi_data.dart';

abstract class HomeState {}

class InitialHomeState extends HomeState {}

class MandiDataFetchLoadingState extends HomeState {}

class MandiDataFetchFailedState extends HomeState {}

class MandiDataFetchSuccessState extends HomeState {
  MandiData? res;
  MandiDataFetchSuccessState(this.res);
}
