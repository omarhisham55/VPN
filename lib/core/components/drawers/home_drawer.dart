import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vpn_demo/core/components/buttons/premium_button.dart';
import 'package:vpn_demo/core/components/text/text_controller.dart';
import 'package:vpn_demo/core/utils/colors.dart';
import 'package:vpn_demo/core/utils/images.dart';
import 'package:vpn_demo/core/utils/strings.dart';
import 'package:vpn_demo/features/home/presentation/cubit/home_cubit/home_cubit.dart';

class HomeDrawer extends StatefulWidget {
  final Scaffold scaffold;
  const HomeDrawer({super.key, required this.scaffold});

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> with TickerProviderStateMixin {
  late AnimationController _drawerController;

  @override
  void initState() {
    super.initState();
    _drawerController = AnimationController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: GradientColors.linearPrimaryGradientInverted,
            ),
          ),
          AdvancedDrawer(
            controller: HomeCubit.get(context).drawerController,
            drawer: const MainDrawer(),
            backdropColor: Colors.transparent,
            openRatio: 0.6,
            openScale: 0.8,
            animationDuration: const Duration(milliseconds: 300),
            animationCurve: Curves.linear,
            animateChildDecoration: true,
            animationController: _drawerController,
            childDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: widget.scaffold,
          ),
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return Visibility(
                visible: HomeCubit.get(context).isDrawerOpen,
                child: PremiumButton(
                  icon: Image.asset(
                    MainImages.premiumFilled,
                    height: 25,
                  ),
                  text: 'Go to Premium',
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 90, vertical: 30),
                  onPressed: () {},
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => HomeCubit.get(context).drawerController.hideDrawer(),
            child: const Icon(
              Icons.close,
              size: 42,
              color: NeutralColors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 70, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextGlobal(
                  'Hello,',
                  style: TextSizeState.bodyMedium,
                  color: NeutralColors.white,
                ),
                const TextGlobal(
                  'Thomas K. Wilson',
                  style: TextSizeState.bodyMedium,
                  color: NeutralColors.white,
                ),
                const SizedBox(height: 16),
                ...DrawerStrings.drawerList.entries.map(
                  (e) => BlocBuilder<HomeCubit, HomeState>(
                      builder: (context, state) {
                    HomeCubit manager = HomeCubit.get(context);
                    return GestureDetector(
                      onTap: () => manager.changeDrawerPage(e.key),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: manager.drawerSelectedPage == e.key
                              ? SecondaryColors.secondary500.withOpacity(.8)
                              : null,
                          border: manager.drawerSelectedPage == e.key
                              ? const BorderDirectional(
                                  start: BorderSide(
                                      color: NeutralColors.white, width: 5),
                                )
                              : null,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Image.asset(
                                e.value[1],
                                height: 30,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              flex: 3,
                              child: TextGlobal(
                                e.value[0],
                                style: TextSizeState.bodyLarge,
                                color: NeutralColors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
