import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'UNSPLASH_ACCESS_KEY', obfuscate: true)
  static final unsplashApiKey = _Env.unsplashApiKey;
  @EnviedField(varName: 'UNSPLASH_SECRET_KEY', obfuscate: true)
  static final unsplashSecretKey = _Env.unsplashSecretKey;
}
