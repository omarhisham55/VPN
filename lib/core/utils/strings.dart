import 'package:vpn_demo/core/utils/images.dart';

class MainStrings {
  static const String appName = 'VPN';
  static const String undefinedRoute = 'Undefined Route';
  static const String tapToConnect = 'Tap to Connect';
  static const String bestLoction = 'Beast Location';
  static const String fastestServer = 'Fastest Server';
  static const String changeLocation = 'Change Location';
  static const String disconnectDialogContent = 'Do you want to disconnect?';
  static const String cancel = 'Cancel';
  static const String disconnect = 'Disconnect';
  static const String delete = 'Delete';
  static const String save = 'Save';
  static const String disconnectSuccessful =
      'Disconnected from the server successfully';
  static const String deleteHistoryCheck =
      'Do you want to delete this history?';
  static const String englishLocal = 'en';
  static const String arabicLocal = 'ar';
  // static const String contentType = "Content-Type";
  // static const String applicationJson = "application/json";
}

class DrawerStrings {
  static const Map<int, List<String>> drawerList = {
    0: ['Home', DrawerImages.house],
    1: ['Speed Test', DrawerImages.speedTest],
    2: ['Share', DrawerImages.share],
    3: ['History', DrawerImages.history],
    4: ['My Account', DrawerImages.myAccount],
    5: ['Settings', DrawerImages.settings],
    6: ['Help', DrawerImages.help],
    7: ['About Us', DrawerImages.aboutUs],
  };
}

class OnBoardingStrings {
  static const String startTitle = 'FAST VPN';
  static const String version = 'Version 2.1.0';
  static const String startQuote = 'Protect your privacy at lightning speed.';
  static const Map<int, List<String>> onBoardingStrings = {
    0: [
      OnBoardingImages.onBoarding1,
      'Many prestigious Awards',
      'Trusted by over 4 million users.',
    ],
    1: [
      OnBoardingImages.onBoarding2,
      'Safe and Secured',
      'Military-Grade Encryption.',
    ],
    2: [
      OnBoardingImages.onBoarding3,
      'Global Server Coverage',
      'Supports over 1 million servers worldwide.',
    ],
    3: [
      OnBoardingImages.onBoarding4,
      '24/7 Customer Support',
      'Caring help whenever you need',
    ],
  };
}

class SettingsStrings {
  static final List<String> settingTitle = [
    'Language',
    'Connection Mode',
    'Notification',
    'Dark Mode',
    'Face ID',
    'Touch ID',
    'Pin Security',
    'Terms of Service',
    'Privacy Policy',
    'About App',
  ];
  static const String pinSecurityTitle = 'PIN Security';
  static const String pinSecuritySubtitle =
      'Protect your account with a secure PIN';
  static const String touchIdTitle = 'Touch ID Security';
  static const String touchIdSubtitle =
      'Secure your account with your fingerprint using touch ID';
  static const String touchIdTip =
      'Please place your finger on the fingerprint sensor to get started';

  static const String faceIdTitle = 'Face ID Security';
  static const String faceIdSubtitle =
      'Secure your account with your face using face ID';
  static const String faceIdTip =
      'Please position your face infront of the camera to authenticate with your face ID';
  static const String secured = '\u2713  Authentication successful';
  static const String notSecured = '\u2717  Authentication failed';
}

class SharedPreferencesStrings {
  static const String isBoardingComplete = 'isBoardingComplete';
  static const String isUserLoggedIn = 'isUserLoggedIn';
  static const String isDarkMode = 'isDarkMode';
  static const String vpnInfo = 'vpnInfo';
  static const String local = 'local';
}
