

enum APIPath {
  weather,

}

class APIPathHelper{
  static String getValue(APIPath path){
    switch(path){
      case APIPath.weather:
        return "/current.json";

      default:
        return "";
    }
  }
}
