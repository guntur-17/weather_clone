import 'city.dart';
import 'listmodel.dart';

class ThreehoursFivedaysModel {
  String? cod;
  int? message;
  int? cnt;
  List<ListModel>? list;
  City? city;

  ThreehoursFivedaysModel({
    this.cod,
    this.message,
    this.cnt,
    this.list,
    this.city,
  });

  factory ThreehoursFivedaysModel.fromJson(Map<String, dynamic> json) {
    return ThreehoursFivedaysModel(
      cod: json['cod'] as String?,
      message: json['message'] as int?,
      cnt: json['cnt'] as int?,
      list: (json['list'] as List<dynamic>?)
          ?.map((e) => ListModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      city: json['city'] == null
          ? null
          : City.fromJson(json['city'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'cod': cod,
        'message': message,
        'cnt': cnt,
        'list': list?.map((e) => e.toJson()).toList(),
        'city': city?.toJson(),
      };
}
