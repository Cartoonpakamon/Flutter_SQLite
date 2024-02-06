import 'package:sqlite/addform.dart';
import 'package:flutter/material.dart';
import 'package:sqlite/database.dart';
import 'package:sqlite/model.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(
    ),
  ));
}

appDatabase db = appDatabase();

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int screenIndex = 0;

  final mobileScreens = [
    home(),
    search(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  backgroundColor: Color.fromARGB(255, 255, 255, 255),
  title: Row(
    children: [
      Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: CircleAvatar(
          backgroundImage: AssetImage("assets/images/people.jpg"),radius: 20,
        ),
      ),
      Text(
        "Hi,Jimmy!!",
        style: TextStyle(color: const Color.fromARGB(255, 3, 3, 3), fontWeight: FontWeight.bold,fontSize: 20),

      ),
    ],
  ),
  actions: [
    Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: CircleAvatar(
  backgroundColor: Color.fromARGB(255, 89, 116, 90),
  radius: 20, // ขนาดของวงกลม
  child: Icon(
    Icons.location_on,
    color: Colors.white,
    size: 25,
  ),
),
    ),
  ],
),
      body: mobileScreens[screenIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
              screenIndex = 1; 
            });
          Navigator.push(
            context, MaterialPageRoute(builder: ((context) => addForm())))
            .then((_) {
              setState(() {
              screenIndex = 0; // จะกลับไปแทนค่าข้างบน ***
            });
            });
        }, 
        child: Icon(
          Icons.shopping_cart,
          color: Colors.white,
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          backgroundColor: Color.fromARGB(255, 172, 135, 114),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //------ bottomNavigationBar ------
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 89, 116, 90),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    //------ กำหนดค่า Index เมื่อมีการคลิก ------
                    screenIndex = 0;
                  });
                },
                icon: Icon(
                  Icons.home,
                  //------ ถ้า Index = 0 ให้ไอคอนสีเหลือง ถ้าไม่ใช้ไอคอนสีขาว ------
                  color: screenIndex == 0
                      ? Color.fromRGBO(238, 224, 201, 1)
                      : Colors.white,
                  // color: Colors.white,
                )),
            IconButton(
                onPressed: () {
                  setState(() {
                    screenIndex = 1;
                  });
                },
                icon: Icon(
                  Icons.search,
                  color: screenIndex == 1
                      ? Color.fromRGBO(238, 224, 201, 1)
                      : Colors.white,
                  // color: Colors.white,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.widgets,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.person,
                  color: Colors.white,
                )),
          ],
        ),
      ),
    );
  }
}

