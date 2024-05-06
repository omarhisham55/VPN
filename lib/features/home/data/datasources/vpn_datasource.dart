import 'package:vpn_demo/core/constants/apis/api_consumer.dart';
import 'package:vpn_demo/core/constants/apis/apis.dart';
import 'package:vpn_demo/features/home/data/models/vpn_info_model.dart';

abstract class VpnDatasource {
  Future<List<VpnInfoModel>> getVpnServers();
}

class VpnDatasourceImpl extends VpnDatasource {
  final ApiConsumer apiConsumer;

  VpnDatasourceImpl({required this.apiConsumer});
  @override
  Future<List<VpnInfoModel>> getVpnServers() async {
    List<VpnInfoModel> servers = [];
    final Map<int, Map<String, dynamic>> response =
        await apiConsumer.get((EndPoints.getServers));
    for (var e in response.values.toList()) {
      servers.add(VpnInfoModel.fromJson(e));
    }
    return servers;
  }
}
