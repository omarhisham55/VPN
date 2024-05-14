import 'package:flutter/material.dart';
import 'package:vpn_demo/core/components/text/text_controller.dart';
import 'package:vpn_demo/core/utils/colors.dart';

class Subscribtion extends StatelessWidget {
  const Subscribtion({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const TextGlobal(
          'Select Your Subscription',
          style: TextSizeState.titleMedium,
          color: NeutralColors.white,
        ),
        ListView.separated(
          shrinkWrap: true,
          padding: const EdgeInsets.only(bottom: 35, top: 18),
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => _subsriptionItem(context),
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemCount: 4,
        ),
      ],
    );
  }

  Widget _subsriptionItem(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: NeutralColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          const TextGlobal(
            '1 ',
            color: NeutralColors.black,
            fontWeight: FontWeight.w600,
          ),
          const Expanded(
              child: TextGlobal(
            'Month',
            color: NeutralColors.black,
            fontWeight: FontWeight.w600,
          )),
          const TextGlobal(
            '\$ 1.99',
            color: PrimaryColors.primary500,
          ),
          Radio.adaptive(
            value: false,
            groupValue: true,
            onChanged: (value) {},
            fillColor: const MaterialStatePropertyAll(NeutralColors.grey400),
            activeColor: PrimaryColors.primary500,
          ),
        ],
      ),
    );
  }
}
