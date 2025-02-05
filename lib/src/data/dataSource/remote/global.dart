import 'package:appwrite/appwrite.dart';
import '../../../core/constants/app_constants.dart';
import '../../../models/country_model.dart';

class GlobalApiService {

  Future<List<CountryModel>> getCountries() async {
    try {
      final data = await databases.listDocuments(
          databaseId: databaseId,
          queries: [
            Query.limit(1000),
          ],
          collectionId: countriesCollectionId);
      List<CountryModel> countries = data.documents.map((document) {
        return CountryModel.fromJson(document.data);
      }).toList();

      return countries;
    } on AppwriteException catch (ex) {
      throw Exception('Failed to fetch countries. Error: ${ex.toString()}');
    } catch (ex) {
      throw Exception('Failed to fetch countries. Error: ${ex.toString()}');
    }
  }
}