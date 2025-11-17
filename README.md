# 📱 Stock Scan Parser — Flutter (Clean Architecture + BLoC)

A mobile replica of the Stock Scan Viewer from:

This Flutter app fetches the provided JSON containing stock market scan definitions and renders them in a clean mobile UI following the exact behavior shown in the assignment’s web version.

---

# 🚀 Features

### ✅ **Clean Architecture**

- **Data Layer** — Remote datasource, models, repository implementation
- **Domain Layer** — Entities, repository abstraction, use-cases
- **Presentation Layer** — UI + BLoC for state management

### ✅ **State Management: BLoC**

One central BLoC handles:

- loading scans
- error handling
- emitting scan list + details

### ✅ **Matches the Web UI**

The app exactly replicates the UI behavior from the assignment:

- List of scans (title + tag + colored text)
- Scan details page with header and criteria list
- Plain text criteria rendered in order and connected with **"and"**
- Variable criteria highlight `$1`, `$2`, `$3` in purple + underline
- Tapping a variable opens the variable options page
- Indicator variables show min/max/default values
- Value variables show a scrollable list of selectable numeric values
- No saving required (out of scope)

### ✅ **Fully Responsive**

- Works on Android, iOS, and Web (Chrome)
- Uses a centered 700px content width to match the web layout

### ✅ **Testable Architecture**

Includes:

- Model parsing test
- BLoC state transition test

---

# 📂 Project Structure (Clean Architecture)

lib/
├── data/
│ ├── datasources/
│ │ └── scan_remote_datasource.dart
│ ├── models/
│ │ └── scan_model.dart
│ └── repositories/
│ └── scan_repository_impl.dart
│
├── domain/
│ ├── entities/
│ │ └── scan_entity.dart
│ ├── repositories/
│ │ └── scan_repository.dart
│ └── usecases/
│ └── get_scans.dart
│
├── presentation/
│ ├── bloc/
│ │ ├── scan_bloc.dart
│ │ ├── scan_event.dart
│ │ └── scan_state.dart
│ ├── screens/
│ │ ├── scan_list_screen.dart
│ │ ├── scan_detail_screen.dart
│ │ └── variable_values_screen.dart
│ └── widgets/
│ └── scan_card.dart
│
├── injection_container.dart
└── main.dart

---

# 🔗 Data Source

The app loads data DIRECTLY from this URL:

http://coding-assignment.bombayrunning.com/data.json

This is the **only** JSON file used throughout the application.  
No other API calls or local persistence is required.

---

# 📦 Installation & Setup

### 1️⃣ Clone the repo

1. git clone <your_repo_url>
2. cd stock_scan_parser

### 2️⃣ Install dependencies

flutter pub get

### 3️⃣ Run the app

Mobile:

flutter run

Web:

flutter run -d chrome

---

# 🧪 Running Tests

This project includes basic model + bloc tests.

Run tests via:

flutter test

---

# 🎨 UI Behavior Summary

### **List Screen**

- Shows scan title
- Shows tag + color (`green` / `red`)
- Shows dotted separator
- Entire tile is tappable

### **Detail Screen**

- Blue header with scan name & tag
- All criteria listed vertically
- Plain text criteria separated with `"and"`
- Variables (`$1`, `$2`, `$3`) highlighted and tappable

### **Variable Screen**

- If `type = value` → show scrollable list of values
- If `type = indicator` → show configuration (min/max/default/parameter)

---

# 📘 Technologies Used

- **Flutter 3.x**
- **Dart**
- **BLoC State Management**
- **Clean Architecture**
- **GetIt (Dependency Injection)**
- **HTTP for networking**

---

# 🧩 Additional Notes

- The assignment explicitly states **no saving of variable values** → so the app does not store selected values.
- No backend or write operations required.
- No navigation complexity — just 3 screens.
- Code is optimized for readability & grading.

---

# 📜 License

This project is created exclusively for a coding assignment submission.
