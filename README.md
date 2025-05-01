# 🧠 Brain Scope AI

Brain Scope AI is an intelligent Flutter-based mobile app designed to assist in early detection and classification of dementia using brain MRI scans. The app integrates a built-in machine learning model for on-device image analysis and provides an intuitive, responsive UI with rich features for user convenience.

---

## 🚀 Features

### 🧠 AI-Powered Brain MRI Classification
- Analyzes brain MRI images to classify them into one of the following categories:
  - **Mild Demented**
  - **Moderate Demented**
  - **Very Mild Demented**
  - **Non Demented**

### 📈 Built-in Machine Learning Model
- Uses a pre-trained CNN backbone producing output shape `(None, 2048)`
- Followed by:
  - `Flatten`
  - `Dropout`
  - `Dense (128 units)`
  - `Dropout`
  - `Dense (4 units)` for final classification
- Achieves ~99.8% training accuracy and ~99.4% validation accuracy after 10 epochs

### 💾 Save & Manage Results
- Automatically **saves previous analysis results**
- Users can **view** and **delete** individual results

### 🌐 Localization Support
- Fully **localized** for multiple languages (customizable)

### 🌙 Light & Dark Theme
- Supports both **dark mode** and **light mode** for better accessibility

### 📱 Responsive UI
- Optimized for **phones and tablets**
- Clean and minimal design


## 🛠️ Tech Stack

- **Flutter** (cross-platform framework)
- **TensorFlow Lite** (on-device ML inference)
- **GetX** (state management)
- **Hive** (local data storage)

---

## 📦 Future Enhancements

- Model confidence visualization
- Export/share results
- Upload MRI directly from cloud storage
- Doctor feedback integration

---

## 👨‍⚕️ Disclaimer

This app is for **educational and research purposes only** and should not be used as a diagnostic tool without professional medical supervision.

---

## 📸 Screenshots

_Add screenshots here for UI and results preview._

---

## 🧑‍💻 Author

Developed by [fady elzeeky]  
📧 [fadysaied63@gmail.com]  
🌐 [https://www.linkedin.com/in/fady-saied-334b29218/]

## 📸 Screenshots

<div align="center">
  <img src="https://github.com/user-attachments/assets/3c5d8768-5a13-4f3a-b2b5-46c9c4b00fff" width="200"/>
  <img src="https://github.com/user-attachments/assets/b8ab8de9-2243-4e2d-a527-fb63336a93a4" width="200"/>
  <img src="https://github.com/user-attachments/assets/b26629c9-a4d9-4753-9485-3580f7def364" width="200"/>
  <img src="https://github.com/user-attachments/assets/e2b61e73-4eef-4bb4-8bdb-546264b5baa0" width="200"/>
  <img src="https://github.com/user-attachments/assets/f3474cbd-8e94-4cf5-ae01-f3064f7f0d5f" width="200"/>
  <img src="https://github.com/user-attachments/assets/c1555ba8-c2f4-487a-a035-840e3b74c3f3" width="200"/>
  <img src="https://github.com/user-attachments/assets/b040e4b3-e0c3-4096-a283-19d3a3abcc54" width="200"/>
  <img src="https://github.com/user-attachments/assets/a8eb9db4-1e0a-4efa-9e63-09a366150ee4" width="200"/>
  <img src="https://github.com/user-attachments/assets/4bd1eb2c-a280-44e0-855f-718d54ee6bfb" width="200"/>
</div>

