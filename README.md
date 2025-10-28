# Tanzimak (تنظيمك) - University Schedule Generator

Tanzimak is a smart schedule generator built with Flutter. It's designed to help university students solve the complex and stressful problem of creating an optimal, conflict-free class schedule from a long list of available courses.

This app takes all available courses and the user's preferences (like target credit hours and desired days off) and uses a powerful algorithm to instantly generate all possible valid schedules.

This project was built to demonstrate advanced problem-solving, complex logic implementation, and algorithmic thinking in a mobile environment.

## ✨ Key Features

- **Smart Algorithm**: A custom-built generation engine that:
    - Generates all possible schedule combinations.
    - Performs high-speed time conflict detection for every combination.
    - Filters results based on user preferences (credit hours, days off).

- **Intuitive UI**: A clean, minimal interface designed to reduce stress, not add to it.

- **Visual Schedule View**: Generated schedules are displayed in a simple, easy-to-read weekly calendar format.

- **No Database Needed**: The MVP is 100% offline and session-based, focusing purely on the power of the algorithm.

## 🧠 The Core Problem-Solving Challenge

The main challenge was not building the UI, but designing the schedule generation algorithm. The app needed to solve a complex combinatorial problem efficiently on a mobile device.

The algorithm was broken down into three logical steps:

### 1. Generate Combinations (Problem 1):
Wrote a recursive helper function to find all possible k-combinations from the list of n available courses (e.g., "find all combinations of 5 courses from a list of 15").

### 2. Conflict Detection (Problem 2):
Created a function `doCoursesConflict(courseA, courseB)` that checks if two single courses have any overlapping time slots on the same day.

### 3. Validate Schedule (Problem 3):
Created a function `doesScheduleHaveConflicts(schedule)` that iterates through a proposed schedule (a list of courses) and uses the `doCoursesConflict` function to compare every pair of courses, ensuring the entire schedule is conflict-free.

This, combined with filters for credit hours and days off, produces the final valid results.

## 💻 Core Algorithm Implementation

```dart
/// The core logic for checking if two time slots overlap.
bool _doCoursesConflict(CourseModel courseA, CourseModel courseB) {
  for (var timeA in courseA.timings) {
    for (var timeB in courseB.timings) {
      // 1. Are they on the same day?
      if (timeA.day == timeB.day) {
        
        // 2. Do their times overlap?
        bool startsBeforeEnd = timeA.startTime.toMinutes() < timeB.endTime.toMinutes();
        bool endsAfterStart = timeA.endTime.toMinutes() > timeB.startTime.toMinutes();

        if (startsBeforeEnd && endsAfterStart) {
          return true; // Conflict found!
        }
      }
    }
  }
  return false; // No conflicts
}
```
## 🛠 Tech Stack & Architecture
**Framework**: Flutter

**Language**: Dart

**State Management**: Cubit, River pod

**Architecture**: Clean, scalable folder structure (models, views/screens, services/logic).

**Core Logic**: The schedule generator is isolated in its own ScheduleGenerator service class, making it testable and independent of the UI.

## 🚀 How to Run
1. Clone the repository.

2. Run flutter pub get to install dependencies.

3. Run flutter run to launch the app on an emulator or device.