import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vpn_demo/core/utils/colors.dart';
import 'package:vpn_demo/core/utils/images.dart';
import 'package:vpn_demo/features/home/presentation/cubit/home_cubit.dart';
import 'package:vpn_demo/features/home/presentation/widgets/homeWidgets/connectionButtonWidgets/bg_circle.dart';
import 'package:vpn_demo/features/home/presentation/widgets/homeWidgets/connectionButtonWidgets/bottom_info.dart';
import 'package:vpn_demo/features/home/presentation/widgets/homeWidgets/connectionButtonWidgets/growing_loading_circle_indicator.dart';
import 'package:vpn_demo/features/home/presentation/widgets/homeWidgets/connectionButtonWidgets/wave_painter.dart';

class ConnectionButton extends StatefulWidget {
  const ConnectionButton({super.key});

  @override
  State<ConnectionButton> createState() => _ConnectionButtonState();
}

class _ConnectionButtonState extends State<ConnectionButton>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        const CircleBackground(),
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            HomeCubit manager = HomeCubit.get(context);
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 70),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      GrowingCircularContainer(manager: manager),
                      CircularAudioWave(
                        manager: manager,
                        child: GestureDetector(
                          onTap: () => manager.toggleConnectButton(
                              context, this, mounted),
                          child: CircleAvatar(
                            radius: 90,
                            backgroundColor: NeutralColors.white,
                            child: Image.asset(
                              manager.isConnected
                                  ? MainImages.powerOff
                                  : MainImages.powerOn,
                              fit: BoxFit.contain,
                              width: 70,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                BottomConnectionInfo(manager: manager),
              ],
            );
          },
        ),
      ],
    );
  }
}
