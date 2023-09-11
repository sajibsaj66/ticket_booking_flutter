const String tableAdmin = 'tbl_admin';
const String tblAdminColId = 'admin_id';
const String tblAdminColEmail = 'email';
const String tblAdminColPassword = 'password';
const String tblAdminColAdmin = 'admin';

class AdminModel {
  int? adminId;
  String email;
  String password;
  bool isAdmin;

  AdminModel({
    this.adminId,
    required this.email,
    required this.password,
    required this.isAdmin,
  });

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      tblAdminColEmail: email,
      tblAdminColPassword: password,
      tblAdminColAdmin: isAdmin ? 1 : 0,
    };
    if (adminId != null) {
      map[tblAdminColId] = adminId;
    }
    return map;
  }

  factory AdminModel.fromMap(Map<String, dynamic> map) => AdminModel(
    adminId: map[tblAdminColId],
    email: map[tblAdminColEmail],
    password: map[tblAdminColPassword],
    isAdmin: map[tblAdminColAdmin] == 0 ? false : true,
  );
}
