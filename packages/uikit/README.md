# Набор компонентов дизайн-системы

Делается максимально независимым от каких-либо внешних пакетов, state managers и т.п.

Структура

```
module
 |--core
    |--models
    |--repositories
    |--services
    |--...
 |--features
    |--feature-1
       |--page.dart
       |--controller.dart
       |--state.dart
       |--bindings.dart
       |--ui
       |--core
       |--features
          |-- ...
    |--feature-2
       |-- ...
    ...
 |--ui
    |--widgets
    |--scaffolds
    |--modals
    |--...
```