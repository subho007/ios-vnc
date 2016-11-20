# iOS VNC forked from Saurik's Repo

## Installation

1. Make sure theos is installed in `/opt/theos`
2. This compiles against iOS7.1 SDK. You can download the SDK from [https://dl.dropboxusercontent.com/u/3784997/iPhoneOS7.1.sdk.zip](https://dl.dropboxusercontent.com/u/3784997/iPhoneOS7.1.sdk.zip)
3. Change the `library.sh` to point to the direction of the SDK
4. run `cd libvncserver && ./autogen.sh`
5. Inside libvncserver run `make distclean`
6. Just to make sure, delete `config.status` by `rm config.status`
7. Next run `./library.sh`
8. run `make package` to get the .deb file
