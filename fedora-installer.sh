#!/bin/bash


# The Fedora Installer


# Copyright 2020 Prashast Singh Chauhan.

# UE4 Installer is a free software: You can redistribute  # it and/or modify under the terms of GNU GPL as published # by the Free Software Foundation as per version 3 or

# above 


# Start here


# First install all the dependencies.

echo "Installing dependencies..."

sudo dnf install make dos2unix cmake gtk3-devel glib2-devel libgdiplus SDL2* mono-core mono-devel qt-devel

echo "All dependencies are successfully  installed."


# Now remove unnecessary files

echo "Deleting unnecessary files"

rm Setup.bat

rm Setup.command

rm GenerateProjectFiles.bat

rm GenerateProjectFiles.command

echo "All unnecessary files successfully deleted"



# Then install Clang, a compiler for C++ used by UE4.

echo "Installing the Clang compiler for C++" 

sudo wget http://llvm.org/releases/3.5.0/clang+llvm-3.5.0-x86_64-fedora20.tar.xz

sudo tar xvf clang+llvm-3.5.0-x86_64-fedora20.tar.xz && cd clang+llvm-3.5.0-x86_64-fedora20 && sudo cp -R * /usr/local/

clang --version

echo "Clang installed"


# Now run the main setup files

echo "Running the setup file..."

./Setup.sh

echo "Setup file has successfully created the environment for UE4 to run"

echo "Running Project File Generator..."

./GenerateProjectFiles.sh

echo "Project files have successfully been generated."


# Start the compilation

echo "Running make files to compile all scripts and programs... This might take a while"

make CrashReportClient ShaderCompileWorker UnrealLightmass UnrealPak UE4Editor 

echo "Unreal Engine 4 might have successfully been installed. If any error has occurred please make sure you have all the latest drivers installed for your GPU"

echo "To check whether it’s installed or not, run the  following shell script:"

echo "cd 'Engine/Binaries/Linux'"

echo "./UE4Editor"


# End Here



