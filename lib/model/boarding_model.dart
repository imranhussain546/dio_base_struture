class OnBoardingModel{
  String? id;
  String? title;
  String? image;
  String? description;

  OnBoardingModel(this.id,this.title,this.image,this.description);

  OnBoardingModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    description = json['description'];
  }
}