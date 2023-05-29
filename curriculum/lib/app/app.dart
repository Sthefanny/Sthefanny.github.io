import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../l10n/generated/l10n.dart';
import 'app_store.dart';

class App extends StatefulWidget {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final AppStore store;

  @override
  void initState() {
    super.initState();
    store = Modular.get<AppStore>();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        print('locale = ${store.locale}'); //Só ta funcionando com esse print
        return ScreenUtilInit(
          designSize: Size(1280, 720),
          minTextAdapt: true,
          builder: (_, __) => MaterialApp.router(
            title: 'Sthefanny\'s CV',
            routeInformationParser: Modular.routeInformationParser,
            routerDelegate: Modular.routerDelegate,
            debugShowCheckedModeBanner: false,
            debugShowMaterialGrid: false,
            localizationsDelegates: S.localizationsDelegates,
            supportedLocales: S.supportedLocales,
            localeResolutionCallback: (locale, supportedLocales) {
              if (supportedLocales.contains(store.locale)) {
                return store.locale;
              }

              return Locale('pt');
            },
            locale: store.locale,
            builder: (context, widget) {
              Modular.setNavigatorKey(App.navigatorKey);

              return Builder(builder: (context) => widget!);
            },
          ),
        );
      },
    );
  }
}
