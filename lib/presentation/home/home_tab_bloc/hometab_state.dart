part of 'hometab_cubit.dart';

abstract class HometabState extends Equatable {
  const HometabState();
}

class HometabInitial extends HometabState {
  @override
  List<Object> get props => [];
}

class HometabSuccess extends HometabState {
  @override
  List<Object> get props => [];
}

class HometabLoading extends HometabState {
  @override
  List<Object> get props => [];
}

class HometabFailure extends HometabState {
  @override
  List<Object> get props => [];
}
