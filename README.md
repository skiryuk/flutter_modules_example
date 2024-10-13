# Многомодульный проект (суперапп)

#### Проект имеет конфигурацию монорепозитория и представляет собой пример организации проекта, состоящего из модулей. Для управления монорепозиторием используется пакет [melos](https://pub.dev/packages/melos)

Монорепозиторий предполагает `workspace` следующую структуру, для управления версиями `flutter sdk` используется [fvm](https://fvm.app)

```
workspace
 .fvm # fvm, https://fvm.app
 |--apps # хост-приложения
    |--dol
    |--uikit_example
    |--...
 |--packages # пакеты (модули)
    |--common
    |--common_dol
    |--ao
    |--conf
    |--contracts
    |--uikit
    ...
 melos.yaml  # конфигурационный файл для melos
 pubspec.yaml # конфигурация проекта и описание зависимостей
```

#### В папке `apps` - приложения:
`dol` (хост-приложение),

`uikit_example` (стенд с компонентами UI Kit)

#### В папке `packages` - пакеты (модули):
`common`, `common_dol` - общие модули,

`ao`, `contracts`, `conf` - фича модули,

`uikit` - компоненты дизайн-системы

#### Два общих модуля,
1. `common` - абстрагируется от специфики приложения, общий для всех Flutter приложений компании,

2. `common_dol` - реализует `common` и добавляет специфичные общие компоненты для приложения `dol`


#### Каждый модуль имеет структуру в виде набора фич и общих `ui`, `core` компонентов


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

#### Каждая фича - это экран со всем необходимым для него (`bindings`, `controller`, `state` ...)
#### Для управления состоянием и зависимостями внутри фичи и в приложении в целом используется концепция MVC + DI

```
Widget -- Controller -- State
  |
  |
Bindings 
(Scope, DI Container)

```

В приложении представлены примеры организации структуры, разбиения на модули и установке зависимостей между ними, роутинга, управления состоянием и зависимостями.

#### В проекте представлены примеры:

1. Главный экран в `dol`, с которого можно переходить в другие модули `ao`, `contracts`, `conf` и возвращаться обратно. Модули представлены 2-мя экранами: главный и детализации. Можно переходить с одного и возвращаться обратно.

2. В модуле `contracts` представлен пример организации управления состоянием и зависимостями (есть общее состояние `contracts_state` для обоих экранов и локальное для экрана детализации `contracts_detail_state`)

3. В модуле `ao` представлен пример роутинга с передаче параметров от главного экрана к модулю, от главного экрана модуля `ao` к экрану детализации

4. Представлен пример `uikit'а` c общими компонентами (компонентами дизайн системы), эти компоненты используются для создании экранов приложения. Представлен пример проекта `uikit_example` со списком всех компонентов

### Полезные ссылки:

[Доклад на Mobius Autumn 2024](https://mobiusconf.com/talks/652b0a14fcad49459641043961041f86)

[Более ранний мой доклад, который послужил основой](https://habr.com/ru/companies/beeline_tech/articles/785730)

[Доклад про другой суперапп (известный как приложение билайна)](https://habr.com/ru/companies/beelinekz/articles/698072)

[Доклад Павла Гершевича про многомодульность, опыт и melos](https://www.youtube.com/watch?v=9NtgRB8EB60&list=PLRdS-n5seLRqW0oEOB-mnWVF0E3BbemUS)

[Про модульность, фичи, разбиение на модули с учетом специфики Flutter](https://seniorturkmen.medium.com/managing-multi-package-flutter-projects-with-melos-a-leap-towards-efficient-development-a305e696fe73)

[Принципы построения многомодульных приложений](https://habr.com/ru/articles/687882)

[Про принципы, фичи + разбиение по clean architecture внутри фичи](https://flutterawesome.com/a-modular-app-architecture-that-can-be-scalable-as-the-time-passes)

[Способ организации многомодульности по принципу mini app приложений](https://medium.com/@caotrung.kk/comprehensive-guide-to-creating-super-app-with-different-types-of-mini-apps-b0ff7a17b84d)