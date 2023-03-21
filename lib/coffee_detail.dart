import 'package:flutter/material.dart';
import 'package:prakmobile_kuis_123200138/coffee_list.dart';
import 'package:url_launcher/url_launcher.dart';

class CoffeeDetail extends StatefulWidget {
  final DataCoffee coffee;
  const CoffeeDetail({Key? key, required this.coffee}) : super(key: key);

  @override
  State<CoffeeDetail> createState() => _CoffeeDetailState();
}

class _CoffeeDetailState extends State<CoffeeeDetail> {
  String status = "";
  String text = "";
  bool isAvailable = true;

  void _status() {
    setState(() {
      widget.coffee.isAvailable = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.coffee.isAvailable) {
      status = "Tersedia";
    } else {
      status = "Tidak Tersedia";
      isAvailable = false;
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.coffee.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: _launchURL,
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          Container(child: Center(child: Image.network(widget.coffee.imageLink))),
          SizedBox(height: 20),
          Row(
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nama",
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      "Deskripsi",
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      "Harga",
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      "Ingredients",
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      "Nutrition",
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      " Review",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(": " + widget.coffee.nama,
                            style: TextStyle(fontSize: 16)),
                        Text(": " + widget.coffee.deskripsi,
                            style: TextStyle(fontSize: 16)),
                        Text(": " + widget.coffee.harga,
                            style: TextStyle(fontSize: 16)),
                        Text(": " + widget.coffee.Ingredients,
                            style: TextStyle(fontSize: 16)),
                        Text(": " + (widget.coffee.Nutrition).toString(),
                            style: TextStyle(fontSize: 16)),
                        Text(": " + (widget.coffee.Review).toString(),
                            style: TextStyle(fontSize: 16)),
                        Text(": " + status,
                            style: TextStyle(
                                color: (isAvailable) ? Colors.green : Colors.red,
                                fontSize: 16))
                      ])),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: (isAvailable)
                ? () {
              text = "Membeli Kopi";
              _status();
              SnackBar snackBar = SnackBar(
                  content: Text(text), backgroundColor: Colors.green);
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
                : null,
            child: Text("Pilih Kopi"),
          ),
        ],
      ),
    );
  }

  _launchURL() async {
    Uri uri = Uri.parse(widget.coffee.link);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }
}
