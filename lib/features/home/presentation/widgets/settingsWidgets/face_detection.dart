import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:vpn_demo/core/utils/strings.dart';

class FaceScanManager {
  static final LocalAuthentication auth = LocalAuthentication();
  static bool supportState = false;
  static const MethodChannel platform =
      MethodChannel('biometric_authentication');

  static Future<bool> faceScanInit() async {
    return auth
        .isDeviceSupported()
        .then((bool isSupported) => FaceScanManager.supportState = isSupported);
  }

  static Future<void> getAvailableBiometrics(LocalAuthentication auth) async {
    List<BiometricType> availableBiometrics =
        await auth.getAvailableBiometrics();
    if (availableBiometrics.isNotEmpty) return;
  }

  static Future<void> scanAuthenticate() async {
    try {
      bool authenticated = await auth.authenticate(
        localizedReason: 'App Authentication',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: false,
        ),
      );
      debugPrint('bool auth: $authenticated');
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    }
  }

  static Future<void> faceAuth() async {
    try {
      await platform.invokeMethod('authenticateWithFace');
    } on PlatformException catch (e) {
      debugPrint(e.code.toString() + e.message.toString());
    }
  }
}

class FaceScanDetection extends StatefulWidget {
  final bool isSupported;

  const FaceScanDetection({super.key, required this.isSupported});

  @override
  State<FaceScanDetection> createState() => _FaceScanDetectionState();
}

class _FaceScanDetectionState extends State<FaceScanDetection> {
  late LocalAuthentication auth = FaceScanManager.auth;

  @override
  void initState() {
    super.initState();
    setState(() {
      FaceScanManager.getAvailableBiometrics(auth);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FaceScanManager.faceAuth(),
        builder: (context, snapshot) {
          return Column(
            children: [
              if (widget.isSupported)
                const Text('supported')
              else
                const Text('not supported'),
              Text(
                SettingsStrings.faceIdTip,
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ],
          );
        });
  }
}
