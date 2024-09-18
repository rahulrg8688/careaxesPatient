import 'Item1.dart';
import 'Item2.dart';

class checkUserList {
  List<Item1>? item1;
  Item2? item2;

  checkUserList({this.item1, this.item2});

  checkUserList.fromJson(Map<String, dynamic> json) {
    if (json['item1'] != null) {
      item1 = <Item1>[];
      json['item1'].forEach((v) {
        item1!.add(new Item1.fromJson(v));
      });
    }
    item2 = json['item2'] != null ? new Item2.fromJson(json['item2']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.item1 != null) {
      data['item1'] = this.item1!.map((v) => v.toJson()).toList();
    }
    if (this.item2 != null) {
      data['item2'] = this.item2!.toJson();
    }
    return data;
  }
}




