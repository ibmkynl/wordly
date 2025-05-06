# 📘 Wordly - English Dictionary App

**Wordly** is a modern and scalable English dictionary app built with Flutter. It provides users with word definitions, synonyms, audio pronunciations, and a rich user experience with recent and favorite search features.

---

## 🧱 Architecture

The project follows a **clean layered architecture**:

- **Presentation Layer**: UI and `Provider`-based state management
- **Domain Layer**: Business logic and use cases
- **Data Layer**: Repositories, API integration, local storage (Hive)

Dependency Injection is managed using `get_it` for modular and decoupled architecture.

---

## 🔍 Features

### 🔎 Search Screen

- A search field (TextField) at the top
- On tapping "Search", navigates to the detail screen
- Displays the last **10 recent searches**
- Each recent card shows the **word** and the **search date/time**
- Recent searches are stored **locally using Hive**

---

### 📖 Word Detail Screen

- Displays all **definitions** of the searched word
- Shows top **5 synonyms**, sorted by score
- Includes **audio playback** for pronunciation (if available)
- Graceful handling of loading and error states

---

### ❤️ Favorites

- Users can **add or remove** words from favorites via a heart icon
- A **dedicated favorites screen** lists all saved favorite words
- Favorite data is stored persistently using Hive

---

## 📦 Tech Stack

- **Flutter** 3.x
- **Provider** for state management
- **get_it** for dependency injection
- **Hive** for local storage and caching
- **Dictionary API** and **Datamuse API** for content
- **Dio** for api calls

---

