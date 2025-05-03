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
  <img src="https://github.com/user-attachments/assets/ae2eb116-2a8f-43db-ac29-3285c6c07d17" width="200"/>
  <img src="https://github.com/user-attachments/assets/6169f18b-3201-451e-b16f-4f2d214e8f62" width="200"/>
  <img src="https://github.com/user-attachments/assets/575f72e9-85ed-48a1-b32f-00254cdf233c" width="200"/>
  <img src="https://github.com/user-attachments/assets/f5d825cb-ea13-46d8-b739-ceb727531ce6" width="200"/>
  <img src="https://github.com/user-attachments/assets/ac7bfaf9-9981-4e81-bb74-f12da33037f2" width="200"/>
  <img src="https://github.com/user-attachments/assets/bb2fc7e2-2f19-4eea-af46-b1134e7277b8" width="200"/>
  <img src="https://github.com/user-attachments/assets/706aeb0f-81d0-488e-a65d-6bd87a65dff2" width="200"/>
  <img src="https://github.com/user-attachments/assets/4ff1f29b-4706-4c62-be89-4654877a2580" width="200"/>
  <img src="https://github.com/user-attachments/assets/acd96ce8-78f0-4bf4-97fa-fd5e6447971b" width="200"/>
</div>
