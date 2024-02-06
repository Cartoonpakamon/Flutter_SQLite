import 'package:sqlite/database.dart';
import 'package:sqlite/model.dart';
import 'package:flutter/material.dart';

class addForm extends StatefulWidget {
  @override
  State<addForm> createState() => _addFormState();
}

class _addFormState extends State<addForm> {
   appDatabase db = appDatabase();

  final titleControllor = TextEditingController();
  final conversationControllor = TextEditingController();
  final priceControllor = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(94, 4, 136, 37),
        title: Center(
          child: Text(
            'Order Food',
            style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255), fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            child: Column(
              children: [
                Text(
                  'Fill in the food items that you that want to order',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: titleControllor,
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: 'Add Food Name',
                    icon: Icon(Icons.restaurant_menu),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  maxLines: 1,
                  controller: priceControllor,
                  decoration: InputDecoration(
                    hintText: 'Add count',
                    icon: Icon(Icons.payments),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  maxLines: 3,
                  controller: conversationControllor,
                  decoration: InputDecoration(
                    hintText: 'Add More details',
                    icon: Icon(Icons.description),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Map input = {
                      'foodname': titleControllor.text,
                      'price' : priceControllor.text,
                      'descriptionfood' : conversationControllor.text
                      };
                      insert(input);
                      Navigator.pop(context);
                  },
                  child: Text('Post'),
                  
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void insert(Map input) async{
    topicModel data = topicModel(
      foodname: input['foodname'], 
      price: input ['price'],
      descriptionfood: input ['descriptionfood'],
      );
  await db.insertData(data);
  }
}