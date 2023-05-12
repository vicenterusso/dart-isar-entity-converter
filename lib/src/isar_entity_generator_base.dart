import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:isar_entity_generator/convertible.dart';
import 'package:recase/recase.dart';
import 'package:source_gen/source_gen.dart';

class IsarEntityGenerator extends GeneratorForAnnotation<convertible> {
  @override
  Future<String> generateForAnnotatedElement(Element element, ConstantReader annotation, BuildStep buildStep) async {
    if (element is! ClassElement) {
      throw InvalidGenerationSourceError('${element.name} is not a class.');
    }

    final classElement = element as ClassElement;
    final otherClassName = annotation.read('to').stringValue;

    final classReCase = ReCase(classElement.name);
    final camelCaseClassName = classReCase.camelCase;

    // Generate the "from" function
    var fromFunctionBuffer = StringBuffer()
      ..writeln('${classElement.name} ${camelCaseClassName}FromEntity($otherClassName p) {')
      ..writeln('  return ${classElement.name}()');

    // Iterate over all fields in the class
    for (var field in classElement.fields) {
      fromFunctionBuffer.writeln('    ..${field.name} = p.${field.name}');
    }

    fromFunctionBuffer.writeln('  ;\n}');

    return '${fromFunctionBuffer.toString()}';
  }
}
