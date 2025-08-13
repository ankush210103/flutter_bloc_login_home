# Flutter BLoC Login + Home App

This is a Flutter application built for an assignment.  
It features:
- **Login screen** with validation
- **Home screen** fetching images from [Picsum Photos](https://picsum.photos/)
- **BLoC state management**
- **API integration**
- **Responsive UI** with Google Fonts

---

## 📱 Features

### **Login Screen**
- Email & Password fields
- Validation:
  - Email format check
  - Password: minimum 8 characters, at least 1 uppercase, 1 lowercase, 1 digit, 1 special character
- On successful login → navigates to Home screen

### **Home Screen**
- Fetches 10 random images from [Picsum Photos API](https://picsum.photos/v2/list)
- Displays in a vertical list
- Image takes full width, height adjusts to aspect ratio
- Title: Montserrat Semi-Bold  
- Description: Montserrat Regular, max 2 lines

---

## 🏗️ Tech Stack
- **Flutter** (Dart)
- **BLoC State Management**
- **HTTP package** for API calls
- **Google Fonts** for typography

---

## 📂 Folder Structure
lib/
│
├── core/ # App routes, validators
├── data/ # Models, repositories
├── logic/ # BLoC files
├── presentation/ # UI Screens
└── main.dart # Entry point

yaml
Copy
Edit

---

## 🚀 Getting Started

### **1. Clone the repository**
```sh
git clone https://github.com/<username>/flutter_bloc_login_home.git
cd flutter_bloc_login_home
2. Install dependencies
sh
Copy
Edit
flutter pub get
3. Add Internet Permission
In android/app/src/main/AndroidManifest.xml (above <application> tag):

xml
Copy
Edit
<uses-permission android:name="android.permission.INTERNET"/>
4. Run the app
sh
Copy
Edit
flutter run
📦 Build APK
sh
Copy
Edit
flutter build apk --release
