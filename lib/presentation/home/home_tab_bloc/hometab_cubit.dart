import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fliqs_app/domain/usecase/home_tab_usecase.dart';

part 'hometab_state.dart';

class HometabCubit extends Cubit<HometabState> {
  final HomeTopUseCase homeTopUseCase;
  HometabCubit({required this.homeTopUseCase}) : super(HometabInitial());
}
