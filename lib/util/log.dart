import "package:flutter/foundation.dart";
import "package:logo/logo.dart";

Logo logger = Logo(
  kReleaseMode ? LogoLogLevel.info() : LogoLogLevel.all(),
);
