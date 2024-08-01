import 'package:payments_getway/core/service/api_service.dart';
import 'package:payments_getway/core/utils/api_key.dart';
import 'package:payments_getway/models/currency_model.dart';

class CurrencyService {
  final ApiService apiService = ApiService();
  Future<CurrencyModel> getCurrency() async {
    var response = await apiService.get(
        url:
            'https://api.fastforex.io/fetch-one?from=USD&to=EGP&api_key=${ApiKey.currencyApiKey}');

    var currency = CurrencyModel.fromJson(response.data);
    return currency;
  }
}
