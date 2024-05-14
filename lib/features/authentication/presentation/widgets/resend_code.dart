import 'dart:async';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:vpn_demo/core/components/text/text_controller.dart';
import 'package:vpn_demo/core/constants/snack_bars.dart';
import 'package:vpn_demo/core/utils/colors.dart';

class ResendCode extends StatefulWidget {
  const ResendCode({super.key});

  @override
  State<ResendCode> createState() => _ResendCodeState();
}

class _ResendCodeState extends State<ResendCode> {
  late Timer _timer;
  int _secondsRemaining = 60;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        _timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TextGlobal(
                'Didn\'t receive code?',
                style: TextSizeState.bodyMedium,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  children: [
                    const Icon(Icons.access_time),
                    const SizedBox(width: 8),
                    TextGlobal('$_secondsRemaining'),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _secondsRemaining = 60;
                    _startTimer();
                    AppSnackBars.showSnackBar(
                      context,
                      'New Verification Code Sent',
                      AnimatedSnackBarType.success,
                    );
                  });
                },
                child: TextGlobal(
                  'Resend Code',
                  style: TextSizeState.bodyMedium,
                  color: _secondsRemaining > 0
                      ? NeutralColors.grey500
                      : PrimaryColors.primary500,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
