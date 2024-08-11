// ignore_for_file: camel_case_types, library_private_types_in_public_api, must_be_immutable

import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:turn2park/constant/color.dart';
import 'package:turn2park/screen/booking.dart';
import 'package:turn2park/screen/suc.dart';
import '../constant/functions.dart';
import '../constant/widget.dart';
import '../object/area.dart';

class _AreasState extends State<Areas> {
  TimeOfDay frtime = TimeOfDay.now(), totime = TimeOfDay.now();
  TextEditingController nocon =TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Area area = widget.area;

    return WillPopScope(
      onWillPop: () async {
        routename(context, '/home');
        return true;
      },
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                cr_sec,
                cr_wht,
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CachedNetworkImage(imageUrl :area.iurl),
                hspace(10.h),
                ListTile(
                  leading: IconButton(
                      onPressed: () {
                        goback(context);
                      },
                      icon: Icon(
                        IconlyBold.arrow_left_2,
                        color: cr_blk,
                        size: 20.sp,
                      )),
                  title: Text(
                    area.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp,
                      letterSpacing: 1,
                      color: cr_pri,
                    ),
                  ),
                  subtitle: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.h),
                    child: Text(
                      area.address,
                      style: TextStyle(
                        fontWeight: FontWeight.w100,
                        fontSize: 8.sp,
                        color: cr_blk,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                  child: SingleChildScrollView(
                    child: Row(
                      children: [
                        wspace(10.w),
                        Chip(
                          label: Text(
                            widget.iswl2 ? '2 Wheel' : '4 Wheel',
                            style: const TextStyle(
                                color: cr_blk, fontWeight: FontWeight.bold),
                          ),
                          backgroundColor: cr_sec,
                        ),
                        wspace(10.w),
                        Chip(
                          label: Text(
                            'Total: ${area.nas}',
                            style: const TextStyle(
                                color: cr_blk, fontWeight: FontWeight.bold),
                          ),
                          backgroundColor: cr_sec,
                        ),
                        wspace(10.w),
                        Chip(
                          label: Text(
                            'Available: ${area.nos}',
                            style: const TextStyle(
                                color: cr_blk, fontWeight: FontWeight.bold),
                          ),
                          backgroundColor: cr_sec,
                        )
                      ],
                    ),
                  ),
                ),
                hspace(10.h),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 10.w),
                  child:  Text(
                    'Time Slot',
                    style: TextStyle(
                        color: cr_blk, fontWeight: FontWeight.bold,fontSize: 12.sp),
                  ),
                ),
                hspace(10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /*Text(
                      'From',
                      style: TextStyle(
                          color: cr_blk,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold),
                    ),*/
                    wspace(5.w),
                    InkWell(
                      onTap: () async {
                        frtime = (await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay(
                            hour: DateTime.now().hour,
                            minute: DateTime.now().minute,
                          ),
                          builder: (context, child) {
                            return Theme(
                              data: Theme.of(context).copyWith(
                                colorScheme: const ColorScheme.light(
                                  primary: cr_pri,
                                  onPrimary: Colors.redAccent,
                                  onSurface: cr_blk,
                                ),
                                textButtonTheme: TextButtonThemeData(
                                  style: TextButton.styleFrom(
                                    foregroundColor: cr_pri,
                                  ),
                                ),
                              ),
                              child: child!,
                            );
                          },
                        ))!;
                        setState(() {});
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: cr_sec,
                            borderRadius: BorderRadius.circular(5.r)),
                        padding: EdgeInsets.symmetric(
                            vertical: 5.w, horizontal: 5.h),
                        child: Text(
                          '${frtime.hour}:${frtime.minute} ${frtime.period.name.toUpperCase()}',
                          style: TextStyle(
                            color: cr_pri,
                            fontWeight: FontWeight.bold,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                    ),
                    wspace(5.w),
                    Text(
                      'To',
                      style: TextStyle(
                          color: cr_blk,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    wspace(5.w),
                    InkWell(
                      onTap: () async {
                        totime = (await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay(
                            hour: DateTime.now().hour,
                            minute: DateTime.now().minute,
                          ),
                          builder: (context, child) {
                            return Theme(
                              data: Theme.of(context).copyWith(
                                colorScheme: const ColorScheme.light(
                                  primary: cr_pri,
                                  onPrimary: Colors.redAccent,
                                  onSurface: cr_blk,
                                ),
                                textButtonTheme: TextButtonThemeData(
                                  style: TextButton.styleFrom(
                                    foregroundColor: cr_pri, // button text color
                                  ),
                                ),
                              ),
                              child: child!,
                            );
                          },
                        ))!;
                        setState(() {});
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: cr_sec,
                            borderRadius: BorderRadius.circular(5.r)),
                        padding: EdgeInsets.symmetric(
                            vertical: 5.w, horizontal: 5.h),
                        child: Text(
                          '${totime.hour}:${totime.minute} ${totime.period.name.toUpperCase()}',
                          style: TextStyle(
                            color: cr_pri,
                            fontWeight: FontWeight.bold,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                hspace(10.h),
                Textbox(controller: nocon, texttype: TextInputType.text, hint: 'License Number', err: false),
                hspace(10.h),

                hspace(10.h),
                InkWell(
                  onTap: () async {
                    route(context, Suc(area: widget.area, iswl2: widget.iswl2,frtime: frtime,totime: totime,));
                    msg('Slot booked');
                    //goback(context);
                  },
                  child: Row(
                    children: [
                      wspace(10.w),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              color: cr_pri,
                              borderRadius: BorderRadius.circular(5.r)),
                          padding: EdgeInsets.symmetric(vertical: 5.w),
                          child: Center(
                            child: Text(
                              'Book for parking ₹${25}',
                              style: TextStyle(
                                color: cr_wht,
                                fontWeight: FontWeight.bold,
                                fontSize: 13.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                      wspace(10.w),
                    ],
                  ),
                ),
                hspace(5.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Areas extends StatefulWidget {
  Areas({Key? key, required this.area, required this.iswl2}) : super(key: key);
  Area area;
  bool iswl2;

  @override
  _AreasState createState() => _AreasState();
}
