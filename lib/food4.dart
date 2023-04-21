import 'package:flutter/material.dart';
import 'package:nipp/main.dart';

class food4 extends StatelessWidget {
  const food4({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
      leading: Icon(
          Icons.food_bank,
          color: Colors.white,
        ),
        title: const Text('Food Menu')
        
      ),
      body: Center(
        child: Form(
          child: ListView(
            shrinkWrap: true,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'ซูชิข้าวไรซ์เบอร์รี่',
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'เมนูง่ายๆ อร่อยได้ด้วยสไตน์ญี่ปุ่น ',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Image.asset('images/food4.jpg',
                      width: 600, height: 400, fit: BoxFit.fill),
                  // Image.asset('assets/img/Picture.jpg'),
                  SizedBox(
                    height: 20,
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    '79 \บาท',
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    onPressed: () {
                     Navigator.pop(context,
                     MaterialPageRoute(builder: (context) => const food4()),);
                    },
                    child: const Text('สั่งอาหาร!'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
