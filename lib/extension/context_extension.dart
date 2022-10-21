import 'package:flutter/cupertino.dart';
import 'package:random_cat_facts/generated/l10n.dart';

extension ContextExtension on BuildContext {
  AppLocalizations get localizations => AppLocalizations.of(this);
}
