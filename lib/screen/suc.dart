// ignore_for_file: camel_case_types, library_private_types_in_public_api, must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:turn2park/constant/color.dart';
import '../constant/functions.dart';
import '../constant/widget.dart';
import '../object/area.dart';

class _SucState extends State<Suc> {
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              const Text(
                'Successfully',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const Text(
                'Booked !',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              const Spacer(),
              CircleAvatar(
                minRadius: 80.r,
                backgroundColor: cr_blk,
                child: Icon(
                  CupertinoIcons.checkmark_alt,
                  color: cr_wht,
                  size: 50.r,
                ),
              ),
              hspace(20.h),
              Container(
                alignment: Alignment.center,
                child:
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Your Time Slot is: ',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      hspace(5.h),
                      Text(
                        '${frtime.hour}:${frtime.minute} ${frtime.period.name} to ${totime.hour+1}:${totime.minute} ${totime.period.name} ',
                        style:  TextStyle(
                          fontSize: 16.sp,
                        ),
                      ),
                      hspace(5.h),
                      Text(
                        '@',
                        style:  TextStyle(
                          fontSize: 16.sp,
                        ),
                      ),
                      hspace(5.h),
                      Text(
                        '${area.name}',
                        style:  TextStyle(
                          fontSize: 10.sp,
                        ),
                      ),
                      hspace(5.h),
                    ],
                ),
              ),
              const Spacer(),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class Suc extends StatefulWidget {
  Suc({Key? key, required this.area, required this.iswl2,required this.frtime,required this.totime}) : super(key: key);
  Area area;
  bool iswl2;
  TimeOfDay frtime,totime;

  @override
  _SucState createState() => _SucState();
}
