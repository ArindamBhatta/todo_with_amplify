# Connect Amplify: -

### Step 1: Install Amplify CLI

> npm install -g @aws-amplify/cli

Then configure it:

> amplify configure

- This will open a browser to sign in to your AWS account.
- Choose a region (e.g., ap-south-1).
- Create a new IAM user if needed.
- Note down your access key and secret key. Amplify CLI will use this to create resources.

### Step 2: Initialize Amplify in Your Flutter Project

> amplify init

- Enter a project name.

- Environment: dev (default)

- Choose your default editor (VS Code or other).

- Choose Flutter as your framework.

- Accept default build settings.

- Choose the AWS profile you configured in Step 1.

- Amplify CLI will create a backend folder and amplifyconfiguration.dart in your Flutter project.

### Step 3: Add Authentication (Signup/Login)

Now, add authentication:

> amplify add auth

- Default configuration (Email/Username-based signup) is usually fine for Flutter apps.

- Choose Username or Email for sign-in method.

- Accept other default options or configure MFA, password policy, etc.

Then deploy:

> amplify push

- This will create Cognito User Pool and Identity Pool in the AWS region you selected.

- After deployment, Amplify generates configuration files that your Flutter app will use.

### Step 4: Add Database (GraphQL or REST)

Amplify supports two main backend options for storing user data:

###### Option A: GraphQL API with DynamoDB

> amplify add api

Select GraphQL.

Choose default authorization (use Cognito User Pool for auth).

Define a schema (e.g., schema.graphql):

###### Option B: REST API with DynamoDB

> amplify add api

Select REST.

Link it to Lambda functions.

Connect Lambda to DynamoDB tables.

### Step 5: Install Amplify Flutter Packages

- Add the required packages in pubspec.yaml:

```yaml
dependencies:
  amplify_flutter: ^1.0.0
  amplify_auth_cognito: ^1.0.0
  amplify_datastore: ^1.0.0
  amplify_api: ^1.0.0
```

- flutter pub get

```
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'amplifyconfiguration.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final authPlugin = AmplifyAuthCognito();
  await Amplify.addPlugin(authPlugin);

  try {
    await Amplify.configure(amplifyconfig);
  } catch (e) {
    print('An error occurred configuring Amplify: $e');
  }

  runApp(MyApp());
}

```
