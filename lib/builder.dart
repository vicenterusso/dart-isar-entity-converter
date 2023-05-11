import 'package:build/build.dart';
import 'source_gen.dart';
import 'isar_entity_generator.dart';

Builder myBuilder(BuilderOptions options) => SharedPartBuilder([IsarEntityGenerator], 'isar_entity');
