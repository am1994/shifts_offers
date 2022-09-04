
import 'package:flutter/material.dart';
import 'package:shifts_offers/model/shift_model.dart';
import 'package:shifts_offers/resources/colors.dart';
import 'package:shifts_offers/resources/styles.dart';
import 'package:shifts_offers/ui/screens/shifts_details.dart';
import 'package:shifts_offers/ui/widgets/circular_text.dart';

class ListItemWidget extends StatelessWidget {
  final ShiftModel shiftModel;
  final Color dateColor;
  const ListItemWidget({Key? key, required this.shiftModel, required this.dateColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return     GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  ShiftsDetails(shiftModel: shiftModel,)),
        );
      },
      child: Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: cWhiteColor),
          child:
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 20.0, horizontal: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  shiftModel.company,
                  style: sTitleStyle.copyWith(fontSize: 16),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                 shiftModel.endAtFormat.toUpperCase(),
                  style: sBodyTitleStyle.copyWith(color: dateColor),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircularText(name: shiftModel.postName,),

                        const SizedBox(
                          width: 8,
                        ),

                        Text(
                          '${shiftModel.buyPrice} / H',
                          style: sBodyTitleStyle.copyWith(
                              color: cGreyColor),
                        ),
                        const SizedBox(
                          width: 4,
                        ),

                        Text(
                          '+ ${shiftModel.bonus}\$ / H',
                          style: sBodyTitleStyle.copyWith(
                              color: cGreenColor),
                        ),
                      ],
                    ),
                    Text(
                      '${shiftModel.startAtTimeFormat} - ${shiftModel.endAtTimeFormat}',
                      style: sBodyTitleStyle.copyWith(
                          color: cRedColor,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                )
              ],
            ),
          )
      ),
    );
  }
}
