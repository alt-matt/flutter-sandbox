import 'dart:convert';
import 'dart:developer';
// import 'dart:html';
import 'package:fsa_viewer_flutter_application/screens/EstablishmentList.dart';
import 'package:http/http.dart' as http;

class ApiConstants {
  static String baseUrl = 'https://api.ratings.food.gov.uk/';
  static String basicEstablishments = 'Establishments/basic';
}

class FsaApiModel {
  FsaApiModel({
    this.establishments = const [],
    this.meta = const {},
    this.links = const []
  });

  List<EstablishmentModel> establishments;
  Object meta;
  List<EstablishmentList> links;

  FsaApiModel.fromJson(Map<String, dynamic> json):
    establishments = json["establishments"],
    meta = json["meta"],
    links = json["links"];
}

class EstablishmentModel {
  EstablishmentModel({
    this.id = 0,
    this.localAuthorityId = '',
    this.businessName = '',
    this.businessType = '',
    this.rating = '',
    required this.ratingDate,
    // this.links = const []
  });

  int id;
  String localAuthorityId;
  String businessName;
  String businessType;
  String rating;
  DateTime ratingDate;
  // List<EstablishmentLinks> links;

  factory EstablishmentModel.fromJson(Map<String, dynamic> json) => EstablishmentModel(
        id: int.parse(json["FHRSID"]),
        localAuthorityId: json["LocalAuthorityBusinessID"],
        businessName: json["BusinessName"],
        businessType: json["BusinessType"],
        rating: json["RatingValue"],
        ratingDate: DateTime.parse(json["RatingDate"]),
        // links: json["links"]
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "localAuthorityId": localAuthorityId,
        "businessName": businessName,
        "businessType": businessType,
        "rating": rating,
        "ratingDate": ratingDate,
        // "links": links
      };
  
}

class EstablishmentLinks {
  EstablishmentLinks({
    required this.linkType,
    required this.url
  });

  String linkType;
  String url;

    factory EstablishmentLinks.fromJson(Map<String, dynamic> json) => EstablishmentLinks(
        linkType: json["rel"],
        url: json["href"]
    );
}



List<EstablishmentModel> userModelFromJson(String str) =>
    List<EstablishmentModel>.from(json.decode(str).map((x) => EstablishmentModel.fromJson(x)).toList());

String userModelToJson(List<EstablishmentModel> data) =>
  json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

Map<String, String> get apiHeaders => {
        "x-api-version": "2",
      };

class ApiService {
  Future<FsaApiModel?> getEstablishments() async {
    try {
      log("hit");
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.basicEstablishments);
      var response = await http.get(url, headers: apiHeaders);
      if(response.statusCode == 200) {
        log("200");
        FsaApiModel myModel;
        Map<String, dynamic> map = jsonDecode(response.body);
        myModel = FsaApiModel.fromJson(map);
        log(myModel.establishments[0].businessName);
        return myModel;
      }
      log("hit2");
      log(response.statusCode.toString() + url.toString());
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
