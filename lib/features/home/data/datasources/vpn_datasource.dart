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
    apiConsumer.get((EndPoints.getServers)).then((value) {
      for (var i = 0; i < value.length; i++) {
        servers.add(VpnInfoModel.fromJson(value[i]));
      }
    });
    return servers;
  }
}
