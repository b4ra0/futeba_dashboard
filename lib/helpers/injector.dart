import 'package:futeba/helpers/api_client.dart';
import 'package:kiwi/kiwi.dart';

class Injector{
  static final KiwiContainer container = KiwiContainer();

  static void setup() {
    container.registerSingleton((c) => ApiClient());
  }
}