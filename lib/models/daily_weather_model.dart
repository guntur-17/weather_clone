class DailyModel {
  String? date;
  int? temp;
  int? feelstemp;
  String? icon;

  DailyModel({this.date, this.temp, this.feelstemp, this.icon});

  factory DailyModel.fromJson(Map<String, dynamic> json) => DailyModel(
        date: json['date'],
        temp: json['temp'],
        feelstemp: json['feelstemp'],
        icon: json['icon'],
      );

  Map<String, dynamic> toJson() => {
        'date': date,
        'temp': temp,
        'feelstemp': feelstemp,
        'icon': icon,
      };
}
