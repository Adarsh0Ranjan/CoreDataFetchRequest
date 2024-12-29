### Repository Description: CoreDataBootcamp

#### Overview
CoreDataBootcamp is a SwiftUI project that demonstrates the use of **Core Data** to manage and persist data in an iOS application. The project focuses on implementing basic CRUD (Create, Read, Update, Delete) operations using Core Data while integrating it seamlessly with SwiftUI. 

The app features a simple interface where users can add, update, and delete fruits from a list. It also includes state management, previews with mock data, and demonstrates Core Data's integration with SwiftUI's `@FetchRequest`.

---

#### Features
- **Add Fruits**: Users can type a fruit name into a text field and add it to the list with a randomly assigned "Sweet" or "Bitter" property.
- **Update Fruits**: Tap on any fruit in the list to update its name (adds a `!` to the end) and toggle the sweetness property.
- **Delete Fruits**: Swipe to delete a fruit from the list.
- **Core Data Integration**: 
  - Leverages `@FetchRequest` to dynamically update the UI based on Core Data changes.
  - Implements save, delete, and update operations in Core Data.
- **SwiftUI and State Management**:
  - Uses `@State` to manage text input for adding new fruits.
  - Demonstrates real-time UI updates in response to Core Data changes.
- **Previews with Mock Data**: Uses a `PersistenceController` to provide mock data for the SwiftUI previews, ensuring the UI can be previewed without running the app.

---

#### How to Use
1. Clone the repository.
2. Open the project in Xcode.
3. Run the app on the iOS Simulator or a physical device.
4. Use the text field to add fruits, tap a fruit to update it, and swipe to delete it.

---

#### Technologies Used
- **SwiftUI**: Declarative UI framework for iOS.
- **Core Data**: Apple's framework for data persistence and management.
- **Environment Property Wrappers**:
  - `@Environment(\.managedObjectContext)` for accessing Core Data's context.
  - `@FetchRequest` for binding Core Data results to the UI.
- **Preview with Mock Data**: Demonstrates how to test SwiftUI views with mock Core Data.

---

#### Project Structure
- `ContentView.swift`: Main view of the app, including UI and Core Data operations.
- `PersistenceController.swift`: Helper class for setting up Core Data, including an in-memory store for previews.
- Core Data Model: Contains the `Fruit` entity with attributes:
  - `name` (String): Name of the fruit.
  - `isSweet` (Boolean): Whether the fruit is sweet or bitter.

---

This project is perfect for developers looking to learn Core Data basics and how to integrate it into a SwiftUI project!
