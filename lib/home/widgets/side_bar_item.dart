import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lang_hub_admin/home/home_cubit/home_cubit.dart';

import '../../core/color.dart';

Widget SizeBarItem({required String text, required int index}) {
  return BlocBuilder<HomeCubit, HomeState>(
    builder: (context, state) {
      var cubit = HomeCubit.get(context);
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              color: cubit.currentIndex == index ? ff5C3A81 : mainColor,
              border: Border(
                bottom: BorderSide(
                  color: Colors.white,
                  width: 0.6,
                ),
              ),
            ),
            child: ListTile(
              title: Text(
                text,
                style: TextStyle(color: Colors.white),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
              onTap: () {
                cubit.changeSideBar(index);
              },
            ),
          ),
        ],
      );
    },
  );
}
