import 'package:flutter/material.dart';
import 'package:shifts_offers/model/shift_model.dart';
import 'package:shifts_offers/resources/colors.dart';
import 'package:shifts_offers/resources/constants.dart';
import 'package:shifts_offers/resources/styles.dart';
import 'package:shifts_offers/services/data_service.dart';
import 'package:shifts_offers/ui/widgets/list_item_widget.dart';

class ShiftsOffers extends StatelessWidget {
  const ShiftsOffers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DataService dataService = DataService();

    return SingleChildScrollView(
      child: FutureBuilder<ShiftsModel>(
          future: dataService.readJson(),
          builder: (context, snapshot) {


            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator(color: cSecondColor,));
            }else {
              List<ShiftModel> shiftsNow = [];
              List<ShiftModel> shiftsUpcoming = [];

              for(ShiftModel shift in snapshot.data!.shiftsList){
                 if(shift.endAtFormat == today){
                   shiftsNow.add(shift);
                 }else{
                   shiftsUpcoming.add(shift);
                 }
              }

              return Padding(
                padding: const EdgeInsets.only(
                    left: 25.0, top: 10, right: 25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [


                 shiftsNow.isNotEmpty ?   Text(
                      derniereMinute.toUpperCase(),
                      style: sBodyTitleStyle,
                    ) : Container(),

                    shiftsNow.isNotEmpty ?
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: shiftsNow.length,
                        itemBuilder: (BuildContext context, int index) {
                          ShiftModel shiftModel =
                          snapshot.data!.shiftsList[index];
                          return ListItemWidget(
                              shiftModel: ShiftModel(
                                  bonus: shiftModel.bonus,
                                  company: shiftModel.company,
                                  id: shiftModel.id,
                                  recurring: shiftModel.recurring,
                                  status: shiftModel.status,
                                  endAt: shiftModel.endAt,
                                  latitude: shiftModel.latitude,
                                  buyPrice: shiftModel.buyPrice,
                                  postId: shiftModel.postId,
                                  startAt: shiftModel.startAt,
                                  postName: shiftModel.postName,
                                  startSoon: shiftModel.startSoon,
                                  longitude: shiftModel.longitude),

                          dateColor: cRedColor,
                          );
                        }) : Container(),

                    shiftsUpcoming.isNotEmpty ?
                    Text(
                      shiftsAVenir.toUpperCase(),
                      style: sBodyTitleStyle,
                    ) : Container(),

                    shiftsUpcoming.isNotEmpty ?
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: shiftsUpcoming.length,
                        itemBuilder: (BuildContext context, int index) {
                          ShiftModel shiftModel =
                          snapshot.data!.shiftsList[index];
                          return ListItemWidget(
                            shiftModel: ShiftModel(
                                bonus: shiftModel.bonus,
                                company: shiftModel.company,
                                id: shiftModel.id,
                                recurring: shiftModel.recurring,
                                status: shiftModel.status,
                                endAt: shiftModel.endAt,
                                latitude: shiftModel.latitude,
                                buyPrice: shiftModel.buyPrice,
                                postId: shiftModel.postId,
                                startAt: shiftModel.startAt,
                                postName: shiftModel.postName,
                                startSoon: shiftModel.startSoon,
                                longitude: shiftModel.longitude),
                            dateColor: cDarkGrey,
                          );
                        }) : Container(),
                  ],
                ),

              );
            }
          }),
    );
  }
}
