# Multi-Spawnpoint Mod for Minetest

A simple admin-friendly mod to manage **multiple spawnpoints** in Minetest.  
Supports random spawns for players on join/respawn, with easy commands to add, remove, and teleport to spawnpoints.

---

## Features:

- **Multiple spawnpoints** saved permanently (survive server restarts)  
- **Random teleport** for players on join or respawn  
- **Admin commands** to manage spawnpoints:
  - `/addspawn` — Add a spawnpoint at your current position  
  - `/removespawn` — Remove the nearest spawnpoint to your location  
  - `/listspawns` —  See all spawnpoints with their positions  
- `/spawn` — Teleport to a random spawnpoint (available for all players)  

---

## Installation:

1. Place the `multispawn` folder in your `mods/` directory.  
2. Enable the mod in your `world.mt` file:load_mod_multispawn = true
3. Restart the server.

---

##  Commands:

**Admin commands** (require server privilege)  
- `/addspawn` — Adds a spawnpoint where you are standing  
- `/removespawn` — Removes the nearest spawnpoint to you  
- `/listspawns` — Lists all spawnpoints (optional, for admin reference)  

**Player command**  
- `/spawn` — Teleports to a random spawnpoint  

---

## Notes:

- Spawnpoints are saved permanently using Minetest’s mod storage.  
- `/spawn` works for all players, but admins have full control over spawnpoints.  
- `/removespawn` removes the closest spawnpoint, so be careful if multiple spawns are very close together.  
- This mod does not include combat restrictions; teleporting is always allowed.  

---

## Customization:

- You can change the number of spawnpoints or teleport behavior by editing the `init.lua` file.  
- Future upgrades could include:  
- Spawn previews (particles showing spawnpoints)  
- ID-based remove system  
- Team-based spawns or spawn zones  

---

## License:

MIT license 
Free to use and modify. Please give credit if you share publicly.
