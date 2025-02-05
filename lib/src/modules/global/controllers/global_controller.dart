import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:go7eight/src/data/dataSource/local/countries_list.dart';
import '../../../core/app_export.dart';
import '../../../data/dataSource/remote/global.dart';
import '../../../models/country_model.dart';

class GlobalController extends GetxController{

  var countryModels = <CountryModel>[].obs;
  GlobalApiService globalApiService = GlobalApiService();

  getCountries() async {
    try {
      final countries = CountryModel.listFromJson(countriesCodeList);
      countryModels.value = countries;
    } catch (e) {
      SnackBarX.showError(
          title: "Exception",
          message: e.toString());
    } 
  }

  @override
  void onInit() {
    super.onInit();
    getCountries();
  }

}