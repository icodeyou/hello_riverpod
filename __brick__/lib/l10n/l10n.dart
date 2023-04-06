import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

export 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Localization extensions on BuildContext
extension AppLocalizationsX on BuildContext {
  /// AppLocalizations getter
  AppLocalizations get l10n => AppLocalizations.of(this);
}
