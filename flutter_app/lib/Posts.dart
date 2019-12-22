import 'dart:ffi';

class  Posts {

  String dateDetail,dateStart,description,title;

  Posts(this.dateDetail,
  this.dateStart,
  this.description,
  this.title,);
  
}

class Alllatlng {
  String temple ;
  double lat,lng;

  Alllatlng(this.temple,this.lng,this.lat);
  
}

// class Temples {
//   String avatar,temple;

//   Temples(this.avatar,this.temple);
  
// }


// class  Posts {

//   String dateDetail,dateStart,description,title;

//   Posts(this.dateDetail,this.dateStart,this.description,this.title);
  
// }

class Temples {
  String address_en,
  address_th,
  avatar,
  formalNames_en,
  formalNames_th,
  histories_en,
  histories_th,
  temple,
  website
  ;

  List images , videos;

  double lat,lng;

  Temples(
    this.address_en,
    this.address_th,
    this.avatar,
    this.formalNames_en,
    this.formalNames_th,
    this.histories_en,
    this.histories_th,
    this.temple,
    this.website,
    this.lat,
    this.lng,
    this.images,
    this.videos,
  );
  
}

class News {
  String detail,image,title;

  News(this.detail,this.image,this.title);
  
}

class Latlngmarker {
  String temple;
  double lat,lng;

  Latlngmarker(this.temple,this.lat,this.lng);
}