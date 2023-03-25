import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_fliqs/domain/usecase/home_top_chips_usecase.dart';

part 'chips_state.dart';

class ChipsCubit extends Cubit<ChipsState> {
  final HomeChipsUseCase homeChipsUseCase;
  ChipsCubit({required this.homeChipsUseCase}) : super(ChipsInitial());
  getHomeChips() {
    ChipsLoading();
    try {
      ChipsSuccess();
    } catch (e) {
      ChipsFailuire();
    }
  }
}
