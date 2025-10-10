## Ngrok Configuration

[Agent Config Version 3](https://ngrok.com/docs/agent/config/v3)

The agent configuration file location depends on your system. You can check the
location of your configuration file by running `ngrok config check` or edit the
file in your terminal by running `ngrok config edit`

### Find your ngrok config file

The location of the ngrok.yml configuration file varies depending on your operating
system. To find it, open your terminal and run the following command:

```sh
ngrok config check
```

The output will show you the file path. Common locations include:

* Linux: `~/.config/ngrok/ngrok.yml`
* macOS: `~/Library/Application\ Support/ngrok/ngrok.yml`

### Create a Symbolic Link (macOS)

Create a symbolic link to the actual configuration file:

```sh
mkdir -p ~/.config/ngrok
ln -s ~/Library/Application\ Support/ngrok/ngrok.yml ~/.config/ngrok
```

#### Example Configuration

```yaml
version: "3"
agent:
    authtoken: "your_authtoken"
    console_ui_color: "transparent"
```
