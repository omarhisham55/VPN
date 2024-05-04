import 'dart:async';
import 'dart:math';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:vpn_demo/core/constants/dialogs.dart';
import 'package:vpn_demo/core/constants/navigation_constants.dart';
import 'package:vpn_demo/core/constants/snack_bars.dart';
import 'package:vpn_demo/core/utils/strings.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of<HomeCubit>(context);

  AdvancedDrawerController drawerController = AdvancedDrawerController();
  final PanelController customPanelController = PanelController();
  AnimationController? growingCircularContainerController;
  Animation<double>? growingCircularContainerControllerAnimation;
  List<AnimationController> waveAnimationControllers = [];
  List<Animation<double>> waveAnimations = [];
  List<double> waveCircleSizes = [];
  bool isConnected = false;
  bool isDrawerOpen = false;
  int drawerSelectedPage = 0;
  double panelHeight = 500;

  void changeDrawerPage(int index) {
    drawerSelectedPage = index;
    drawerController.hideDrawer();
    emit(DrawerPageState(page: drawerSelectedPage));
  }

  void openPanel(double panelSize) {
    if (customPanelController.isAttached) {
      panelHeight = panelSize;
      customPanelController.isPanelOpen
          ? customPanelController.close()
          : customPanelController.open();
    }
  }

  void drawerCheck() {
    drawerController.addListener(() {
      isDrawerOpen = drawerController.value.visible;
      if (isDrawerOpen) {
        customPanelController.close();
      }
      emit(DrawerState(state: isDrawerOpen));
    });
  }

  void toggleConnectButton(
      BuildContext context, TickerProvider ticker, bool mounted) {
    if (!isConnected) {
      startLoading(ticker, mounted);
      isConnected = true;
    } else {
      AppDialogs.disconnectDialog(context, () {
        stopWaveAnimation();
        growingCircularContainerController = null;
        growingCircularContainerControllerAnimation = null;
        isConnected = false;
        AppSnackBars.showSnackBar(context, MainStrings.disconnectSuccessful,
            AnimatedSnackBarType.success);
        AppNavigation.pop(context);
        emit(ToggleConnectButtonState(isConnected: isConnected));
      });
    }
    emit(ToggleConnectButtonState(isConnected: isConnected));
  }

  void startLoading(TickerProvider ticker, bool mounted) {
    growingCircularContainerController = AnimationController(
      vsync: ticker,
      duration: const Duration(seconds: 5),
    );
    growingCircularContainerControllerAnimation = Tween(begin: 0.0, end: 2 * pi)
        .animate(growingCircularContainerController!)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          growingCircularContainerController = null;
          growingCircularContainerControllerAnimation = null;
          startWaveAnimation(ticker, mounted);
          emit(
            LoadingConnectButtonState(
              animationController: growingCircularContainerController,
            ),
          );
        }
      });
    growingCircularContainerController!.forward();
  }

  void startWaveAnimation(TickerProvider ticker, bool mounted) {
    void animateCircle(int index) {
      if (mounted) {
        late final AnimationController animationController;
        animationController = AnimationController(
          vsync: ticker,
          duration: const Duration(milliseconds: 3000),
        )..addStatusListener((status) {
            if (!isConnected) {
              waveCircleSizes[index] = 0;

              animationController.stop();
              emit(WaveAnimationConnectButtonState(
                  animationController: animationController));
            }
            if (status == AnimationStatus.completed) {
              if (index == 5) {
                Future.delayed(const Duration(seconds: 1), () {
                  waveCircleSizes[index] = 0;
                  emit(WaveAnimationConnectButtonState(
                      animationController: animationController));
                });
              } else {
                animationController.repeat();
              }
            }
          });

        late final Animation<double> animation;
        animation = Tween<double>(begin: 0, end: 1).animate(animationController)
          ..addListener(() {
            waveCircleSizes[index] = animation.value;
            emit(WaveAnimationConnectButtonState(
                animationController: animationController));
          });

        waveAnimationControllers.add(animationController);
        waveAnimations.add(animation);

        animationController.forward();
      }
    }

    for (int i = 0; i < 5; i++) {
      Timer(Duration(milliseconds: 600 * i), () {
        waveCircleSizes.add(0);
        animateCircle(i);
      });
    }
  }

  void stopWaveAnimation() {
    for (var controller in waveAnimationControllers) {
      controller.stop();
      controller.removeStatusListener((status) {});
    }
  }

  //Speed test
  bool isSpeedometer = true;

  void toggleSpeedTest() {
    isSpeedometer = !isSpeedometer;
    emit(SpeedometerState(isSpeedometer: isSpeedometer));
  }

  //history
  final TextEditingController searchHistoryController = TextEditingController();
}
