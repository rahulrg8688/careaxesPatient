class GetLocations {
  int? id;
  String? value;
  String? name;
  GetLocations(
      {
        this.id,
        this.value,
        this.name,
      });
  GetLocations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
    name = json['name'];

  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['value'] = this.value;
    data['name'] = this.name;
    return data;
  }
}
