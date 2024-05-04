import 'package:flutter/material.dart';
import 'package:vpn_demo/core/components/buttons/filled_button_component.dart';
import 'package:vpn_demo/core/components/buttons/outlined_button_component.dart';
import 'package:vpn_demo/core/components/text_fields/defualt_text_field.dart';
import 'package:vpn_demo/core/components/text_fields/text_field_labeled.dart';
import 'package:vpn_demo/core/utils/strings.dart';
import 'package:vpn_demo/features/authentication/presentation/cubit/authentication_cubit.dart';
import 'package:vpn_demo/features/home/presentation/cubit/home_cubit.dart';

class EditUserForm extends StatelessWidget {
  final HomeCubit manager;
  const EditUserForm({super.key, required this.manager});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 26),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Change User Information',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.all(10),
            child: TextFieldLabeled(
              labelName: 'Full Name',
              textField: DefualtTextField(
                hintText: '',
                controller: AuthenticationCubit.get(context).name,
                keyboardType: TextInputType.name,
                borderRadius: 10,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 30),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextFieldLabeled(
              labelName: 'Email',
              textField: DefualtTextField(
                hintText: '',
                controller: AuthenticationCubit.get(context).email,
                keyboardType: TextInputType.emailAddress,
                borderRadius: 10,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: DefualtOutlinedAppButton(
                  text: MainStrings.cancel,
                  onPressed: () => manager.customPanelController.close(),
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: DefualtAppButton(
                  text: MainStrings.save,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
