import 'package:http/http.dart' as http;
import '../model/course_model.dart';

class HelperService {
  Future<List<Courses>> getCourse() async {
    var client = http.Client();
    var uri = 'https://nut-case.s3.amazonaws.com/coursessc.json';
    var url = Uri.parse(uri);
    var response = await client.get(url);
    if (response.statusCode == 200) {
      var json = response.body;
      return coursesFromJson(json);
    }
  }
}
