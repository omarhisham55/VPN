import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vpn_demo/core/components/text_fields/defualt_text_field.dart';
import 'package:vpn_demo/features/home/presentation/cubit/settings_cubit/settings_cubit.dart';

class PinCode extends StatelessWidget {
  final SettingsCubit manager;
  const PinCode({super.key, required this.manager});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.transparent,
      child: Row(
        children: List.generate(
          4,
          (index) => Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: DefualtTextField(
                hintText: '',
                controller: manager.pinCode[index],
                keyboardType: TextInputType.number,
                borderRadius: 10,
                maxLength: 1,
                textAlign: TextAlign.center,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(1),
                ],
                onChanged: (value) {
                  FocusScope.of(context).nextFocus();
                  manager.setPinCodeButtonDisabled();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
