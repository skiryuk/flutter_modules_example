# Пакет, реализующий `common` и добавляет общую логику, свойственне приложению `dol`

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