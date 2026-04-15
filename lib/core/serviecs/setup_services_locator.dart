// This is our global ServiceLocator
import 'package:get_it/get_it.dart';
import 'package:nota/core/serviecs/data_base_services.dart';
import 'package:nota/core/serviecs/fire_base_auth.dart';
import 'package:nota/core/serviecs/fire_base_storage_services.dart';
import 'package:nota/feature/auth/data/repo_impl/auth_repo_impl.dart';
import 'package:nota/feature/auth/domain/repos/auth_repo.dart';
import 'package:nota/feature/note/data/repo_implt/Note_repo_impt.dart';
import 'package:nota/feature/note/domain/repo/note_repo.dart';

GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  // Here we can register all our singleton services

  getIt.registerSingleton<FirebaseAuthServiecs>(FirebaseAuthServiecs());
  getIt.registerSingleton<DataBaseServices>(FireBaseStorageServices());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(getIt<FirebaseAuthServiecs>()),
  );

  getIt.registerSingleton<NoteRepo>(NoteRepoImpt(getIt<DataBaseServices>()));
}
