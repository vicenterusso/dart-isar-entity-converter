import 'package:build/build.dart';
import 'package:isar_entity_generator/isar_entity_generator.dart';
import 'package:source_gen/source_gen.dart';

Builder isarToEntity(BuilderOptions options) => SharedPartBuilder([IsarEntityGenerator()], 'isar_entity');
//Builder isarToEntity(BuilderOptions options) => SharedPartBuilder([IsarEntityGenerator()], 'isar_entity.isar.entity');
