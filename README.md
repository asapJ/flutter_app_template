# flutter_app_template


### Folder Structure

Here is the top folder structure proposed in this project

```
lib/
|- core/
|- ui/
|- utils/
|- main.dart
```



```
1- core - All the application level data, services, cache are kept here. we can say this folder houses the business logic and backend proccesses of the project.
2- ui  —  Contains all the ui related files/components of project, typical examples are widgets, views, styles, etc.
3- util  —  Contains the utilities/common functions of the application.
4- main.dart - This is the starting point of the application. 
```

### Core

All the application level data, services, cache are kept here. we can say this folder houses the business logic and backend proccesses of the project. 
Folder structure is shown below:

```
core/
|- api/
    |- dio/
    |- handlers/
    |- requests/
|- constants/
|- models/
|- services/
    |- cache/
|- view_models/
```

### UI

Contains all the ui related files/components of project, typical examples are widgets, views, styles, etc.
Folder structure is shown below:


```
ui/
|- decoration/
    |- styles.dart
    |- theme.dart

|- screens/
        
|- widgets/ 
```

### Utils

Contains the utilities/common functions of the application.

```
utils/
|- dimens.dart
|- logger.dart
|- navigator.dart

```
