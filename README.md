# 🐼 Panda App

A simple test application built with Flutter using **Clean Architecture** and **BLoC**, demonstrating:

- 📍 Location access and permission handling
- 🌐 App localization
- ✅ Scalable, testable architecture with proper dependency injection

## 📱 Features

- Get user location with graceful permission handling
- Fully localized app (with `intl`)
- Modern navigation using `go_router`
- Scalable state management with `flutter_bloc` and `equatable`
- Decoupled and testable structure using `get_it` and `dartz`

## 🏗️ Architecture

This app follows the **Clean Architecture** pattern, separating concerns into:

- **Presentation** – UI layer with BLoC for state management
- **Domain** – Business logic with pure Dart entities and use cases
- **Data** – Platform-specific APIs (location, permissions, etc.)

Dependency injection is handled via `get_it`.

## 📦 Tech Stack

| Package               | Purpose                              |
|-----------------------|--------------------------------------|
| flutter_bloc          | State management                     |
| equatable             | Value comparison for states/events   |
| go_router             | Declarative routing                  |
| intl                  | Localization                         |
| geolocator            | Access device location               |
| permission_handler    | Request and manage permissions       |
| dartz                 | Functional error handling (`Either`) |
| get_it                | Dependency injection                 |
| flutter_svg           | SVG asset rendering                  |
