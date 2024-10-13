# Хост-приложение DOL

Является контейнером для модулей, соответственно происходит завязка на модули в `pubspec.yaml`

```
name: dol
...

dependencies:
  ...

  common:
    path: ../../packages/common
  common_dol:
    path: ../../packages/common_dol
  conf:
    path: ../../packages/conf
  contracts:
    path: ../../packages/contracts
  ao:
    path: ../../packages/ao
  uikit:
    path: ../../packages/uikit
    
  ...
    
```

Также в приложении реализуются основные функции приложения: авторизация, главный экран + навигация и т.п