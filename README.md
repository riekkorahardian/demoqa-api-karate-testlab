# Karate Template

Refer to the [Getting Started Guide](https://github.com/karatelabs/karate/wiki/Get-Started:-Maven-and-Gradle#github-template) for instructions.

🥋 Karate API Automation Framework
This repository hosts a robust API testing framework built on the Karate Test Framework. Karate simplifies API automation by using a powerful Domain Specific Language (DSL), eliminating the need for complex boilerplate code in Java or JavaScript.

The framework supports Behavior-Driven Development (BDD) principles, seamless test chaining, and direct handling of JSON/XML data validation.

🚀 Getting Started
Prerequisites
You'll need the following software installed:

Java Development Kit (JDK) 11 or higher (JDK 17 is recommended for newer Karate versions).

Apache Maven (for dependency management and running tests).

Git (for version control).

Installation
Clone the Repository:

Bash

git clone [Your Repository URL]
cd [your-project-folder]
Verify Java/Maven Setup: Ensure your system is using the correct Java version (as specified in pom.xml):

Bash

java -version
mvn -version
Install Dependencies: Maven will download all necessary Karate libraries (as defined in pom.xml).

Bash

mvn clean install
⚙️ Project Structure
The structure follows Maven conventions, separating configuration, Java Runner, and reusable features:

my-karate-project/
├── pom.xml
└── src/
    └── test/
        ├── java/
        └── examples/
            ├── karate-config.js       # Global configuration (Base URL, Environments, Global Functions)
            └── account/                   # Main directory for account feature files
            └── bookStore/                   # Main directory for bookStore feature files
            └── e2eScenario/                   # Main directory for e2eScenario feature files


▶️ Running Tests
Tests are executed via the Maven command line, targeting the TestRunner.java class.

Standard Execution
Command	Description
mvn test	Runs all tests found by the TestRunner.java (usually all .feature files).

Execution by Tag (Filtering)
To run specific groups of tests, use the -Dkarate.options or -Dkarate.tags property.

Command	Purpose
mvn test -Dkarate.options="--tags @smoke"	Runs only scenarios tagged with @smoke.
mvn test -Dkarate.options="--tags @e2e"	Runs only scenarios tagged with @e2e (End-to-End flows).


Environment Switching
To run tests against different environments (Dev, Staging, Prod) as defined in karate-config.js:


📑 Reporting
Karate generates comprehensive HTML reports that simplify debugging and visualization.

Accessing the Report
Run the tests using mvn test.

Open the automatically generated HTML summary file in your web browser:

Path: target/karate-reports/karate-summary.html
