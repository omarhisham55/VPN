import 'package:vpn_demo/features/home/domain/entities/vpn_info.dart';

class VpnInfoModel extends VpnInfo {
  const VpnInfoModel({
    required super.hostName,
    required super.ip,
    required super.ping,
    required super.countryLongName,
    required super.countryShortName,
    required super.speed,
    required super.vpnSessionsNum,
    required super.base64OpenVPNConfiguration,
  });

  factory VpnInfoModel.fromJson(Map<String, dynamic> json) => VpnInfoModel(
        hostName: json['HostName'] ?? '',
        ip: json['IP'] ?? '',
        ping: json['Ping'] ?? '',
        countryLongName: json['CountryLong'] ?? '',
        countryShortName: json['CountryShort'] ?? '',
        speed: json['Speed'] ?? 0,
        vpnSessionsNum: json['NumVpnSessions'] ?? 0,
        base64OpenVPNConfiguration: json['OpenVPN_Configuration_Base64'] ?? '',
      );

  Map<String, dynamic> toMap() {
    return {
      'HostName': hostName,
      'IP': ip,
      'Ping': ping,
      'CountryLong': countryLongName,
      'CountryShort': countryShortName,
      'Speed': speed,
      'NumVpnSessions': vpnSessionsNum,
      'OpenVPN_Configuration_Base64': base64OpenVPNConfiguration,
    };
  }
}
