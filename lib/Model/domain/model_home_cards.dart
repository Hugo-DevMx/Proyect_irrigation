class ModelCards {
  String? id;
  String? nameArea;
  String? typeArea;
  String? imageUrl;
  String? state;

  ModelCards(
      {this.id, this.nameArea, this.typeArea, this.imageUrl, this.state});

  ModelCards.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameArea = json['name'];
    typeArea = json['type'];
    imageUrl = json['imageUrl'];
    state = json['state'];
  }
}
