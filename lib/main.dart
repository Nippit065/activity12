import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:nipp/food1.dart';
import 'food2.dart';
import 'food3.dart';
import 'food4.dart';
import 'package:nipp/mongo_dart.dart';
import 'package:mongo_dart/mongo_dart.dart' as mg;
import 'package:nipp/modelinsert.dart';


void main() async {  
  WidgetsFlutterBinding.ensureInitialized();
  await MongoDatabase.connect();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Healthy Restaurant',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, double> _foodMenu = {
    'fried tofu with healthy': 69,
    'Fried not rice': 69,
    'Kale healthy': 129,
    'Salad roll riceberry': 79,
  };

  Map<String, int> _foodCount = {
    'fried tofu with healthy': 0,
    'Fried not rice': 0,
    'Kale healthy': 0,
    'Salad roll riceberry': 0,
  };

  double _totalPrice = 0;
  
  get collection => null;
  
  get foodName => null;

  void _updateTotalPrice() {
    double total = 0;
    _foodMenu.forEach((key, value) {
      total += _foodCount[key]! * value;
    });
    setState(() {
      _totalPrice = total;
    });
  }

  void _incrementFoodCount(String foodName) {
    setState(() {
      _foodCount.update(foodName, (value) => value + 1, ifAbsent: () => 1);
      _updateTotalPrice();
    });
  }

  void _decrementFoodCount(String foodName) {
    if (_foodCount[foodName]! > 0) {
      setState(() {
        _foodCount.update(foodName, (value) => value - 1, ifAbsent: () => 0);

        _updateTotalPrice();
      });
    }
  }

  // เพิ่มจำนวนอาหาร
  void _addFoodCount(String foodName) {
    setState(() {
      _foodCount[foodName] = (_foodCount[foodName] ?? 0) + 1;
    });
  }

  // ลบจำนวนอาหาร
  void _removeFoodCount(String foodName) {
    setState(() {
      if ((_foodCount[foodName] ?? 0) > 0) {
        _foodCount[foodName] = _foodCount[foodName]! - 1;
      }
    });
  }

  // คำนวณราคาอาหาร
  num calculateTotalPrice() {
    
    num totalPrice = 0;
    _foodCount.forEach((foodName, foodCount) {
      num foodPrice = _foodMenu[foodName] ?? 0;
      totalPrice += foodCount * foodPrice;
      
    });
    return totalPrice;
    
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Healthy Restaurant'),
      ),
      body: Column(
        children: [
Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10.0),
                  height: MediaQuery.of(context).size.height * 0.35,
                  child: Card(
                      color: Colors.brown,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      elevation: 8,
                      child: InkWell(
                        onTap: () {
                          final snackBar = SnackBar(
                            content: const Text('Healty! eating vegetable!'),
                            action: SnackBarAction(
                              label: 'Ok',
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const food1()),
                                );
                              },
                            ),
                          );

                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        child: Container(
                            margin: const EdgeInsets.all(1.0),
                            width: 125.0,
                            height: 70.0,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage('images/food1.jpg'),
                              fit: BoxFit.cover,
                              alignment: Alignment.topCenter,
                            )),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'fried tofu with healthy',
                                  style: TextStyle(
                                    fontSize: 30,
                                    foreground: Paint()
                                      ..style = PaintingStyle.stroke
                                      ..strokeWidth = 3
                                      ..color = Colors.black,
                                  ),
                                ),
                              ],
                            )),
                      )),
                ),
              ),
              Container(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                  height: MediaQuery.of(context).size.height * 0.35,
                  child: Card(
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      elevation: 8,
                      child: InkWell(
                        onTap: () {
                          final snackBar = SnackBar(
                            content: const Text('Fried not rice! Healthy dream!'),
                            action: SnackBarAction(
                              label: 'Ok',
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const food2()),
                                );
                              },
                            ),
                          );

                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        child: Container(
                            margin: const EdgeInsets.all(1.0),
                            width:125.0,
                            height: 70.0,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage('images/food2.jpg'),
                              fit: BoxFit.cover,
                              alignment: Alignment.topCenter,
                            )),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Fried not rice',
                                  style: TextStyle(
                                    fontSize: 30,
                                    foreground: Paint()
                                      ..style = PaintingStyle.stroke
                                      ..strokeWidth = 3
                                      ..color = Colors.black,
                                  ),
                                ),
                              ],
                            )),
                      )),
                ),
              ),
              Container(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                  height: MediaQuery.of(context).size.height * 0.35,
                  child: Card(
                      color: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      elevation: 8,
                      child: InkWell(
                        onTap: () {
                          final snackBar = SnackBar(
                            content: const Text('Kale healthy streaky pork!'),
                            action: SnackBarAction(
                              label: 'Ok',
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const food3()),
                                );
                              },
                            ),
                          );

                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        child: Container(
                            margin: const EdgeInsets.all(1.0),
                            width: 125.0,
                            height: 70.0,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage('images/food3.jpg'),
                              fit: BoxFit.cover,
                              alignment: Alignment.topCenter,
                            )),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Kale healthy',
                                  style: TextStyle(
                                    fontSize: 30,
                                    foreground: Paint()
                                      ..style = PaintingStyle.stroke
                                      ..strokeWidth = 3
                                      ..color = Colors.black,
                                  ),
                                ),
                              ],
                            )),
                      )),
                ),
              ),
              Container(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                  height: MediaQuery.of(context).size.height * 0.35,
                  child: Card(
                      color: Colors.deepPurpleAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      elevation: 8,
                      child: InkWell(
                        onTap: () {
                          final snackBar = SnackBar(
                            content: const Text('Salad roll riceberry! the best is rice.'),
                            action: SnackBarAction(
                              label: 'Ok',
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const food4()),
                                );
                              },
                            ),
                          );

                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        child: Container(
                            margin: const EdgeInsets.all(1.0),
                            width: 125.0,
                            height: 70.0,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage('images/food4.jpg'),
                              fit: BoxFit.cover,
                              alignment: Alignment.topCenter,
                            )),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Salad roll riceberry',
                                  style: TextStyle(
                                    fontSize: 30,
                                    foreground: Paint()
                                      ..style = PaintingStyle.stroke
                                      ..strokeWidth = 3
                                      ..color = Colors.black,
                                  ),
                                ),
                              ],
                            )),
                      )),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              children: _foodMenu.keys.map((foodName) {
                return Builder(builder: (context) {
                  return ListTile(
                    title: Text(foodName),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                _addFoodCount(foodName);
                              },
                              icon: Icon(Icons.add),
                            ),
                            Text('${_foodCount[foodName] ?? 0}'),
                            IconButton(
                              onPressed: () {
                                _removeFoodCount(foodName);
                              },
                              icon: Icon(Icons.remove),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                });
              }).toList(),
            ),
          ),
Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total: ${calculateTotalPrice().toStringAsFixed(2)} \฿ ',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              
              ElevatedButton(
                onPressed: () async {
                  final order = {
    'foodName': foodName,
    'foodCount': _foodCount[foodName],
    'totalPrice': calculateTotalPrice(),
};
await collection.insert(order);
                  setState(() {
                    _foodCount.clear();
                    _totalPrice = 0;
                  });
                },
                child: Text('Clear All'),
              ),
            ],
          ),



          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Bill',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            ListView(
                              shrinkWrap: true,
                              children: _foodCount.keys.map((foodName) {
                                int foodCount = _foodCount[foodName]!;
                                num foodPrice = _foodMenu[foodName] ?? 0;
                                return ListTile(
                                  title: Text(foodName),
                                  trailing: Text(
                                    '${foodCount} x ${foodPrice} = ${(foodCount * foodPrice).toStringAsFixed(2)}',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                );
                              }).toList(),
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Total: ${calculateTotalPrice().toStringAsFixed(2)}',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 16),
                           ElevatedButton(
                              onPressed: () async {
                                try {
                                  await MongoDatabase
                                      .connect(); // connect to the database
                                  var userCollection =
                                      MongoDatabase.userCollection;
                                  mg.WriteResult result =
                                      await userCollection.insertOne({
                                    'foods': _foodCount.keys.toList(),
                                    'quantities': _foodCount.values.toList(),
                                    'totalPrice': calculateTotalPrice()
                                  });
                                  log(result.code.toString());
                                  print('Insert success. ID: ${result.id}');
                                  setState(() {
                                    _foodCount.clear();
                                    _totalPrice = 0;
                                  });
                                  Navigator.pop(context);
                                } catch (e) {
                                  log(e.toString());
                                }
                              },
                              child: Text('Pay'),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: 
                Text('Pay'),
              ),
            ],
          ),

          
        ],
      ),
    );
  }
}