import 'package:flutter/material.dart';
import 'package:vpn_demo/core/components/appbars/home_appbar.dart';
import 'package:vpn_demo/core/components/buttons/filled_button_component.dart';
import 'package:vpn_demo/core/components/buttons/premium_button.dart';
import 'package:vpn_demo/core/constants/dialogs.dart';
import 'package:vpn_demo/core/utils/colors.dart';
import 'package:vpn_demo/features/home/presentation/widgets/paymentWidgets/payment_method_list.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: extraPageAppbar(context, 'Payment', backgroundColor: Colors.transparent),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Expanded(child: PaymentMethodList()),
            _buttons(context),
          ],
        ),
      ),
    );
  }

  Widget _buttons(BuildContext context) {
    return Column(
      children: [
        PremiumButton(
          icon: const Icon(
            Icons.add,
            color: PrimaryColors.primary500,
          ),
          text: 'Add New Card',
          width: double.infinity,
          onPressed: () {},
        ),
        const SizedBox(height: 12),
        DefualtAppButton(
          text: 'Payment',
          width: double.infinity,
          onPressed: () => AppDialogs.paymentSuccess(context),
        ),
      ],
    );
  }
}
