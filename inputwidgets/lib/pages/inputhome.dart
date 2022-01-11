import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inputwidgets/models/drink.dart';
import 'package:inputwidgets/models/food.dart';

class Inputwidgets extends StatefulWidget {
  const Inputwidgets({Key? key}) : super(key: key);

  @override
  _InputwidgetsState createState() => _InputwidgetsState();
}

class _InputwidgetsState extends State<Inputwidgets> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _username = TextEditingController();
  TextEditingController _pasw = TextEditingController();

  String? groupfood;
  List<Food>? foods;

  List checkDrink = [];
  List<Drink>? drinks;
//DD
  List<ListItem>? types = ListItem.getItem();
  late List<DropdownMenuItem<ListItem>> _dropdownMenuItem;
  late ListItem _selectedTypeItem;

//
  @override
  void initState() {
    super.initState();
    foods = Food.getFood();
    drinks = Drink.getDrink();
    _dropdownMenuItem = createDropdownMenuItem(types!);
    _selectedTypeItem = _dropdownMenuItem[0].value!;

    // print(foods![0].thname);
  }

  List<DropdownMenuItem<ListItem>> createDropdownMenuItem(
      List<ListItem> types) {
    List<DropdownMenuItem<ListItem>> items = [];

    for (var item in types) {
      items.add(DropdownMenuItem(
        child: Text(item.name!),
        value: item,
      ));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Input Widgets')),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            textfield(),
            // Text(_username.text),
            textfieldpasw(),
            const SizedBox(height: 16),
            DropdownButton(
              items: _dropdownMenuItem,
              value: _selectedTypeItem,
              onChanged: (ListItem? value) {
                setState(() {
                  _selectedTypeItem = value!;
                });
              },
            ),
            Text('Dropdown selected: ${_selectedTypeItem.value}'),
            Column(
              children: createRadioFood(),
            ),
            Text(groupfood.toString()),
            // Center(child: Text('Radio Selected: $groupfood')),
            Column(
              children: createCheckboxDrink(),
            ),
            submitBT(),
          ],
        ),
      ),
    );
  }

  Widget submitBT() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(150, 5, 150, 5),
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            print(_username.text);
          }
        },
        child: Text('Submit'),
      ),
    );
  }

  Widget textfield() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
      child: TextFormField(
        controller: _username,
        validator: (vaLue) {
          if (vaLue!.isEmpty) {
            return "please enter username";
          }
          return null;
        },
        decoration: InputDecoration(
            labelText: 'Username',
            prefixIcon: Icon(Icons.person),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(32)),
            )),
      ),
    );
  }

  Widget textfieldpasw() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
      child: TextFormField(
        obscureText: true,
        obscuringCharacter: '*',
        controller: _pasw,
        validator: (vaLue) {
          if (vaLue!.isEmpty) {
            return "please enter your password";
          }
          return null;
        },
        decoration: InputDecoration(
            labelText: 'Password',
            prefixIcon: Icon(Icons.vpn_key),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(32)),
            )),
      ),
    );
  }

  List<Widget> createRadioFood() {
    List<Widget> listFood = [];
    for (var food in foods!) {
      listFood.add(
        RadioListTile<dynamic>(
          title: Text(food.thname!),
          subtitle: Text(food.enname!),
          secondary: Text('${food.price} บาท'),
          value: food.foodvalue!,
          groupValue: groupfood,
          onChanged: (value) {
            setState(() {
              groupfood = value;
            });
          },
        ),
      );
    }
    return listFood;
  }

  List<Widget> createCheckboxDrink() {
    List<Widget> listDrink = [];

    for (var drink in drinks!) {
      listDrink.add(
        CheckboxListTile(
          value: drink.checked,
          title: Text(drink.thname!),
          subtitle: Text('${drink.price} บาท'),
          onChanged: (value) {
            setState(() {
              drink.checked = value;
            });
          },
        ),
      );
    }
    return listDrink;
  }
}

class ListItem {
  int? value;
  String? name;

  ListItem(this.value, this.name);

  static getItem() {
    return [
      ListItem(1, 'เครื่องดื่ม'),
      ListItem(2, 'อาหารอีสาน'),
      ListItem(3, 'อาหารปักษ์ใต้'),
      ListItem(4, 'อาหารเหนือ'),
    ];
  }

  // void add(DropdownMenuItem dropdownMenuItem) {}
}
