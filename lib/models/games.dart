class Games {
  String? name;
  String? description;
  String? image;
  String? liked;
  String? dateStart;
  String? dateEnd;

  Games(
      {this.name,
      this.description,
      this.image,
      this.liked,
      this.dateStart,
      this.dateEnd});

  Games.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    image = json['image'];
    liked = json['liked'];
    dateStart = json['date_start'];
    dateEnd = json['date_end'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    data['image'] = image;
    data['liked'] = liked;
    data['date_start'] = dateStart;
    data['date_end'] = dateEnd;
    return data;
  }
}
