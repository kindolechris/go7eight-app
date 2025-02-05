
class AuthUserModel{
  String? $id;
  String? name;
  String? email;
  String? phone;
  String? label;
  String? $createdAt;
  String? $updatedAt;

  AuthUserModel({
    this.$id,
    this.name,
    this.phone,
    this.label,
    this.email,
    this.$createdAt,
    this.$updatedAt
  });
}