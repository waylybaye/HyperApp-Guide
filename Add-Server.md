# Add Server

english version | [中文版](./Add-Server_zh.md)

![Servers](https://github.com/waylybaye/HyperApp-Guide/raw/master/images/manage-server.png "Servers")

Click the plus button to add your own server:

1. Docker automation need a root user or a user with sudo permission.
    * Name: Set a name for your server.
    * Host: Your server's IP address or domain.
    * Port: The SSH server port, normally it's 22.
    * User: Your username
    * Password: Your password, if you authenticate using pubkey then leave it blank.

2. If you authenticate using pubkey, then please copy the private key content to your phone and click "Paste Privatekey from Clipboard", fill the `passhprase` too if your private key is crypted.


---


## How to add Linode/Vultr/Digital Ocean VPS？

They all provide root login with password, you can simply input the root's password.

**NOTE**：Some images of Digital Ocean force you to change your password when first login, please change the password before add it to HyperApp.


## Google Cloud Engine


Please refer to Google's document about [How to connecting to Linux Instances](https://cloud.google.com/compute/docs/instances/connecting-to-instance)

Copy your private key to your mobile device and click "Paste Private Key from Clipboard" when you finished adding pub key to your GCE account.


