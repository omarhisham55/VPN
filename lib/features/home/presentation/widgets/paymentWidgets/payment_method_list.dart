import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vpn_demo/config/theme/theme_manager.dart';
import 'package:vpn_demo/core/components/text/text_controller.dart';
import 'package:vpn_demo/core/utils/colors.dart';
import 'package:vpn_demo/core/utils/images.dart';

class PaymentMethodList extends StatelessWidget {
  const PaymentMethodList({super.key});

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: true,
      fallback: (context) => _emptyPaymentList(),
      builder: (context) {
        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => _paymentMethodListItem(context),
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemCount: 5,
        );
      },
    );
  }

  Widget _emptyPaymentList() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            MainImages.emptyList,
            width: 160,
          ),
          const SizedBox(height: 16),
          const TextGlobal(
            'Empty Card',
            style: TextSizeState.headlineMedium,
            color: PrimaryColors.primary400,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }

  Widget _paymentMethodListItem(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: ThemeController.isDarkTheme
            ? NeutralColors.lightBlack
            : NeutralColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Image.asset(
            SocialsImages.apple,
            height: 30,
          ),
          const Expanded(
            child: TextGlobal(
              'PayPal',
              startSpacing: 12,
              style: TextSizeState.titleMedium,
              fontWeight: FontWeight.w600,
            ),
          ),
          Radio.adaptive(
            value: true,
            groupValue: true,
            activeColor: PrimaryColors.primary500,
            fillColor: MaterialStatePropertyAll(
              ThemeController.isDarkTheme
                  ? NeutralColors.white
                  : NeutralColors.grey400,
            ),
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }
}
