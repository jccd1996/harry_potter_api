class Wand {
  String wood;
  String core;

  Wand({this.wood, this.core});

  Wand.fromJson(Map<String, dynamic> json) {
    wood = json['wood'];
    core = json['core'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['wood'] = this.wood;
    data['core'] = this.core;
    return data;
  }
}
