# Общий пакет, содержит абстракции (выделено то общее что присуще всем Flutter проектам компании)

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