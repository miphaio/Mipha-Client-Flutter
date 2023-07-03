import "package:flutter/foundation.dart";
import "package:logo/logo.dart";

LogoLogLevel logLevel = kReleaseMode ? LogoLogLevel.info() : LogoLogLevel.all();

Logo logger = Logo(logLevel);
