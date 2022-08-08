import 'package:flutter/cupertino.dart';
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
  List<Courses> displayCourses;
  bool isLoaded = false;
  TextEditingController controller = TextEditingController();
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
        displayCourses = courses;
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
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: 12,
                ),
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                  border: Border.all(
                    color: Color(0xffF56A4D),
                    width: 2,
                  ),
                ),
                child: TextFormField(
                  onChanged: (String s) {
                    searchCourse(s);
                  },
                  controller: controller,
                  cursorColor: Color(0xffF56A4D),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.close,
                        color: Color(0xffF56A4D),
                      ),
                      onPressed: () {
                        controller.clear();
                        setState(() {
                          displayCourses = courses;
                        });
                      },
                    ),
                    hintText: 'Search course',
                    hintStyle: TextStyle(
                      fontSize: 16,
                    ),
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.search_rounded,
                      color: Color(0xffF56A4D),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: displayCourses?.length,
                  itemBuilder: (context, index) => CourseTile(
                    displayCourses[index],
                  ),
                ),
              ),
            ],
          ),
          replacement: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }

  void searchCourse(String query) {
    final courseList = courses.where((singleCourse) {
      final name = singleCourse.courseName.toLowerCase();
      final univ = singleCourse.universitiesInstitutions.toLowerCase();
      final parCat = singleCourse.parentSubject.toLowerCase();
      final chiCat = singleCourse.childSubject.toLowerCase();
      final offered = singleCourse.provider.toLowerCase();
      final id = singleCourse.courseId;
      final lowerString = query.toLowerCase();
      return name.contains(lowerString) ||
          univ.contains(lowerString) ||
          parCat.contains(lowerString) ||
          chiCat.contains(lowerString) ||
          offered.contains(lowerString) ||
          '$id'.contains(lowerString);
    }).toList();
    setState(() {
      displayCourses = courseList;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }
}
