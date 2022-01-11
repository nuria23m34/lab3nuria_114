class Drink {
  String? thname;
  int? price;
  bool? checked;

  Drink(this.thname, this.price, this.checked);

  static getDrink() {
    return [
      Drink('ชาเขียว', 45, true),
      Drink('ชาเย็น', 45, false),
      Drink('โกโก้', 45, false),
      Drink('ไมโล', 35, false),
      Drink('โอวันติน', 35, false),
    ];
  }
}
