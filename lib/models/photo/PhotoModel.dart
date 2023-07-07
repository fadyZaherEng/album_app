class PhotoModel {
    int? albumId;
    int? id;
    String? thumbnailUrl;
    String? title;
    String? url;

    PhotoModel({this.albumId, this.id, this.thumbnailUrl, this.title, this.url});

    factory PhotoModel.fromJson(Map<String, dynamic> json) {
        return PhotoModel(
            albumId: json['albumId'], 
            id: json['id'], 
            thumbnailUrl: json['thumbnailUrl'], 
            title: json['title'], 
            url: json['url'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['albumId'] = this.albumId;
        data['id'] = this.id;
        data['thumbnailUrl'] = this.thumbnailUrl;
        data['title'] = this.title;
        data['url'] = this.url;
        return data;
    }
}