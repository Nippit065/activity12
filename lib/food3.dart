import 'package:flutter/material.dart';
import 'package:nipp/main.dart';

class food3 extends StatelessWidget {
  const food3({super.key});
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
                    'จับฉ่ายผักเคล',
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'อร่อยง่ายกลมกล่อม มีโภชนาการครบถ้วน ',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Image.asset('images/food3.jpg',
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
                    '129 \บาท',
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    onPressed: () {
                     Navigator.pop(context,
                     MaterialPageRoute(builder: (context) => const food3()),);
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
