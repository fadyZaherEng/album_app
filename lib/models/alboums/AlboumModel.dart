class AlboumModel {
    int? id;
    String? title;
    int? userId;

    AlboumModel({this.id, this.title, this.userId});

    factory AlboumModel.fromJson(Map<String, dynamic> json) {
        return AlboumModel(
            id: json['id'], 
            title: json['title'], 
            userId: json['userId'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['title'] = this.title;
        data['userId'] = this.userId;
        return data;
    }
}