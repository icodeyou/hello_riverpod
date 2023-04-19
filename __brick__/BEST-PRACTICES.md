# Best practices

## Riverpod

### Names of Riverpod methods

If provider is declared with a method, name it with the type of data that it is getting, without the suffix `Provider`.

Example :

```dart
// Declare the provider (it will generate `catsProvider`)
@riverpod
List<Cat> cats(CatsRef ref) async {
  final db = ref.watch(dbProvider);
  return db.getCats();
}

// Watch the provider
final x = ref.watch(catsProvider);
```

### Names of Riverpod classes

If provider is declared with a class, name it with the type of data that it is getting, without the suffix `Provider`.

Example :

```dart
// Declare the provider (it will generate `catsProvider`)
@riverpod
class Cats extends _$Cats {
  @override
  Future<List<Cat>> build() {
    return [];
  }

  void addNewCat(Cat cat) {
    state.add(cat);
  }
}

// Watch the provider
final x = ref.watch(catsProvider);
```

### Names of files

The files must respect the names of the class or the method, with kebab_case syntax.

Example :

```text
cats.dart
```

### Names of AsyncValue variables

Sometimes, we get an AsyncValue after watching an adapter. In that case, name it with the suffix `Async`.

Example :

```dart
final catsAsync = ref.watch(catsProvider);
catsAsync.when(
  //...
)
```

## Custom widgets

### Display texts

All texts must be used by using the constructors :

- `EwaText.xxs()`
- `EwaText.xs()`
- `EwaText.s()`
- `EwaText.m()`
- `EwaText.l()`
- `EwaText.xl()`

These constructors override the font size. The size cannot be overridden with those constructors.

If you need to override the font size, you can use the default constructor `EwaText()`, but it is preferable to use the sizes that have been defined in the theme, for a consistent design.

### Display assets

For each module, there should be a class `XxxxSvgImage` or `XxxxAssetImage` available, so that you can display an your icons.

Example :

```dart
NutritionSvgImage(
  iconName: 'intake_icon.svg',
  width: 50,
)

NutritionAssetImage(
  iconName: 'intake_icon.svg',
  width: 50,
)
```

## Constructors

### Parameters

It is important to respect the following order for the parameters of your constructors :

- global key
- required parameters
- optional parameters

Example :

```dart
  class MyWidget extends StatelessWidget {
    const MyWidget({
      super.key,
      required this.parameter1,
      required this.parameter2,
      this.parameter3,
      this.parameter4,
      this.parameter5,
    });
```
