// ignore_for_file: camel_case_types, library_private_types_in_public_api, must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:turn2park/constant/color.dart';
import '../constant/widget.dart';

class _WebState extends State<Web> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async {
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
              const Text(
                'Successfully',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
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
            ],
          ),
        ),
      ),
    );
  }
}

class Web extends StatefulWidget {
  @override
  _WebState createState() => _WebState();
}
