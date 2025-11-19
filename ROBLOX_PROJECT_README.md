Roblox Project Scaffold
======================

What this contains
- `default.project.json`: Rojo mapping for the project tree.
- `src/server/main.server.lua`: Server script (leaderstats, spawns a part, fires welcome RemoteEvent).
- `src/client/main.client.lua`: LocalScript (listens for welcome RemoteEvent and shows a small GUI).
- `plugin/hello.plugin.lua`: Simple Roblox Studio plugin that inserts a part at origin.
- `snippets/paste_server_script.lua`: Small server Script you can paste into `ServerScriptService`.
- `snippets/paste_local_script.lua`: Small LocalScript you can paste into `StarterPlayerScripts`.

How to use

- Option: Rojo (recommended for source-driven workflow)
  1. Install Rojo: `npm install -g @rojo/core` (or follow Rojo docs for your platform).
  2. Run `rojo build -o RobloxProject.rbxlx` to build a `.rbxlx` you can open in Roblox Studio, or run `rojo serve` while using the Rojo plugin in Studio to sync live.

- Option: Direct paste/use in Roblox Studio
  - Open Studio and create a new place.
  - Copy `snippets/paste_server_script.lua` into a new Script under `ServerScriptService`.
  - Copy `snippets/paste_local_script.lua` into a new LocalScript under `StarterPlayer > StarterPlayerScripts`.
  - To use the plugin, place `plugin/hello.plugin.lua` into `Plugins` (or install via plugin packaging) and enable it in Studio.

Notes
- The `default.project.json` is a minimal Rojo mapping. Adjust paths/classes for your workflow.
- The example scripts are intentionally small so you can extend them for gameplay (leaderboards, items, GUI).

New features added
- `src/server/coinspawner.server.lua`: spawns collectible coins periodically; touching a coin increments the player's `Points`.
- `src/gui/leaderboard.client.lua`: client UI that displays the player's `Points` in the corner of the screen.

Plugin packaging
- `plugin/hello.plugin.lua` is a simple example plugin. See `plugin/README_PLUGIN.md` for install notes.

Next steps I can do for you
- Commit these files and create a git branch.
- Add a basic Leaderboard UI, spawn system, or a simple game loop.
- Package the plugin for Studio installation.
