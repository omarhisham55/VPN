import 'package:vpn_demo/config/sharedPreferences/shared_preferences_controller.dart';
import 'package:vpn_demo/core/utils/strings.dart';
import 'package:vpn_demo/features/home/data/models/vpn_info_model.dart';

abstract class SharedPrefsVpnInfoFunc {
  void setVpnInfo(VpnInfoModel vpnInfo);
  VpnInfoModel getVpnInfo();
}

class SharedPrefsVpnInfoFuncImpl extends SharedPrefsVpnInfoFunc {
  @override
  VpnInfoModel getVpnInfo() {
    return VpnInfoModel.fromJson(
      AppSharedPreference.shared.get(SharedPreferencesStrings.vpnInfo)
          as Map<String, dynamic>,
    );
  }

  @override
  void setVpnInfo(VpnInfoModel vpnInfo) {
    AppSharedPreference.shared.save(
      SharedPreferencesStrings.vpnInfo,
      vpnInfo.toMap(),
    );
  }
}
