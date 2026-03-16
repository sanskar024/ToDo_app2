# Mini TaskHub – Personal Task Tracker

Mini TaskHub is a Flutter-based task management application that allows users to manage their daily tasks efficiently. The app includes authentication, task creation, deletion, completion tracking, and editing functionality. Data is stored using Supabase as the backend database.

---
VIDEO LINK-> 
---
# Features

Authentication

* Email and password login
* User registration
* Logout functionality
* Session persistence using Supabase

Task Management

* Add new tasks
* Edit task title
* Delete tasks
* Mark tasks as completed
* Due date selection for tasks

Dashboard

* View ongoing projects
* View completed tasks
* Progress indicator for tasks

User Experience

* Swipe right to mark a task as completed
* Swipe left to delete a task
* Search tasks using the search bar
* Overlapping team member avatars
* Smooth animations for task cards

State Management

* Provider package used for managing app state

Database

* Supabase used for authentication and storing tasks

---

# Tech Stack

Flutter
Dart
Supabase
Provider (State Management)

---

# Project Structure

```
lib
│
├── dashboard
│   ├── task_tile.dart
│   └── task_model.dart
│
├── provider
│   └── task_provider.dart
│
├── services
│   └── supabase_service.dart
│
├── screens
│   ├── home_screen.dart
│   ├── login_page.dart
│   ├── splash_screen.dart
│   ├── notification.dart
│   ├── messages.dart
│   └── profile.dart
│
└── main.dart
```

---

# Supabase Setup

Step 1
Create an account on Supabase.

Step 2
Create a new project.

Step 3
Create a table named **tasks**.

Table structure:

| Column     | Type      |
| ---------- | --------- |
| id         | uuid      |
| title      | text      |
| progress   | int       |
| completed  | bool      |
| due_date   | date      |
| created_at | timestamp |

Step 4
Enable Row Level Security.

Create a policy allowing authenticated users to read and write data.

Step 5
Copy your Supabase URL and Anon Key.

Add them in `main.dart`:

```
await Supabase.initialize(
  url: "YOUR_SUPABASE_URL",
  anonKey: "YOUR_SUPABASE_ANON_KEY",
);
```

---

# Installation & Setup

Clone the repository

```
git clone https://github.com/your-username/minitaskhub.git
```

Move to the project directory

```
cd minitaskhub
```

Install dependencies

```
flutter pub get
```

Run the application

```
flutter run
```

---

# Unit Test

A basic unit test is included to verify the TaskModel serialization logic.

Run tests using:

```
flutter test
```

---

# Hot Reload vs Hot Restart

Hot Reload

* Updates UI instantly without restarting the app
* Keeps the current app state
* Used for quick UI changes

Hot Restart

* Restarts the entire application
* Resets app state
* Used when major code changes occur

---

# Animations

Basic animations are implemented for task cards using AnimatedContainer to provide smooth UI transitions.

---

# Bonus Features Implemented

* Task editing
* Swipe gestures for actions
* Due date selection
* Animated task cards

---

# Demo

A working demo video of the application is included with the submission.

---

# Author

Sanskar

Computer Science Student
Flutter Developer
