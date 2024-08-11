// ignore_for_file: camel_case_types, constant_identifier_names

const String col_id = 'id';
const String col_name = 'name';
const String col_address = 'address';
const String col_lat = 'latitude';
const String col_lon = 'longitude';
const String col_dist = 'distance';
const String col_nos = 'nos';
const String col_nas = 'nas';
const String col_iurl = 'imageurl';

/*name
address
lat
lon
dist
nos
nas*/

class Area{

  int? id;
  int nos,nas;
  double lat,lon,dist;
  String name,address,iurl;

  Area({
    this.id,
    required this.name,
    required this.address,
    required this.lat,
    required this.lon,
    required this.dist,
    required this.nos,
    required this.nas,
    required this.iurl,
  });

  factory Area.fromMap(Map<String, dynamic> map) =>  Area(
    id : map[col_id],
    name : map[col_name],
    address : map[col_address],
    lat : map[col_lat],
    lon : map[col_lon],
    dist : map[col_dist],
    nos : map[col_nos],
    nas : map[col_nas],
    iurl : map[col_iurl],
  );

  Map<String, dynamic> toMap() {
    return {
      col_id: id,
      col_name: name,
      col_address: address,
      col_lat: lat,
      col_lon: lon,
      col_dist: dist,
      col_nos: nos,
      col_nas: nas,
      col_iurl: iurl,
    };
  }
}

