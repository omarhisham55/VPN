import 'package:flutter/material.dart';
import 'package:vpn_demo/core/components/text/text_controller.dart';
import 'package:vpn_demo/core/utils/colors.dart';
import 'package:vpn_demo/core/utils/images.dart';

class ServiceCardOffers extends StatelessWidget {
  const ServiceCardOffers({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => _serviceCardItem(context),
      itemCount: 3,
    );
  }

  Widget _serviceCardItem(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: NeutralColors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.done,
            size: 40,
            color: NeutralColors.white,
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextGlobal(
                  'Multi-Device',
                  style: TextSizeState.titleMedium,
                  color: NeutralColors.white,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 5),
                TextGlobal(
                  'Use on Multiple devices',
                  style: TextSizeState.titleSmall,
                  color: NeutralColors.white,
                ),
              ],
            ),
          ),
          Image.asset(
            MainImages.premiumFilled,
            fit: BoxFit.fill,
            color: NeutralColors.white,
            height: 30,
          ),
        ],
      ),
    );
  }
}
