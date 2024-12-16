import 'package:abstractionrealworldexample/viewmodel/product_view_model.dart';
import 'package:abstractionrealworldexample/viewmodel/user_view_model.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart';
import '../models/product_model.dart';

class ApiScreen extends StatefulWidget {
  @override
  _ApiScreenState createState() => _ApiScreenState();
}

class _ApiScreenState extends State<ApiScreen> {
  final UserViewModel _userViewModel = UserViewModel();
  final ProductViewModel _productViewModel = ProductViewModel();
  List<dynamic> _data = [];
  String _title = "Click a button to fetch data";

  void fetchUserData() async {
    List<UserModel> users = await _userViewModel.getUsers();
    setState(() {
      _data = users;
      _title = "User Data";
    });
  }

  void fetchProductData() async {
    List<ProductModel> products = await _productViewModel.getProducts();
    setState(() {
      _data = products;
      _title = "Product Data";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Abstraction with MVVM")),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: fetchUserData,
                child: const Text("Fetch Users"),
              ),
              ElevatedButton(
                onPressed: fetchProductData,
                child: const Text("Fetch Products"),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            _title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _data.length,
              itemBuilder: (context, index) {
                var item = _data[index];
                return Card(
                  child: ListTile(
                    title: Text(
                      item is UserModel
                          ? item.name
                          : (item is ProductModel ? item.title : ""),
                    ),
                    subtitle: Text(
                      item is UserModel
                          ? item.email
                          : (item is ProductModel ? item.body : ""),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
