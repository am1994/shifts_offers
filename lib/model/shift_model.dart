

import 'package:shifts_offers/helper/date_helper.dart';

class ShiftsModel {


  final List<ShiftModel> shiftsList;

  ShiftsModel({required this.shiftsList});

  factory ShiftsModel.fromJson(Map<String, dynamic> json) {

   List<dynamic> shiftsListFromJson = json['data'] as  List<dynamic>;

    List<ShiftModel> shiftsList =  shiftsListFromJson.map((i) => ShiftModel.fromJson(i)).toList();


    return ShiftsModel(
        shiftsList: shiftsList
    );
  }
}

class ShiftModel {
  final int id;
  final String status;
  final String startAt;
  final String endAt;
  final String postName;
  final int postId;
  final bool startSoon;
  final Map<String, dynamic> recurring;
  final String company;
  final String buyPrice;
  final int bonus;
  final double latitude;
  final double longitude;

  ShiftModel(
      {required this.id,
      required this.status,
      required this.startAt,
      required this.endAt,
      required this.postName,
      required this.postId,
      required this.startSoon,
      required this.recurring,
      required this.company,
      required this.buyPrice,
      required this.bonus,
      required this.latitude,
      required this.longitude});

  factory ShiftModel.fromJson(Map<String, dynamic> json) {
    return ShiftModel(
      postName: json['post_name'],
      postId: json['post_id'],
      latitude: json['latitude'],
      bonus: json['bonus'],
      status: json['status'],
      endAt: json['end_at'],
      company: json['company'],
      buyPrice: json['buy_price'],
      longitude: json['longitude'],
      startAt: json['start_at'],
      recurring: json['recurring'] ?? {},
      startSoon: json['start_soon'],
      id: json['id'],
    );
  }

  String  get endAtFormat => endAt.todayText() ?? endAt.formatDate();
  String  get endAtTimeFormat => endAt.formatTime();
  String  get startAtTimeFormat => startAt.formatTime();
}
