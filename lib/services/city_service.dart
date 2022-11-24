import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:housequ/models/city_model.dart';

class CityService{

  CollectionReference _cityRef = FirebaseFirestore.instance.collection('city');

  Future<List<CityModel>> fetchCity() async{

    try {
      
      QuerySnapshot result = await _cityRef.get();

      List<CityModel> city = result.docs.map((e) {
        return CityModel.fromJson(e.id, e.data() as Map<String, dynamic>);
      }).toList();  

      return city;
    } catch (e) {
      throw e;
    }
  }
}