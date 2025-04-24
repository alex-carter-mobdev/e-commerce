import 'package:logger/logger.dart';
import 'package:flutter/foundation.dart';

final logger = Logger(
  printer: PrettyPrinter(colors: true, printEmojis: true, lineLength: 80),
  level: kDebugMode ? Level.debug : Level.off,
);
