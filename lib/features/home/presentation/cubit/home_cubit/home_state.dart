part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class DrawerState extends HomeState {
  final bool state;

  const DrawerState({required this.state});

  @override
  List<Object> get props => [state];
}

class ToggleConnectButtonState extends HomeState {
  final bool isConnected;

  const ToggleConnectButtonState({required this.isConnected});

  @override
  List<Object> get props => [isConnected];
}

class LoadingConnectButtonState extends HomeState {
  final AnimationController? animationController;

  const LoadingConnectButtonState({this.animationController});
  @override
  List<Object?> get props => [animationController];
}

class WaveAnimationConnectButtonState extends HomeState {
  final AnimationController? animationController;

  const WaveAnimationConnectButtonState({this.animationController});
  @override
  List<Object?> get props => [animationController];
}

class DrawerPageState extends HomeState {
  final int page;

  const DrawerPageState({required this.page});
  @override
  List<Object?> get props => [page];
}

class PanelSize extends HomeState {
  final double size;

  const PanelSize({required this.size});
  @override
  List<Object?> get props => [size];
}

class SpeedometerState extends HomeState {
  final bool isSpeedometer;

  const SpeedometerState({required this.isSpeedometer});

  @override
  List<Object> get props => [isSpeedometer];
}
