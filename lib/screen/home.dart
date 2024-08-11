// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';
import 'package:turn2park/constant/functions.dart';
import 'package:turn2park/screen/areas.dart';

import '../constant/color.dart';
import '../constant/widget.dart';
import 'package:iconly/iconly.dart';

import '../object/area.dart';

class _HomeState extends State<Home> {
  bool iswl2 = true;
  static bool select = false;

  @override
  void initState() {
    super.initState();
    dialog();
  }

  Future<void> dialog() async {
    await Future.delayed(const Duration(milliseconds: 50));
    if (!select) {
      return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r)),
            child: Row(
              children: [
                Card(
                  elevation: 10.r,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r)),
                  margin:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        iswl2 = true;
                        select = false;
                      });
                      goback(context);
                    },
                    child: SizedBox(
                      width: 70.w,
                      height: 100.h,
                      child: Column(
                        children: [
                          hspace(10.h),
                          CircleAvatar(
                            foregroundImage:
                                const AssetImage('assects/2wheel.jpg'),
                            radius: 30.r,
                          ),
                          hspace(10.h),
                          Text(
                            '2 Wheel',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 10.sp,
                              letterSpacing: 1,
                              color: cr_pri,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  elevation: 10.r,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r)),
                  margin:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        iswl2 = false;
                        select = true;
                      });
                      goback(context);
                    },
                    child: SizedBox(
                      width: 70.w,
                      height: 100.h,
                      child: Column(
                        children: [
                          hspace(10.h),
                          CircleAvatar(
                            foregroundImage:
                                const AssetImage('assects/4wheel.png'),
                            radius: 30.r,
                          ),
                          hspace(10.h),
                          Text(
                            '4 Wheel ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 10.sp,
                              letterSpacing: 1,
                              color: cr_pri,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    }
  }

  List<Area> arealist = [
    Area(
        name: 'Trichy Centeral Bus Stand Parking Lot',
        address:
            'QMWJ+X7C, Chennai Bus Bay, Rockins Rd, Cantonment, Tiruchirappalli, Tamil Nadu 620001',
        lat: 10.7974308,
        lon: 78.6806555,
        dist: 1.2,
        nos: 5,
        nas: 10,
        iurl:
            'https://cf.bstatic.com/xdata/images/hotel/max1024x768/478513499.jpg?k=c1551e3acd3f58592dfe52d1c860598ba556d3d434b4f3fef5b38df7bae817a8&o=&hp=1'),
    Area(
        name: 'Trichy Railway Junction Paid Parking',
        address:
            'QMVP+X7M, Bharathiyar Salai, Sangillyandapuram, Tiruchirappalli, Tamil Nadu 620001',
        lat: 10.7949699,
        lon: 78.6830984,
        dist: 3.4,
        nos: 8,
        nas: 20,
        iurl: 'https://mapio.net/images-p/64517804.jpg'),
    Area(
        name: 'New Car Parking Junction',
        address:
            'QMVP+X7M, Bharathiyar Salai, Sangillyandapuram, Tiruchirappalli, Tamil Nadu 620001',
        lat: 10.7963097,
        lon: 78.6832949,
        dist: 2.5,
        nos: 3,
        nas: 15,
        iurl:
            'https://images.hindustantimes.com/rf/image_size_960x540/HT/p2/2019/07/24/Pictures/assignment-name-in-brief_4130c94a-ae40-11e9-aba3-019dfe82335b.jpg'),
    Area(
        name: 'Anbu Car parking',
        address:
            'RMCJ+H2Q, 80 Feet Rd, West Thillai Nagar, Tennur, Tiruchirappalli, Tamil Nadu 620018',
        lat: 10.8175189,
        lon: 78.6996486,
        dist: 0.8,
        nos: 2,
        nas: 12,
        iurl:
            'https://content3.jdmagicbox.com/comp/tirupur/w5/9999px421.x421.131015104504.i6w5/catalogue/anbu-travels-periyar-colony-tirupur-car-rental-for-outstation-x8qws8wjv3.jpg'),
    Area(
        name: 'Chinthamani Car Parking',
        address:
            'RMVX+Q75, Trichy Chennai Trunk Rd, Srirangam, Mambazhasalai, Tiruchirappalli, Tamil Nadu 620006',
        lat: 10.8443843,
        lon: 78.6956651,
        dist: 4.0,
        nos: 6,
        nas: 25,
        iurl: 'https://gos3.ibcdn.com/9715a6543dcf11ea8cae0242ac110003.jpeg'),
    Area(
        name: 'PLA Residency Car Parking',
        address:
            'Bus stand, Karur Bypass Rd, Killa Chinthamani, Tiruchirappalli, Tamil Nadu 620002',
        lat: 10.8341145,
        lon: 78.690182,
        dist: 1.7,
        nos: 7,
        nas: 30,
        iurl: 'https://gos3.ibcdn.com/b533f406559211e79b260a553a66de59.jpg'),
    Area(
        name: 'Multi Level Car Parking',
        address: 'RMFV+574, Tharanallur, Tiruchirappalli, Tamil Nadu 620008',
        lat: 10.8281808,
        lon: 78.6754891,
        dist: 2.9,
        nos: 4,
        nas: 18,
        iurl:
            'https://images.moneycontrol.com/static-mcnews/2021/06/shutterstock_1227608260-770x433.jpg?impolicy=website&width=770&height=431'),
    Area(
        name: 'Sri Ram Car parking',
        address:
            'RMWX+483, Trunk Road, Srirangam, Mambazhasalai, Tiruchirappalli, Tamil Nadu 620005',
        lat: 10.8452788,
        lon: 78.6957369,
        dist: 3.3,
        nos: 9,
        nas: 22,
        iurl:
            'https://www.samil.in/images/services-images/parking-services-img.jpg'),
    Area(
        name: 'Sahana Car Parking',
        address:
            '240, main road, Sangliandapuram, Sangillyandapuram, Tiruchirappalli, Tamil Nadu 620001',
        lat: 10.7993048,
        lon: 78.7010571,
        dist: 2.0,
        nos: 5,
        nas: 28,
        iurl:
            'https://i0.wp.com/sahanaconventioncentre.in/wp-content/uploads/2017/04/sahanaconventionparkingarea-500x200.jpg'),
    Area(
        name: 'Sarathas car parking',
        address:
            'Tiruchirappalli Town Hall Post office, bus stop, near Teppakulam, Tharanallur, Theppakulam, Tiruchirappalli, Tamil Nadu 620002',
        lat: 10.8260932,
        lon: 78.6906994,
        dist: 5.5,
        nos: 10,
        nas: 35,
        iurl:
            'https://3.imimg.com/data3/BK/VX/MY-10898921/car-parking-service-500x500.jpg'),
    Area(
        name: 'Trichy sarathas car parking',
        address:
            "Saratha's, Trichy, NSB Rd, Singarathope, Theppakulam, Tamil Nadu 620002",
        lat: 10.8263744,
        lon: 78.6930961,
        dist: 0.9,
        nos: 3,
        nas: 14,
        iurl:
            'https://lh5.googleusercontent.com/p/AF1QipM0sDPyuu__hS02dBaHBQuTQt-bB-riGRAoEUcZ=w500-h500-k-no'),
    Area(
        name: 'Vdart car parking',
        address:
            'RM3F+QW5, SBI Officers Colony, Raja Colony, Tiruchirappalli, Tamil Nadu 620001',
        lat: 10.8044029,
        lon: 78.672284,
        dist: 1.8,
        nos: 4,
        nas: 20,
        iurl:
            'https://lh5.googleusercontent.com/p/AF1QipMoE_e7b8rHFk8DM3v9eGjIpG5vOppboD_lAaJK=w426-h240-k-no'),
    Area(
        name: 'Bike Car Parking Chathram Bus Stand',
        address:
            'RMJV+CFJ, Vayalur Bus Bay, Nagapattinam - Coimbatore - Gundlupet Hwy, Theppakulam, Tamil Nadu 620002',
        lat: 10.8310815,
        lon: 78.6761447,
        dist: 4.1,
        nos: 7,
        nas: 27,
        iurl:
            'https://img.indianauto.com/2019/11/25/Gruom402/delhi-metro-car-parking-c1af.jpeg'),
    Area(
        name: 'Church car parking',
        address:
            'QRF2+39H, Mosque Road, BHEL Tiruchy Township, Kailasapuram, Thiruverumbur, Tamil Nadu 620022',
        lat: 10.7726812,
        lon: 78.7834743,
        dist: 3.6,
        nos: 5,
        nas: 23,
        iurl:
            'https://files.yappe.in/place/full/diocese-of-church-of-north-india-7174965.webp'),
    Area(
        name: 'West Temple Parking',
        address:
            'VP33+58F, W Car St, Srirangam, Thiruvanaikoil, Tiruchirappalli, Tamil Nadu 620005',
        lat: 10.8529425,
        lon: 78.5632317,
        dist: 1.1,
        nos: 2,
        nas: 10,
        iurl:
            'https://m.economictimes.com/thumb/msid-61613749,width-1200,height-900,resizemode-4,imgsize-158812/a-startup-that-promises-hassle-free-parking.jpg'),
    Area(
        name: 'M.A.K car parking',
        address:
            'C-41, 10 B Cross Rd, West Thillai Nagar, Thillai Nagar, Tiruchirappalli, Tamil Nadu 620018',
        lat: 10.8167859,
        lon: 78.6779727,
        dist: 3.2,
        nos: 7,
        nas: 19,
        iurl:
            'https://www.hindustantimes.com/ht-img/img/2023/05/29/1600x900/Mumbai--India---January-9--2020--On-street-parking_1685389541567.jpg'),
    Area(
        name: 'Quarters Parking Area',
        address: 'QM5M+CHG, K K Nagar, Tiruchirappalli, Tamil Nadu 620021',
        lat: 10.7585718,
        lon: 78.6813663,
        dist: 2.7,
        nos: 3,
        nas: 13,
        iurl:
            'https://www.entertainmentquarter.com.au/wp-content/uploads/2021/06/EQ_TopLevelCarpark_7.jpg'),
    Area(
        name: 'ANBANANTHAN S PARKING',
        address: '1,Juction, Tiruchirappalli, Tamil Nadu 620007',
        lat: 10.7947612,
        lon: 78.6834965,
        dist: 1.4,
        nos: 4,
        nas: 17,
        iurl:
            'https://englishtribuneimages.blob.core.windows.net/gallary-content/2020/11/Desk/2020_11\$largeimg_1264224870.jpeg'),
    Area(
        name: 'Shri Sangeethas parking',
        address:
            'No. 5, Palaniyappa Complex, Karur Bypass Rd, Melachinthamani, Tiruchirappalli, Tamil Nadu 620002',
        lat: 10.794848,
        lon: 78.6448715,
        dist: 4.8,
        nos: 8,
        nas: 31,
        iurl:
            'https://media-cdn.tripadvisor.com/media/photo-s/12/52/8d/98/shri-sangeetas-trichy.jpg')
  ];

  // https://snowmap.fast-sfc.com/base_snow_map/{z}/{x}/{y}.png
  // https://tile.openstreetmap.org/{z}/{x}/{y}.png

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        drawer: const Draw3r(),
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(child: Text('kkaseki'),width: 300,height: 100,),
            ),
            FlutterMap(
              options: MapOptions(
                center: const LatLng(10.8263744, 78.6930961),
                zoom: 15,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.app',
                ),
                MarkerLayer(
                  markers: arealist.map((area) {
                    return Marker(
                      width: 100,
                      height: 100,
                      point: LatLng(area.lat, area.lon),
                      builder: (ctx) => InkWell(
                        onTap: () {
                          route(
                              context,
                              Areas(
                                area: area,
                                iswl2: iswl2,
                              ));
                        },
                        child: Icon(
                          IconlyBold.location,
                          color: cr_pri,
                          size: 30.sp,
                        ),
                      ),
                    );
                  }).toList(),
                )
              ],
            ),
          ],
        ),
        bottomSheet: Container(
          height: 100.h,
          color: Colors.transparent,
          child: ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: arealist.length,
              itemBuilder: (context, index) {
                Area area = arealist.elementAt(index);
                return InkWell(
                  onTap: () {
                    route(
                        context,
                        Areas(
                          area: area,
                          iswl2: iswl2,
                        ),
                    );
                  },
                  child: Card(
                    elevation: 10.h,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r)),
                    margin: EdgeInsets.symmetric(
                      vertical: 10.h,
                      horizontal: 10.h,
                    ),
                    child: Container(
                      width: 200.w,
                      height: 100.h,
                      alignment: Alignment.center,
                      child: ListTile(
                        isThreeLine: true,
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(5.r),
                          child: CachedNetworkImage(imageUrl: area.iurl,
                            width: 80.w,
                            height: 100.h,
                          ),
                        ),
                        title: Text(
                          area.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10.sp,
                            letterSpacing: 1,
                            color: cr_pri,
                          ),
                        ),
                        subtitle: Text(
                          area.address,
                          style: TextStyle(
                            fontWeight: FontWeight.w100,
                            fontSize: 5.sp,
                            color: cr_blk,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ),
        /*floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: cr_pri,
          elevation: 8,
          focusElevation: 10,
          hoverElevation: 12,
          child: const Icon(
            IconlyBroken.edit,
          ),
        ),

         */
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}
