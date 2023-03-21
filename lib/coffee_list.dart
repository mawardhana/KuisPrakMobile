import 'package:flutter/material.dart';
import 'package:prakmobile_kuis_123200138/coffee_detail.dart';
import 'package:prakmobile_kuis_123200138/coffee_menu.dart';

class CoffeeList extends StatelessWidget {
  const CoffeeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Data Coffee"),
        ),
        body: ListView.builder(
          itemCount: listCoffee.length,
          itemBuilder: (context, index) {
            final CoffeeMenu coffee = listCoffee[index];
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CoffeeDetail(coffee: coffee),
                  ),
                );
              },
              child: Card(
                child: ListTile(
                  leading: Container(
                    child: Image.network(
                      coffee.imageLink,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  title: Text(
                    coffee.title,
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(coffee.author),
                ),
              ),
            );
          },
        ));
  }
}
