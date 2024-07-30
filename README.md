# Mobile Application
Application is developed using flutter and the temporary backend deployment is made on `render`. The application is fully functional on an Android phone, one user can log in, add hospital data, and roam around in the Application according to its use.

## Getting started
### Prerequisites
Since this is a typical flutter application, one must make sure that they have flutter setup locally before getting started with installing. If not then refer: https://docs.flutter.dev/get-started/install/windows/mobile

### Setup application locally
- Open your VSCode (Desired IDE), and navigate to the desired folder where you want to store the application.
- Once your IDE is ready then in the terminal run the following command:
```
git clone https://github.com/AkshitGuptaIITR/Medapp
```
- Once the repository is cloned locally then run:
```
flutter pub get
```
## Running the Application

### Using an Emulator

#### For Android:

1. **Install Android Studio**: Download and install Android Studio from [developer.android.com](https://developer.android.com/studio).
2. **Set Up an Android Emulator**:
   - Open Android Studio.
   - Go to `Configure` > `AVD Manager`.
   - Click `Create Virtual Device`.
   - Select a device definition and click `Next`.
   - Select a system image and click `Next`.
   - Click `Finish` to create the AVD.
   - Click the play button in the AVD Manager to start the emulator.

#### For iOS (macOS only):

1. **Install Xcode**: Download and install Xcode from the Mac App Store.
2. **Set Up an iOS Simulator**:
   - Open Xcode.
   - Go to `Xcode` > `Preferences` > `Components`.
   - Install the simulator you want.
   - Open the iOS simulator from `Xcode` > `Open Developer Tool` > `Simulator`.

### Using a Physical Device

#### For Android:

1. **Enable Developer Options**: Enable Developer Options on your Android device by tapping the build number in the "About phone" section 7 times.
2. **Enable USB Debugging**: Enable USB Debugging in the Developer Options.
3. **Connect Your Device**: Connect your device to your computer via USB.

#### For iOS (macOS only):

1. **Connect Your Device**: Connect your iPhone to your Mac using a USB cable.
2. **Trust the Device**: Trust the device if prompted.
3. **Ensure Device Detection**: Ensure your device is detected by running `flutter devices` in the terminal.

### Running the Application

1. **Open Your Flutter Project**:
   ```sh
   cd medapp
## Tech Stacks
In the development of this application, flutter is used for mobile application development. Whereas `nodejs` along with `mongoDB` is being used as a backend to store data login user and save data securely.
Temporarily backend is being hosted on render, which can be accessed via link: https://medapp-backend.onrender.com/api/v1.
- Backend repository can be accessed on github via: https://github.com/AkshitGuptaIITR/MedApp-backend
