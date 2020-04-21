import 'package:http/http.dart' as http;



Future Get_Data(url)async{

  http.Response response =await http.get(url);
  return response.body;

}
