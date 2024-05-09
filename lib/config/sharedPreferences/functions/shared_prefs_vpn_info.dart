import 'package:vpn_demo/config/sharedPreferences/shared_preferences_controller.dart';
import 'package:vpn_demo/core/utils/strings.dart';
import 'package:vpn_demo/features/home/data/models/vpn_info_model.dart';

abstract class SharedPrefsVpnInfoFunc {
  void setVpnInfo(VpnInfoModel vpnInfo);
  VpnInfoModel getVpnInfo();
}

class SharedPrefsVpnInfoFuncImpl extends SharedPrefsVpnInfoFunc {
  final AppSharefdPrefs appSharedPrefs;

  SharedPrefsVpnInfoFuncImpl({required this.appSharedPrefs});
  @override
  VpnInfoModel getVpnInfo() {
    return VpnInfoModel.fromJson(
      appSharedPrefs.get(SharedPreferencesStrings.vpnInfo)
          as Map<String, dynamic>,
    );
  }

  @override
  void setVpnInfo(VpnInfoModel vpnInfo) {
    appSharedPrefs.save(
      SharedPreferencesStrings.vpnInfo,
      vpnInfo.toMap(),
    );
  }
}
