class NewsModel {
  final String name;
  final String msg;
  final String time;
  final String pic;
  final String type;
  final String articleType;
  final String categoryType;
  NewsModel(this.name, this.msg, this.time, this.pic, this.type,
      this.articleType, this.categoryType);
}

List<NewsModel> newsData = [
  new NewsModel(
      "Venkat Raman-Art",
      "Welcome to whatsapp chat",
      "10:30 PM",
      "https://randomuser.me/api/portraits/men/1.jpg",
      "user",
      "article",
      "Information Technology"),
  new NewsModel(
      "Venkat Raman",
      "Welcome to whatsapp chat",
      "10:30 PM",
      "https://randomuser.me/api/portraits/men/0.jpg",
      "yahoo",
      "post",
      "Health Care"),
  new NewsModel(
      "Venkat Raman",
      "Welcome to whatsapp chat",
      "10:30 PM",
      "https://randomuser.me/api/portraits/men/2.jpg",
      "user",
      "post",
      "Information Technology"),
  new NewsModel(
      "Venkat Raman",
      "Welcome to whatsapp chat",
      "10:30 PM",
      "https://randomuser.me/api/portraits/men/3.jpg",
      "user",
      "post",
      "Information Technology")
];
