# 🛠️ FTB Skies 2 - Docker Container for Unraid  
_An enhanced Minecraft server container built with love, modpacks, and a dash of automation_

## 🌤️ What Is This?

Welcome to your **FTB Skies 2** launchpad — a Docker container fine-tuned for [Unraid](https://unraid.net). It automates setup and gets you skybound in no time. On first run, it pulls down the tagged version of the modpack, installs it fresh, and starts the party. Think of it as your personal Minecraft ground control.

> ⚠️ No modded Minecraft files are pre-bundled. Everything is downloaded on install, keeping things clean and updated.

This container builds upon the solid foundation laid by [Goobaroo’s original FTB Skies Docker repo](https://github.com/Goobaroo/docker-ftbskies), customized for FTB Skies 2 with tweaks and troubleshooting baked in. Big thanks to Goobaroo for the great starting point.

## 📋 Requirements

To keep things flying:

- Mount `/data` to persistent storage
- Map port `25565/tcp` for incoming traffic
- Pass environment variable `EULA=true` to accept Mojang’s license

Without the EULA accepted, Minecraft folds its arms and refuses to cooperate.

## 🔧 Environment Variables

Make your server behave like you want with these settings:

| Variable     | Default                                     | Purpose                                |
|--------------|---------------------------------------------|----------------------------------------|
| `JVM_OPTS`   | `-Xms4096m -Xmx6144m`                        | Java memory configuration              |
| `MOTD`       | `FTB Skies 2 Server Powered by Docker`       | Welcome message on server list         |
| `LEVEL`      | `world`                                      | World folder name                      |
| `OPS`        | `OpPlayer1,OpPlayer2`                        | Grant operator privileges to players   |

### ✨ Granting Operator Access

Want admin rights like it’s your own kingdom? Pass your name(s) into the `OPS` variable like so:

```env
OPS="OpPlayer1,OpPlayer2"
```

## 🧰 Troubleshooting Tips

### ❗ EULA Not Accepted

Verify that `EULA=true` is set. Without it, Minecraft won’t launch. Simple fix, powerful outcome.

### 🛑 File Permission Errors?

The container uses UID `99` and GID `100` to stay compatible with Unraid. On other systems, you might need to change file ownership on `/data` to avoid permission issues.

### 🔁 Reinstall / Reset

Install didn’t complete? Just delete the downloaded server files inside `/data` and restart the container — it’ll begin fresh and re-download what’s needed.

## 📎 Source Links

- 🧪 GitHub: [acidrs03/ftbskies2-docker](https://github.com/acidrs03/ftbskies2-docker)
- 🐳 Docker Hub: [acidrs/ftbskies2](https://hub.docker.com/repository/docker/acidrs/ftbskies2)
- 🙌 Original Inspiration: [Goobaroo/docker-ftbskies](https://github.com/Goobaroo/docker-ftbskies)

---

_Tweak it. Tune it. Launch it. All skies, no limits._