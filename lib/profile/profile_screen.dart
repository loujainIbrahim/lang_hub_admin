import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lang_hub_admin/core/color.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        backgroundColor: mainColor,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.edit))],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Stack(
            children: [
              Center(
                child: Container(
                  // width: ScreenUtil().setWidth(245),
                  // height: ScreenUtil().setHeight(172),
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjHVjH-y6VIHOEBe8lP4JrDoyT9Cq-hG4KYAp1ngA&s'),
                  ),
                ),
              ),
              Positioned(
                  right: 80,
                  bottom: 0,
                  child: CircleAvatar(
                    backgroundColor: mainColor,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add_a_photo,
                        color: Colors.white,
                      ),
                    ),
                  ))
            ],
          ),
          Text(
            "Altc institute ",
            maxLines: 1,
            style: TextStyle(
                color: Colors.white,
                fontSize: ScreenUtil().setSp(31),
                fontWeight: FontWeight.bold),
          ),
          Text(
            "Baghdad street",
            maxLines: 1,
            style: TextStyle(
                color: Colors.white,
                fontSize: ScreenUtil().setSp(28),
                fontWeight: FontWeight.bold),
          ),
          Container(
            width: ScreenUtil().setWidth(321),

            child: Text(
              "hfjeklelkjds/jskljfi….."
              "ksjflkjslfjklejiojlkdjifjioe"
              "skdjfiejijdlkjiofjekj"
              "jsdkjflkj",
              maxLines: 4,
              style: TextStyle(
                  color: Colors.white, fontSize: ScreenUtil().setSp(25)),
            ),
          ),
          Text(
            "Institute owner:",
            style: TextStyle(
                color: Colors.white,
                fontSize: ScreenUtil().setSp(31),
                fontWeight: FontWeight.bold),
          ),
          Text(
            "abd alkarem fayyad",
            style: TextStyle(
                color: Colors.white,
                fontSize: ScreenUtil().setSp(28),
                fontWeight: FontWeight.bold),
          ),
          Text(
            "+963987644",
            style: TextStyle(
                color: Colors.white,
                fontSize: ScreenUtil().setSp(23),
                fontWeight: FontWeight.bold),
          ),
          Text(
            "abd@gmail.com",
            style: TextStyle(
                color: Colors.white,
                fontSize: ScreenUtil().setSp(23),
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
