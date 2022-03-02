import 'package:flutter_modular/flutter_modular.dart';
import 'package:zap_2/app/application/home/home_page_store.dart';
import 'package:zap_2/app/application/initial/initial_page_store.dart';
import 'package:zap_2/app/presentation/home/home_page.dart';
import 'package:zap_2/app/presentation/initial/initial_page.dart';
import 'package:zap_2/app/presentation/loading/loading.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => InitialPageStore()),
        Bind.singleton((i) => HomePageStore()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => const InitialPage()),
        ChildRoute('/loading',
            child: (_, args) => LoadingPage(
                  name: args.data,
                )),
        ChildRoute('/home', child: (_, args) => HomePage(name: args.data)),
      ];
}
