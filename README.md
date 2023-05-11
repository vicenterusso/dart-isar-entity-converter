<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

Simple Isar class to generic classes/entities. Generates from/to based on class type. Assumes both classes have the same number of fields, same type and name.

## Usage

Example

```dart
part 'user.g.dart';
@convertible(to: 'UserEntity')
@collection
class User {
    String name;
}
```

Generates the followig output in `user.g.dart`:

```dart
// **************************************************************************
// IsarEntityGenerator
// **************************************************************************

User userFromEntity(UserEntity p) {
  return User()
    ..name = p.name;
}
```