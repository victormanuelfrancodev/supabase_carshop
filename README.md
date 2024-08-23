# Supabase Stored Procedures Example :zap:

This project demonstrates the use of **functions** in Supabase to enhance the efficiency of applications. It's designed using a clean architecture approach, leveraging Flutter for frontend and Supabase as backend service.

## Features :star:

- **Clean Architecture**: Ensures scalability and maintainability.
- **State Management**: Uses `InheritedWidget` for efficient state management across the app.
- **Supabase Integration**: Utilizes Supabase for real-time database interactions.
- **Environment Configuration**: Manages configuration through the `env` package for safe, scalable app settings.

## How It Works :gear:

The app simulates a car shop where users can view products, add them to their cart, and make purchases. The purchase logic is handled through a function in Supabase, which ensures all transactions are processed efficiently and securely.

### BuyState Management

```dart
sealed class BuyState {}
class InitialState extends BuyState {}
class LoadingState extends BuyState {}
class LoadedState extends BuyState {
  LoadedState({required this.result});
  final String result;
}
class FailureState extends BuyState {}
```