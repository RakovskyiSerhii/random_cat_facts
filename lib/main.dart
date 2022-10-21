import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:random_cat_facts/config/service_locator.dart';
import 'package:random_cat_facts/generated/l10n.dart';
import 'package:random_cat_facts/presentation/router/app_router.dart';
import 'package:random_cat_facts/presentation/widgets/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceLocator.config();
  runApp(const FactApplication());
}

class FactApplication extends StatelessWidget {
  const FactApplication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appRouter = GetIt.instance.get<AppRouter>();

    return MaterialApp.router(
      title: 'Title',
      theme: appTheme,
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.delegate.supportedLocales,
    );
  }
}
