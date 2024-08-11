// ignore_for_file: camel_case_types, library_private_types_in_public_api, must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:turn2park/constant/color.dart';
import '../constant/functions.dart';
import '../constant/widget.dart';
import '../object/area.dart';

class _BookingState extends State<Booking> {
  TimeOfDay frtime = TimeOfDay.now(), totime = TimeOfDay.now();

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
          child: Column(
            children: [
              Image.network(area.iurl),
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
                    ),
                ),
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
              Container(
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
                          'Total: ${area.nos}',
                          style: const TextStyle(
                              color: cr_blk, fontWeight: FontWeight.bold),
                        ),
                        backgroundColor: cr_sec,
                      ),
                      wspace(10.w),
                      Chip(
                        label: Text(
                          'Available: ${area.nas}',
                          style: const TextStyle(
                              color: cr_blk, fontWeight: FontWeight.bold),
                        ),
                        backgroundColor: cr_sec,
                      )
                    ],
                  ),
                ),
              ),
              const Spacer(),
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
              Column(
                children: [
                  /*Text(
                    'From',
                    style: TextStyle(
                        color: cr_blk,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold),
                  ),*/
                  hspace(5.h),
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
                                primary: cr_pri, // <-- SEE HERE
                                onPrimary: Colors.redAccent, // <-- SEE HERE
                                onSurface: cr_blk, // <-- SEE HERE
                              ),
                              textButtonTheme: TextButtonThemeData(
                                style: TextButton.styleFrom(
                                  //primary: cr_pri, // button text color
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
                  hspace(5.h),
                  Text(
                    'To',
                    style: TextStyle(
                        color: cr_blk,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  hspace(5.h),
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
                                  //primary: cr_pri, // button text color
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
              const Spacer(),
              InkWell(
                onTap: () async {
                  inmsg('proceed');
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
                            'Proceed',
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
    );
  }
}

class Booking extends StatefulWidget {
  Booking({Key? key, required this.area, required this.iswl2,required this.frtime,required this.totime}) : super(key: key);
  Area area;
  bool iswl2;
  TimeOfDay frtime,totime;

  @override
  _BookingState createState() => _BookingState();
}
