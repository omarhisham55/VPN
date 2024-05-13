import 'package:vpn_demo/config/theme/theme_manager.dart';

const imgPath = 'assets/images';
const drawerPath = '$imgPath/drawerImgs';
const sharePath = '$imgPath/share';
const onBoardingPath = '$imgPath/ob';
const socialPath = '$imgPath/socials';
const settingsPath = '$imgPath/settings';
const aboutPath = '$imgPath/about';
const signalsPath = '$imgPath/signal';

class MainImages {
  static const String worldBgLight = '$imgPath/worldBgLight.png';
  static const String worldBgDark = '$imgPath/worldBgDark.png';
  static const String logo = '$imgPath/logo.png';
  static const String logo2 = '$imgPath/logo2.png';
  static const String powerOn = '$imgPath/power_on.png';
  static const String powerOff = '$imgPath/power_off.png';
  static const String premiumWhite = '$imgPath/premium_white.png';
  static const String premiumFilled = '$imgPath/premium_filled.png';
  static const String emptyList = '$imgPath/empty_list.png';
}

class DrawerImages {
  static const String house = '$drawerPath/house.png';
  static const String speedTest = '$drawerPath/speed_test.png';
  static const String share = '$drawerPath/share.png';
  static const String history = '$drawerPath/history.png';
  static const String myAccount = '$drawerPath/my_account.png';
  static const String settings = '$drawerPath/settings.png';
  static const String help = '$drawerPath/help.png';
  static const String aboutUs = '$drawerPath/about_us.png';
}

class OnBoardingImages {
  static const onBoardingStart = '$onBoardingPath/obs.json';
  static const onBoarding1 = '$onBoardingPath/ob1.png';
  static const onBoarding2 = '$onBoardingPath/ob2.png';
  static const onBoarding3 = '$onBoardingPath/ob3.png';
  static const onBoarding4 = '$onBoardingPath/ob4.png';
}

class SocialsImages {
  static const google = '$socialPath/google.png';
  static const facebook = '$socialPath/facebook.png';
  static const apple = '$socialPath/apple.png';
}

class ShareImages {
  static const List<String> shareImgs = [
    '$sharePath/twitter.png',
    '$sharePath/facebook.png',
    '$sharePath/messenger.png',
    '$sharePath/discord.png',
    '$sharePath/skype.png',
    '$sharePath/telegram.png',
    '$sharePath/imessage.png',
    '$sharePath/whatsapp.png',
  ];
}

class SettingsImages {
  static const faceId = '$settingsPath/face_id.json';
  static const fingerId = '$settingsPath/finger_id.json';
}

class AboutImages {
  static final List<String> aboutImgs = [
    '$aboutPath/about1.png',
    '$aboutPath/about2.png',
    '$aboutPath/about3.png',
    '$aboutPath/about4.png',
    '$aboutPath/about5.png',
    '$aboutPath/about6.png',
  ];
}

enum SignalConnectionState { strong, medium, weak }

class SignalImages {
  static String signal(SignalConnectionState signalState) =>
      _getSignalImg(signalState);
  static String _getSignalImg(SignalConnectionState signalState) {
    return switch (signalState) {
      SignalConnectionState.strong => '$signalsPath/high_connection.png',
      SignalConnectionState.medium => ThemeController.isDarkTheme
          ? '$signalsPath/medium_connection_dark.png'
          : '$signalsPath/medium_connection.png',
      SignalConnectionState.weak => ThemeController.isDarkTheme
          ? '$signalsPath/low_connection_dark.png'
          : '$signalsPath/low_connection.png',
    };
  }
}
