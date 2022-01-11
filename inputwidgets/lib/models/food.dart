class Food {
  String? thname;
  String? enname;
  int? price;
  String? foodvalue;

  Food(this.thname, this.enname, this.price, this.foodvalue);

  static getFood() {
    return [
      Food('ส้มตำ', 'Som Tum', 100, 'Som Tum'),
      Food('ข้าวผัด', 'Fried rice', 100, 'Fried rice'),
      Food('ต้มยำกุ้ง', 'Tom Yum Kung', 150, 'Tom Yum Kung'),
      Food('ผัดไทย', 'Pad Thai ', 80, 'Pad Thai '),
      Food('ข้าวมันไก่', 'Khao Man Kai ', 100, 'Khao Man Kai '),
    ];
  }
}
