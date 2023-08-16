import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lang_hub_admin/home/home_cubit/home_cubit.dart';
import 'package:lang_hub_admin/home/widgets/side_bar_item.dart';
import '../core/color.dart';
import '../profile/profile_screen.dart';
import 'package:collapsible_sidebar/collapsible_sidebar.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Scaffold(
            key: scaffoldKey,
            endDrawer: Drawer(
              child: ProfileScreen(),
            ),
            appBar: AppBar(
              shape: Border(
                  bottom: BorderSide(color: mainColor),
                  top: BorderSide(color: mainColor),
                  right: BorderSide(color: mainColor),
                  left: BorderSide(color: mainColor)),
              elevation: 0,
              leadingWidth: 200,
              backgroundColor: fillColorInTextFormField,
              centerTitle: true,
              leading: Image.asset(
                "assets/images/home_logo.png",
                fit: BoxFit.fill,
              ),
              title: Text(
                cubit.pageTitles[cubit.currentIndex],
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: mainColor),
              ),
              actions: [
                MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileScreen()));
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: 36,
                          height: 36,
                          child: Image.asset("assets/images/profile.png")),
                      Text("your profile",
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 11,
                              color: mainColor))
                    ],
                  ),
                )
              ],
            ),
            body: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Material(
                    elevation: 10,
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    child: Container(
                      decoration: BoxDecoration(
                        color: mainColor,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 5.0,
                              spreadRadius: 1.0,
                              color: Colors.grey.shade400)
                        ],
                      ),
                      child: ListView(
                        children: [
                          SizeBarItem(text: 'students', index: 0),
                          SizeBarItem(text: 'teachers', index: 1),
                          SizeBarItem(text: 'Languages and courses', index: 2),
                          SizeBarItem(text: 'courses activation', index: 3),
                          SizeBarItem(text: 'joining requests', index: 4),
                          SizeBarItem(text: 'offers', index: 5),
                          SizeBarItem(text: 'feedback', index: 6),
                          SizeBarItem(text: "Update time the wait", index: 7),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Container(
                    child: cubit.SideBarScreens[cubit.currentIndex],
                  ),
                )
              ],
            ));
      },
    );
  }
}
