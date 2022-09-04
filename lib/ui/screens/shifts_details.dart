import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:shifts_offers/model/shift_model.dart';
import 'package:shifts_offers/resources/colors.dart';
import 'package:shifts_offers/resources/constants.dart';
import 'package:shifts_offers/resources/styles.dart';
import 'package:shifts_offers/ui/widgets/circular_text.dart';
import 'package:shifts_offers/ui/widgets/icon_text.dart';

class ShiftsDetails extends StatelessWidget {
  final ShiftModel shiftModel;
  const ShiftsDetails({Key? key, required this.shiftModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                    child: const CircleAvatar(
                      backgroundColor: cTextColor,
                      child: Icon(
                        Icons.arrow_back,
                      ),
                    ),
                  ),
                ),
                // Image.network(shiftModel.)

                Center(
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: CircleAvatar(
                        backgroundColor: cTextColor,
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Image.asset(
                            'assets/images/not_found.png',
                            color: cSecondColor,
                          ),
                        )),
                  ),
                ),
                Center(
                  child: Text(
                    shiftModel.company,
                    style: sTitleStyle.copyWith(fontSize: 20),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Text(shiftModel.endAtFormat.toUpperCase(),
                      style: sBodyTitleStyle.copyWith(
                          color: shiftModel.endAtFormat == today
                              ? cRedColor
                              : cDarkGrey)),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircularText(
                            name: shiftModel.postName,
                          ),

                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            '${shiftModel.buyPrice}\$ / H',
                            style: sBodyTitleStyle.copyWith(color: cDarkGrey),
                          ),
                        ],
                      ),
                      Text(
                        '${shiftModel.startAtTimeFormat} - ${shiftModel.endAtTimeFormat}',
                        style: sBodyTitleStyle.copyWith(color: cDarkGrey),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FutureBuilder<List<Address>>(
                          future: Geocoder.local.findAddressesFromCoordinates(
                              Coordinates(
                                  shiftModel.latitude, shiftModel.longitude)),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              print(snapshot.data);
                              return Container();
                            }
                            var data = snapshot.data!.first;
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: IconText(
                                icon: Icons.location_on_outlined,
                                text:
                                    '${data.locality}, ${data.subLocality}, ${data.postalCode}',
                              ),
                            );
                          }),
                      IconText(
                        icon: Icons
                            .attach_money_outlined, //Icons.monetization_on_outlined,
                        text: '$bonus: +${shiftModel.bonus}\$ / H',
                      )
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(responsable,
                      style: sBodyTitleStyle.copyWith(
                          fontWeight: FontWeight.w500)),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: 50,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
          decoration: BoxDecoration(
              color: cSecondColor,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(45)),
          child: Center(
            child: Text(
              postuler,
              style: sBottomTitleStyle.copyWith(fontSize: 14),
            ),
          ),
        ));
  }
}
