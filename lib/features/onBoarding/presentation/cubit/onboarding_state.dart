part of 'onboarding_cubit.dart';

abstract class OnboardingState extends Equatable {
  const OnboardingState();

  @override
  List<Object> get props => [];
}

class OnboardingInitial extends OnboardingState {}

class OnboardingPageViewState extends OnboardingState {
  final int currentPage;

  const OnboardingPageViewState({required this.currentPage});

  @override
  List<Object> get props => [currentPage];
}
