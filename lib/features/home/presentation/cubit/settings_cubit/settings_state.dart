part of 'settings_cubit.dart';

abstract class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object?> get props => [];
}

class SettingsInitial extends SettingsState {}

class SwitchState extends SettingsState {
  final bool state;
  final String title;

  const SwitchState({required this.title, required this.state});
  @override
  List<Object> get props => [title, state];
}
