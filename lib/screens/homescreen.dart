import 'package:flutter/material.dart';
import '../model/course_model.dart';
import '../helper_services/helperServices.dart';
import '../components/courseTile.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Courses> courses;
  bool isLoaded = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    courses = await HelperService().getCourse();
    if (courses == null)
      setState(() {
        isLoaded = false;
      });
    else
      setState(() {
        isLoaded = true;
      });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffFEEFEC),
        appBar: AppBar(
          centerTitle: true,
          title: Text('Coursie'),
        ),
        body: Visibility(
          visible: isLoaded,
          child: ListView.builder(
            itemCount: courses?.length,
            itemBuilder: (context, index) => CourseTile(courses[index]),
          ),
          replacement: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