/*[
{
"name": "Trichy Centeral Bus Stand Parking Lot",
"address": "QMWJ+X7C, Chennai Bus Bay, Rockins Rd, Cantonment, Tiruchirappalli, Tamil Nadu 620001",
"lat": 42.12345,
"lon": -71.67890,
"dist": 1.2,
"nos": 5,
"nas": 10,
"iurl": "https://example.com/park_a.jpg"
},
{
"name": "Trichy Railway Junction Paid Parking",
"address": "QMVP+X7M, Bharathiyar Salai, Sangillyandapuram, Tiruchirappalli, Tamil Nadu 620001",
"lat": 42.34567,
"lon": -71.23456,
"dist": 3.4,
"nos": 8,
"nas": 20,
"iurl": "https://example.com/restaurant_b.jpg"
},
{
"name": "New Car Parking Junction",
"address": "QMVP+X7M, Bharathiyar Salai, Sangillyandapuram, Tiruchirappalli, Tamil Nadu 620001",
"lat": 42.56789,
"lon": -71.78901,
"dist": 2.5,
"nos": 3,
"nas": 15,
"iurl": "https://example.com/gym_c.jpg"
},
{
"name": "Anbu Car parking",
"address": "RMCJ+H2Q, 80 Feet Rd, West Thillai Nagar, Tennur, Tiruchirappalli, Tamil Nadu 620018",
"lat": 42.67890,
"lon": -71.12345,
"dist": 0.8,
"nos": 2,
"nas": 12,
"iurl": "https://example.com/coffee_shop_d.jpg"
},
{
"name": "Chinthamani car Parking",
"address": "RMVX+Q75, Trichy Chennai Trunk Rd, Srirangam, Mambazhasalai, Tiruchirappalli, Tamil Nadu 620006",
"lat": 42.89012,
"lon": -71.45678,
"dist": 4.0,
"nos": 6,
"nas": 25,
"iurl": "https://example.com/museum_e.jpg"
},
{
"name": "PLA Residency Car Parking",
"address": "Bus stand, Karur Bypass Rd, Killa Chinthamani, Tiruchirappalli, Tamil Nadu 620002",
"lat": 42.98765,
"lon": -71.67890,
"dist": 1.7,
"nos": 7,
"nas": 30,
"iurl": "https://example.com/supermarket_f.jpg"
},
{
"name": "Multi Level Car Parking",
"address": "RMFV+574, Tharanallur, Tiruchirappalli, Tamil Nadu 620008",
"lat": 42.34567,
"lon": -71.23456,
"dist": 2.9,
"nos": 4,
"nas": 18,
"iurl": "https://example.com/library_g.jpg"
},
{
"name": "Sri Ram Car parking 1",
"address": "RMWX+483, Trunk Road, Srirangam, Mambazhasalai, Tiruchirappalli, Tamil Nadu 620005",
"lat": 42.56789,
"lon": -71.78901,
"dist": 3.3,
"nos": 9,
"nas": 22,
"iurl": "https://example.com/movie_theater_h.jpg"
},
{
"name": "Sahana Car Parking",
"address": "240, main road, Sangliandapuram, Sangillyandapuram, Tiruchirappalli, Tamil Nadu 620001",
"lat": 42.67890,
"lon": -71.12345,
"dist": 2.0,
"nos": 5,
"nas": 28,
"iurl": "https://example.com/shopping_mall_i.jpg"
},
{
"name": "Sarathas car parking",
"address": "Tiruchirappalli Town Hall Post office, bus stop, near Teppakulam, Tharanallur, Theppakulam, Tiruchirappalli, Tamil Nadu 620002",
"lat": 42.89012,
"lon": -71.45678,
"dist": 5.5,
"nos": 10,
"nas": 35,
"iurl": "https://example.com/beach_j.jpg"
},
{
"name": "Trichy sarathas car parking",
"address": "Saratha's, Trichy, NSB Rd, Singarathope, Theppakulam, Tamil Nadu 620002",
"lat": 42.98765,
"lon": -71.67890,
"dist": 0.9,
"nos": 3,
"nas": 14,
"iurl": "https://example.com/park_k.jpg"
},
{
"name": "Vdart car parking",
"address": "RM3F+QW5, SBI Officers Colony, Raja Colony, Tiruchirappalli, Tamil Nadu 620001",
"lat": 42.34567,
"lon": -71.23456,
"dist": 1.8,
"nos": 4,
"nas": 20,
"iurl": "https://example.com/cafe_l.jpg"
},
{
"name": "Bike Car Parking Chathram Bus Stand",
"address": "RMJV+CFJ, Vayalur Bus Bay, Nagapattinam - Coimbatore - Gundlupet Hwy, Theppakulam, Tamil Nadu 620002",
"lat": 42.56789,
"lon": -71.78901,
"dist": 4.1,
"nos": 7,
"nas": 27,
"iurl": "https://example.com/golf_course_m.jpg"
},
{
"name": "trichy Railway Junction paid parking",
"address": "QMVP+X7M, Bharathiyar Salai, Sangillyandapuram, Tiruchirappalli, Tamil Nadu 620001",
"lat": 42.67890,
"lon": -71.12345,
"dist": 2.3,
"nos": 6,
"nas": 16,
"iurl": "https://example.com/spa_n.jpg"
},
{
"name": "Church car parking",
"address": "QRF2+39H, Mosque Road, BHEL Tiruchy Township, Kailasapuram, Thiruverumbur, Tamil Nadu 620022",
"lat": 42.89012,
"lon": -71.45678,
"dist": 3.6,
"nos": 5,
"nas": 23,
"iurl": "https://example.com/art_gallery_o.jpg"
},
{
"name": "West Temple Parking",
"address": "VP33+58F, W Car St, Srirangam, Thiruvanaikoil, Tiruchirappalli, Tamil Nadu 620005",
"lat": 42.98765,
"lon": -71.67890,
"dist": 1.1,
"nos": 2,
"nas": 10,
"iurl": "https://example.com/playground_p.jpg"
},
{
"name": "M.A.K car parking",
"address": "C-41, 10 B Cross Rd, West Thillai Nagar, Thillai Nagar, Tiruchirappalli, Tamil Nadu 620018",
"lat": 42.34567,
"lon": -71.23456,
"dist": 3.2,
"nos": 7,
"nas": 19,
"iurl": "https://example.com/zoo_q.jpg"
},
{
"name": "Quarters Parking Area",
"address": "QM5M+CHG, K K Nagar, Tiruchirappalli, Tamil Nadu 620021",
"lat": 42.56789,
"lon": -71.78901,
"dist": 2.7,
"nos": 3,
"nas": 13,
"iurl": "https://example.com/bookstore_r.jpg"
},
{
"name": "ANBANANTHAN S PARKING",
"address": "1,Juction, Tiruchirappalli, Tamil Nadu 620007",
"lat": 42.67890,
"lon": -71.12345,
"dist": 1.4,
"nos": 4,
"nas": 17,
"iurl": "https://example.com/skating_rink_s.jpg"
},
{
"name": "Shri Sangeethas parking",
"address": "No. 5, Palaniyappa Complex, Karur Bypass Rd, Melachinthamani, Tiruchirappalli, Tamil Nadu 620002",
"lat": 42.89012,
"lon": -71.45678,
"dist": 4.8,
"nos": 8,
"nas": 31,
"iurl": "https://example.com/botanical_garden_t.jpg"
}
]*/
