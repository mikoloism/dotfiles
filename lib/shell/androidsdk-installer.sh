#!/usr/bin/env bash


configure_path() {
  echo "# java (jdk, jre, jvm)"                                                                          >>"$HOME/.bashrc"
  JAVA_HOME=$(dirname $( readlink -f $(which java) ))
  echo "export JAVA_HOME=\"$(realpath "$JAVA_HOME"/../)\""                                               >>"$HOME/.bashrc"
  echo "export JAVA_PATH=\"/usr/bin/java\""                                                              >>"$HOME/.bashrc"
  echo "export PATH=\"\$PATH:\$JAVA_HOME/bin\""                                                          >>"$HOME/.bashrc"
  echo "# java end"                                                                                      >>"$HOME/.bashrc"

  echo "# android (cmdline-tools, platform-tools, tools)"                                                >>"$HOME/.bashrc"
  echo "export ANDROID_HOME=\"/opt/android-sdk\""                                                        >>"$HOME/.bashrc"
  echo "export ANDROID_SDK_ROOT=\"/opt/android-sdk\""                                                    >>"$HOME/.bashrc"
  echo "export ANDROID_SDK_HOME=\"\$HOME/.android\""                                                     >>"$HOME/.bashrc"
  echo "export PATH=\"\$PATH:\$ANDROID_HOME/tools\""                                                     >>"$HOME/.bashrc"
  echo "export PATH=\"\$PATH:\$ANDROID_HOME/platform-tools\""                                            >>"$HOME/.bashrc"
  echo "export PATH=\"\$PATH:\$ANDROID_HOME/cmdline-tools/bin:\$ANDROID_HOME/cmdline-tools/latest/bin\"" >>"$HOME/.bashrc"
  echo "# android end"                                                                                   >>"$HOME/.bashrc"

  echo "# gradle"                                                                                        >>"$HOME/.bashrc"
  echo "export GRADLE_HOME=\"/opt/gradle/gradle-8.6\""                                                   >>"$HOME/.bashrc"
  echo "export PATH=\"\$PATH:\$GRADLE_HOME/bin\""                                                        >>"$HOME/.bashrc"
  echo "# gradle end"                                                                                    >>"$HOME/.bashrc"
}


echo "Update Repository"
sudo apt-get update

echo "Install JAVA"
sudo apt-get install default-jdk openjdk-17-jdk
sudo apt-get install default-jre
sudo update-alternatives --config java

# Android Studio
echo "Install Android Studio"

echo "  - create direction"
mkdir "$HOME/android-sdk"
cd "$HOME/android-sdk"

echo "  - download commandline-tools"
ANDROID_SDK_CMDLINE_URL="https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip"
wget -O "commandlinetools.zip" "$ANDROID_SDK_CMDLINE_URL"
unzip "commandlinetools.zip"
mkdir "$HOME/android-sdk/cmdline-tools/latest"
mv "$HOME/android-sdk/cmdline-tools/bin" "$HOME/android-sdk/cmdline-tools/latest/bin"
mv "$HOME/android-sdk/cmdline-tools/lib" "$HOME/android-sdk/cmdline-tools/latest/lib"
mv "$HOME/android-sdk/cmdline-tools/NOTICE.txt" "$HOME/android-sdk/cmdline-tools/latest/NOTICE.txt"
mv "$HOME/android-sdk/cmdline-tools/source.properties" "$HOME/android-sdk/cmdline-tools/latest/source.properties"

echo "  - download platform-tools"
ANDROID_SDK_PLATFORMTOOLS_URL="https://dl.google.com/android/repository/platform-tools-latest-linux.zip"
wget -O "platformtools.zip" "$ANDROID_SDK_PLATFORMTOOLS_URL"
unzip "platformtools.zip"

echo "  - move to /opt"
cd "$HOME"
mv "$HOME/android-sdk" "/opt/android-sdk"

echo "   - install prerequirements (even 32bit)"
sudo apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386

echo "  - setup PATH"
configure_path

echo "  - install SDKs"
# Update
sdkmanager --update

# CMDLine
sdkmanager "cmdline-tools;latest"

# tools
sdkmanager "tools"

# android 13.0
sdkmanager "platform-tools" "platforms;android-33" "build-tools;33.0.3"

# android 8.0
sdkmanager "platform-tools" "platforms;android-26" "build-tools;26.0.3"

# CMake
sdkmanager "cmake;3.22.1"

# install Native Development Kit
sdkmanager "ndk-bundle" "ndk;26.1.10909125"

# emulator
sdkmanager "emulator"

# Setup Gradle
echo "  - download gradle"
GRADLE_BIN_URL="https://services.gradle.org/distributions/gradle-8.6-bin.zip"
wget -O "gradle-bin.zip" "$GRADLE_BIN_URL"
sudo mkdir "/opt/gradle"
sudo unzip -d "/opt/gradle" "gradle-bin.zip"


### Android Studio (GUI)
# ln -sf /opt/android-studio /usr/local/android-studio
###
