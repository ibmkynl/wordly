# 📘 Wordly - English Dictionary App

**Wordly** is a modern and scalable English dictionary app built with Flutter. It provides users with word definitions, synonyms, audio pronunciations, and a rich user experience with recent and favorite search features.

Everything is designed to work **offline-first**, with API responses **cached locally** for performance and availability.

---

## 🧱 Architecture

The project follows a **clean layered architecture**:

- **Presentation Layer**: UI and `Provider`-based state management  
- **Domain Layer**: Business logic and use cases  
- **Data Layer**: Repositories, API integration, local storage with Hive  

**Dependency Injection** is handled using `get_it` (`di_service`) for modularity and testability.

---

## 🔍 Features

### 🔎 Search Screen

- A search field (TextField) at the top  
- Navigates to the detail screen on search  
- Displays the last **10 recent searches**  
- Each card shows the **word** and **timestamp**  
- Recent searches are **stored and shown offline** via Hive  

---

### 📖 Word Detail Screen

- Shows **all available definitions** of the word  
- Displays **top 5 synonyms**, sorted by score  
- **Audio pronunciation support** (when mp3 links exist)  
- Robust **loading and error state handling**  
- **API results are cached locally** to enable offline viewing and reduce network usage  

---

### ❤️ Favorites

- Add or remove words from favorites with a heart icon  
- Dedicated favorites screen listing saved words  
- **Favorites persist offline using Hive**  

---

## 📦 Tech Stack

- **Flutter** 3.x  
- **Provider** for state management  
- **get_it** for dependency injection (`di_service`)  
- **Hive** for local storage and caching  
- **Dio** for networking with custom error handling and response caching  
- **Dictionary API** and **Datamuse API** as content providers  
