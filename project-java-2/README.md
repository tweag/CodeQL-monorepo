# Example Vulnerable java App

This is a small example Java application that can be used for testing CodeQL queries 

## Project Structure

```
my-java-app
├── src
│   ├── main
│   │   ├── java
│   │   │   └── com
│   │   │       └── example
│   │   │           └── App.java
│   │   └── resources
│   └── test
│       ├── java
│       │   └── com
│       │       └── example
│       │           └── AppTest.java
│       └── resources
├── pom.xml
└── README.md
```

## Usage

To run the application, execute the `App` class located at `src/main/java/com/example/App.java`.

To run the tests, execute the `AppTest` class located at `src/test/java/com/example/AppTest.java`.

## Dependencies

This project uses Maven for dependency management. The dependencies are defined in the `pom.xml` file.

## Resources

Additional resources required by the application can be placed in the `src/main/resources` directory.

Test-specific resources can be placed in the `src/test/resources` directory.

For more information, please refer to the individual files and directories in the project structure.

```

This README file provides an overview of the project structure, instructions for running the application and tests, information about dependencies, and details about the resources directory.
