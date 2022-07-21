// To parse this JSON data, do
//
//     final courses = coursesFromJson(jsonString);

import 'dart:convert';

List<Courses> coursesFromJson(String str) =>
    List<Courses>.from(json.decode(str).map((x) => Courses.fromJson(x)));

String coursesToJson(List<Courses> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Courses {
  Courses({
    this.courseId,
    this.courseName,
    this.provider,
    this.universitiesInstitutions,
    this.parentSubject,
    this.childSubject,
    this.url,
    this.nextSessionDate,
    this.length,
    this.videoUrl,
  });

  int courseId;
  String courseName;
  String provider;
  String universitiesInstitutions;
  String parentSubject;
  String childSubject;
  String url;
  dynamic nextSessionDate;
  dynamic length;
  String videoUrl;

  factory Courses.fromJson(Map<String, dynamic> json) => Courses(
        courseId: json["Course Id"],
        courseName: json["Course Name"],
        provider: json["Provider"],
        universitiesInstitutions: json["Universities/Institutions"],
        parentSubject: json["Parent Subject"],
        childSubject: json["Child Subject"],
        url: json["Url"],
        nextSessionDate: json["Next Session Date"],
        length: json["Length"],
        videoUrl: json["Video(Url)"],
      );

  Map<String, dynamic> toJson() => {
        "Course Id": courseId,
        "Course Name": courseName,
        "Provider": provider,
        "Universities/Institutions": universitiesInstitutions,
        "Parent Subject": parentSubject,
        "Child Subject": childSubject,
        "Url": url,
        "Next Session Date": nextSessionDate,
        "Length": length,
        "Video(Url)": videoUrl,
      };
}
