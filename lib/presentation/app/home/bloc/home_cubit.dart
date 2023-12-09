import 'package:bloc/bloc.dart';
import '../../../../data/repositories/home_repository.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository _repo;
  HomeCubit(this._repo) : super(InitialHomeState());

  void getMandiData() async {
    try {
      emit(MandiDataFetchLoadingState());
      final res = await _repo.getMandiData();
      emit(MandiDataFetchSuccessState(res));
    } catch (e) {
      emit(MandiDataFetchFailedState());
    }
  }
}
