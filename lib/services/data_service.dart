import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:shifts_offers/model/shift_model.dart';

class DataService {
  Future<ShiftsModel> readJson() async {
    final String response =
        await rootBundle.loadString('assets/json_file/offered_shifts.json');

    final data = await json.decode(response) as Map<String, dynamic>;

    late ShiftsModel shiftsModel;

    try {
      shiftsModel = ShiftsModel.fromJson(data);
    } catch (c) {
      print(c);
    }

    return shiftsModel;
  }
}
