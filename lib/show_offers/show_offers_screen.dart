import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lang_hub_admin/add_offer/add_offer_screen.dart';
import 'package:lang_hub_admin/core/widgets/snake_bar_widget.dart';
import 'package:lang_hub_admin/show_offers/offer_cubit.dart';
import 'package:lang_hub_admin/show_offers/offer_model.dart';

import '../core/color.dart';
import '../core/widgets/alert.dart';

class ShowOffersScreen extends StatefulWidget {
  const ShowOffersScreen({Key? key}) : super(key: key);

  @override
  State<ShowOffersScreen> createState() => _ShowOffersScreenState();
}

class _ShowOffersScreenState extends State<ShowOffersScreen> {
  late OfferCubit offerCubit;
  OfferModel? offerModel;
  // @override
  // void initState() {
  //   super.initState();
  //   offerCubit = OfferCubit();
  //   offerCubit!.getOffers();
  // }
  //
  // @override
  // void dispose() {
  //   offerCubit!
  //       .close(); // Close the RequestsTeachersCubit when the widget is disposed
  //   super.dispose();
  // }

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
            if(state is DeleteOfferSuccess){
              OfferCubit.get(context).getOffers();
              ErrorSnackBar.show(context, state.message);
            }
            else if(state is DeleteOfferError){
              showAlertDialog(context,state.error);
            }
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state is OfferLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is OfferSuccessState) {
              offerModel = state.offerModel;
              return Column(
                children: [
                  Expanded(
                    child: ConditionalBuilder(
                        condition: state is! OfferLoadingState,
                        fallback: (context) => Center(
                              child: CircularProgressIndicator(),
                            ),
                        builder: (context) {
                          // final modelOffer = OfferCubit.get(context).offerModel;
                          return GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4, // number of columns
                              crossAxisSpacing: 10.0, // spacing between columns
                              mainAxisSpacing: 10.0, // spacing between rows
                            ),
                            itemCount:
                                offerModel?.data?.length, // number of items
                            itemBuilder: (BuildContext context, int index) {
                              final data = offerModel?.data?[index];
                              return BuildItemListView(context, data!);
                            },
                          );
                        }),
                  )
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}

Widget BuildItemListView(BuildContext context, Data data) {
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
                child: (data.image == null||data.image=="")
                    ? Container(
                        color: Colors.blue,
                      )
                    : Image.network(
                        data.image!,
                        fit: BoxFit.cover,
                      )),
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
                IconButton(onPressed: () {
                  OfferCubit.get(context).deleteOffer(data!.id!);
                }, icon: Icon(Icons.delete))
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
