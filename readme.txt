
- Create a new project in IntelliJ IDEA

- Installing External Packages
    - Go to pubspec.yaml
        - Add dependency for the package
            dependencies:
              flutter:
                sdk: flutter
              intl: ^0.17.0
        - IDEA will ask you to install them but if not in the terminal you can run
            flutter packages get
    - import the package from where you want to use it
        import 'package:intl/intl.dart';

