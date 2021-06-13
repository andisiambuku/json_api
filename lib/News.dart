class News{
  String ? title;
  String ? text;
  String ? date;
  String ? pic;

  News(this.title,this.text,this.date,this.pic);

  News.fromJson(Map<String, dynamic> json){
   title = json['Papered_Title'];
   text = json['Papered_Details'];
   date = json ['Papered_Date'];
   pic = json['Pic'];

  }
}
