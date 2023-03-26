part of 'hometab_cubit.dart';

abstract class HometabState extends Equatable {
  const HometabState();
}

class HometabInitial extends HometabState {
  @override
  List<Object> get props => [];
}

class HometabSuccess extends HometabState {
  final HomeTab homtab;
  HometabSuccess({required this.homtab});
  @override
  List<Object> get props => [homtab];
}

class HometabLoading extends HometabState {
  @override
  List<Object> get props => [];
}

class HometabFailure extends HometabState {
  final String errMsg;
  @override
  HometabFailure({required this.errMsg});
  List<Object> get props => [errMsg];
}
