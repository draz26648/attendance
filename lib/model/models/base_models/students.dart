class Student {
  Student({
    this.fname,
    this.lname,
    this.startTime,
    this.schoolYear,
    this.status,
  });

  String fname;
  String lname;
  String startTime;
  String schoolYear;
  String status;

  factory Student.fromJson(Map<String, dynamic> json) => Student(
        fname: json["fname"] == null ? null : json["fname"],
        lname: json["lname"] == null ? null : json["lname"],
        startTime: json["start_time"] == null ? null : json["start_time"],
        schoolYear: json["School_Year"] == null ? null : json["School_Year"],
        status: json["status"] == null ? null : json["status"],
      );
}
