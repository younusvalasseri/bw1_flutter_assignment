📱 Flutter Notifications App
A simple and clean Flutter application to fetch and display notifications from an API in a user-friendly interface.

🚀 Features:
🔔 Fetch notifications dynamically from a remote JSON API

🖼️ Displays icons based on each notification type

🕒 Timestamps formatted for readability

📦 Modular structure using models, services, and UI separation

🌙 Smooth UI with Material Design support

🧱 Project Structure
lib/

│

├── models/

│   └── notification_model.dart     # Model class for notification

│

├── services/

│   └── api_service.dart            # Handles API calls

│

├── screens/

│   └── notifications_screen.dart   # Main UI to display notifications

│

└── main.dart                       # Entry point

🔧 Getting Started
Prerequisites
Flutter SDK installed

A device/emulator to run the app

git clone https://github.com/your-username/flutter-notifications-app.git

cd flutter-notifications-app

flutter pub get

flutter run


🔗 API Endpoint
Ensure your assets/ folder includes the relevant images (icons):
assets/

├── order_assigned.png

├── order_delivered.png

├── order_cancelled.png

├── ...

And declare them in pubspec.yaml:

flutter:

  assets:
  
    - assets/
    
🤝 Contributing
Contributions are welcome! Feel free to submit a pull request or open an issue for bugs, improvements, or ideas.

🙋‍♂️ Author: 
Younus Valasseri

[GitHub Profile](https://github.com/younusvalasseri/)

https://younusvalasseri.github.io/Personal-Website/
