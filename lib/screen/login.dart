// ignore_for_file: library_private_types_in_public_api

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constant/color.dart';
import '../constant/functions.dart';
import '../constant/widget.dart';
import '../service/authHelper.dart';

class _LoginState extends State<Login> {
  TextEditingController emailcon = TextEditingController();
  TextEditingController passcon = TextEditingController();

  AuthHelper authHelper = AuthHelper();

  @override
  Widget build(BuildContext context) {
    //final Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return false;
      },
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [cr_sec, cr_wht]),
          ),
          //padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                CircleAvatar(
                  foregroundImage: const AssetImage('assects/login.jpg'),
                  radius: 80.r,
                ),
                hspace(10.h),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 0.w),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30.r,
                        backgroundColor: Colors.transparent,
                        backgroundImage: const AssetImage('assects/icon.png'),
                      ),
                      Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Turn2Park',
                            style: GoogleFonts.rubik(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.sp,
                                letterSpacing: 2,
                                color: cr_pri),
                          ),
                          hspace(8.h),
                          Text(
                            'Where Every Curb is Your Spot',
                            style: GoogleFonts.rubik(
                              fontWeight: FontWeight.w100,
                              fontSize: 12.sp,
                              color: cr_blk,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                hspace(10.h),
                Padding(
                  padding: EdgeInsets.fromLTRB(5.w, 10.h, 5.w, 20.h),
                  child: InkWell(
                    onTap: () async {
                      //routename(context, '/name');
                      User? user = await authHelper.signInGoogle();
                      if(user!=null){
                        msg(user.uid);
                      }else{
                        msg('Error occured');
                      }/**/
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      shadowColor: cr_sec,
                      color: cr_blk,
                      elevation: 10.h,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 35.r,
                              padding: EdgeInsets.all(5.r),
                              child: const Icon(FontAwesomeIcons.google,
                                  color: cr_pri),
                            ),
                            wspace(10.w),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Continue with Google',
                                    style: TextStyle(
                                      color: cr_wht,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.r,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            wspace(10.w),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}
