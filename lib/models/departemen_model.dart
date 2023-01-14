class DepartemenModel {
  int? id;
  String? deptName;

  DepartemenModel({
    this.id,
    this.deptName,
  });

  DepartemenModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    deptName = json['dept_name'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'dept_name': deptName,
    };
  }
}
