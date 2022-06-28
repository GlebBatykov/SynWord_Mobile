enum UserRole {
  guest('Guest', 0),
  user('User', 1),
  silver('Silver', 2),
  gold('Gold', 3),
  admin('Admin', 3);

  final String name;

  final int permisionLevel;

  const UserRole(this.name, this.permisionLevel);
}
