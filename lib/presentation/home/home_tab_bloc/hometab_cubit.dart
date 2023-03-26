import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fliqs_app/data/models/home_tabs.dart';
import 'package:fliqs_app/domain/usecase/home_tab_usecase.dart';

part 'hometab_state.dart';

class HometabCubit extends Cubit<HometabState> {
  final HomeTopUseCase homeTopUseCase;
  HometabCubit({required this.homeTopUseCase}) : super(HometabInitial());

  getHomeTabs() async {
    emit(HometabLoading());
    try {
      HomeTab data = await homeTopUseCase.call();
      emit(HometabSuccess(homtab: data));
    } catch (exception) {
      emit(HometabFailure(errMsg: "Something went to wrong"));
    }
  }
}
