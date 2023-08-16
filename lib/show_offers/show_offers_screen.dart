import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lang_hub_admin/add_offer/add_offer_screen.dart';
import 'package:lang_hub_admin/show_offers/offer_cubit.dart';
import 'package:lang_hub_admin/show_offers/offer_model.dart';

import '../core/color.dart';

class ShowOffersScreen extends StatelessWidget {
  const ShowOffersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: mainColor,
        // isExtended: true,
        //clipBehavior: Clip.antiAliasWithSaveLayer,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddOfferScreen()));
        },
        child: Icon(
          Icons.add_circle_outline,
          size: 40,
        ),
        // add some space between the icon and the text
      ),
      body: BlocProvider(
        create: (context) => OfferCubit()..getOffers(),
        child: BlocConsumer<OfferCubit, OfferState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return Column(
              children: [
                Expanded(
                  child: ConditionalBuilder(
                      condition: state is! OfferLoadingState,
                      fallback: (context) => Center(
                            child: CircularProgressIndicator(),
                          ),
                      builder: (context) {
                        final modelOffer = OfferCubit.get(context).offerModel;
                        return GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4, // number of columns
                            crossAxisSpacing: 10.0, // spacing between columns
                            mainAxisSpacing: 10.0, // spacing between rows
                          ),
                          itemCount:
                          modelOffer?.data?.length, // number of items
                          itemBuilder: (BuildContext context, int index) {
                            final data = modelOffer?.data?[index];
                            return BuildItemListView(
                                context,data!);
                          },
                        );
                      }),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

Widget BuildItemListView(
    BuildContext context,Data data) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Container(
      width: ScreenUtil().setWidth(281),
      height: ScreenUtil().setHeight(243),
      decoration: BoxDecoration(
        color: fillColorInTextFormField,
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(38.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1.0,
              ),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30)),
            ),
            width: double.infinity,
            height: ScreenUtil().setHeight(180),
            child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30)),
                child: (data.image == null)
                    ? Container(
                        color: Colors.blue,
                      )
                    : Image.network(
                        data.image!,
                        fit: BoxFit.cover,
                      )
                    ),
          ),
          Container(
            width: ScreenUtil().setWidth(281),
            height: ScreenUtil().setHeight(200),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.name!,
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(25), // smaller font size
                          color: mainColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      data.hours! + " hours",
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(23), // smaller font size
                        color: mainColor,
                      ),
                    ),
                  ],
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.delete))
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