//------------- Home page -------------
class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      
      Column(
        children: [
          Text(
        " Food type",
        style: TextStyle(color: const Color.fromARGB(255, 3, 3, 3), fontWeight: FontWeight.bold,fontSize: 30),
        ),SizedBox(width: 50),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                Row(
                  children: [
                    SizedBox(width: 10),
                    CircleAvatar(backgroundImage: AssetImage("assets/images/pizza.jpg"),radius: 30,),//1
                    CircleAvatar(backgroundImage: AssetImage("assets/images/Frenchfries.jpg"),radius: 30,),//2
                    CircleAvatar(backgroundImage: AssetImage("assets/images/drink.jpg"),radius: 30,),//3
                    CircleAvatar(backgroundImage: AssetImage("assets/images/chicken.jpg"),radius: 30,),//4
                    CircleAvatar(backgroundImage: AssetImage("assets/images/hamberger.jpg"),radius: 30,),//5
                    CircleAvatar(backgroundImage: AssetImage("assets/images/moo.jpg"),radius: 30,),//6
                
                  ],
                ),
                    // Container แรก
                    Row(
                      children: [
                        Container(
                                margin: EdgeInsets.all(30),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5), // สีเงา
                                      spreadRadius: 5, // การกระจายของเงา
                                      blurRadius: 7, // ความพองตัวของเงา
                                      offset: Offset(0, 3), // เวกเตอร์ของเงา
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Stack(
                                    children: [
                                      // รูปภาพ
                                      Image.asset(
                                        "assets/images/kaijew.jpg",
                                        fit: BoxFit.cover,
                                        width: 150,
                                        height: 150,
                                      ),
                                      // ข้อความ
                                      Positioned(
                                        bottom: 0,
                                        left: 0,
                                        right: 0,
                                        child: Container(
                                          color: Colors.black.withOpacity(0.5),
                                          padding: EdgeInsets.all(8),
                                          child: Text(
                        "ไข่เจียว \n30 บาท",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                        // Container ที่สอง
                                          Container(
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5), // สีเงา
                                      spreadRadius: 5, // การกระจายของเงา
                                      blurRadius: 7, // ความพองตัวของเงา
                                      offset: Offset(0, 3), // เวกเตอร์ของเงา
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Stack(
                                    children: [
                                      // รูปภาพ
                                      Image.asset(
                                        "assets/images/kawpad.jpg",
                                        fit: BoxFit.cover,
                                        width: 150,
                                        height: 150,
                                      ),
                                      // ข้อความ
                                      Positioned(
                                        bottom: 0,
                                        left: 0,
                                        right: 0,
                                        child: Container(
                                          color: Colors.black.withOpacity(0.5),
                                          padding: EdgeInsets.all(8),
                                          child: Text(
                        "ข้าวผัดกุ้ง \n40 บาท",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                                margin: EdgeInsets.all(30),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5), // สีเงา
                                      spreadRadius: 5, // การกระจายของเงา
                                      blurRadius: 7, // ความพองตัวของเงา
                                      offset: Offset(0, 3), // เวกเตอร์ของเงา
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Stack(
                                    children: [
                                      // รูปภาพ
                                      Image.asset(
                                        "assets/images/suki.jpg",
                                        fit: BoxFit.cover,
                                        width: 150,
                                        height: 150,
                                      ),
                                      // ข้อความ
                                      Positioned(
                                        bottom: 0,
                                        left: 0,
                                        right: 0,
                                        child: Container(
                                          color: Colors.black.withOpacity(0.5),
                                          padding: EdgeInsets.all(8),
                                          child: Text(
                        "สุกี้น้ำ \n40 บาท",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                        // Container ที่สอง
                                          Container(
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5), // สีเงา
                                      spreadRadius: 5, // การกระจายของเงา
                                      blurRadius: 7, // ความพองตัวของเงา
                                      offset: Offset(0, 3), // เวกเตอร์ของเงา
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Stack(
                                    children: [
                                      // รูปภาพ
                                      Image.asset(
                                        "assets/images/kawpalka.jpg",
                                        fit: BoxFit.cover,
                                        width: 150,
                                        height: 150,
                                      ),
                                      // ข้อความ
                                      Positioned(
                                        bottom: 0,
                                        left: 0,
                                        right: 0,
                                        child: Container(
                                          color: Colors.black.withOpacity(0.5),
                                          padding: EdgeInsets.all(8),
                                          child: Text(
                        "ข้าวปลาแกะ \n40 บาท",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                      ],
                    ),
                    Container(
  width: 350, // กำหนดความกว้าง
  height: 40, // กำหนดความสูง
  color: const Color.fromARGB(255, 172, 135, 114), // กำหนดสีพื้นหลัง
  margin: EdgeInsets.all(10), // กำหนดขอบของ Container
  padding: EdgeInsets.all(10), // กำหนดระยะห่างภายใน Container
  child: Row(
    children: [
      Icon(Icons.sell, color: Colors.white), // ไอคอน
      SizedBox(width: 10), // ระยะห่างระหว่างไอคอนและข้อความ
      Text(
        'You have 12 valid coupons',
        style: TextStyle(
          color: Colors.white, // กำหนดสีข้อความ
          fontSize: 18, // กำหนดขนาดตัวอักษร
        ),
      ), // เพิ่มเนื้อหาภายใน Container
    ],
  ),
),
            ],
          ),
        ],
      ),
    );
  }
}
      
class search extends StatelessWidget {
  const search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<topicModel>>(
          future: db.getAllData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: ((context, index) {
                  topicModel topic = snapshot.data![index];
                  return GestureDetector(
                    onTap: () {},
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey[300],
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                      title: Text('${topic.foodname}'),
                      subtitle: Container(
                          alignment: Alignment.topLeft,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text('${topic.price}'),
                              Text('${topic.descriptionfood}'),
                            ],
                          )
                          ),
                      trailing: Container(
                        width: 70,
                        child: Row(
                          children: [
                            Expanded(
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.edit,
                                    color: Colors.green,
                                  )),
                            ),
                            SizedBox(width: 15),
                            Expanded(
                                child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    )))
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              );
            } else {
              return Text('No data');
            }
          }),
    );
  }
}
