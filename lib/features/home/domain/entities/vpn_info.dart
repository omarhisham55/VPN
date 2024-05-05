import 'package:equatable/equatable.dart';

class VpnInfo extends Equatable {
  final String hostName;
  final String ip;
  final String ping;
  final String countryLongName;
  final String countryShortName;
  final int speed;
  final int vpnSessionsNum;
  final String base64OpenVPNConfiguration;

  const VpnInfo({
    required this.hostName,
    required this.ip,
    required this.ping,
    required this.countryLongName,
    required this.countryShortName,
    required this.speed,
    required this.vpnSessionsNum,
    required this.base64OpenVPNConfiguration,
  });

  @override
  List<Object?> get props => [hostName, ip, ping, speed, countryShortName];
}
