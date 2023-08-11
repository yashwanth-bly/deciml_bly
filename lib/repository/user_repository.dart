import 'package:deciml_bly/repository/repository.dart';

class UserRepository {
  UserRepository({required LocalRepository localRepository})
      : _localRepository = localRepository;
  final LocalRepository _localRepository;
}
