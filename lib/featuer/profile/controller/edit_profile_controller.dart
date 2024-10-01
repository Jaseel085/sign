import 'package:sign/featuer/profile/repository/edit_Profile_repository.dart';
import 'package:sign/model/user_model.dart';

class EditProfilController{
  final EditProfileRepository _repository;
  EditProfilController({
    required EditProfileRepository repository
}):_repository=repository;


  updateUsers(UserModel userModel)async{
    await _repository.updateUsers(userModel);
  }

}