# Installation & Testing Guide

## Quick Installation Steps

### 1. Locate Your Minecraft Resource Packs Folder

On Windows, the resource packs folder is located at:
```
%appdata%\.minecraft\resourcepacks
```

Or the full path:
```
C:\Users\[YourUsername]\AppData\Roaming\.minecraft\resourcepacks
```

### 2. Copy the Resource Pack

Copy the entire `hopecubes_resourcepack` folder to the resourcepacks directory above.

**Important:** Copy the folder itself, not just the contents. The folder name will appear in Minecraft's resource pack list.

### 3. Enable the Resource Pack in Minecraft

1. Launch Minecraft (version 1.21.11)
2. Go to **Options** (or **Settings**)
3. Click on **Resource Packs**
4. You should see "Custom Wooden Block Resource Pack" (or the folder name) in the available packs list
5. Click the arrow (►) to move it to the active resource packs (right side)
6. Make sure it's at the top of the active list if you have other resource packs
7. Click **Done**

### 4. Test Your Custom Block

1. Enter a world (create a new one or use an existing one)
2. Get mushroom stem blocks (you can use creative mode or `/give @s minecraft:mushroom_stem`)
3. Place the mushroom stem blocks
4. Your custom wooden block textures should now appear!

### 5. Verify All Sides

To see all 6 different textures:
- Look at the block from different angles
- Place multiple blocks and rotate your view
- The top, bottom, and all 4 sides should show your custom textures

## Troubleshooting

### Resource Pack Not Showing Up
- Make sure you copied the entire folder, not just the contents
- Check that `pack.mcmeta` is in the root of the folder
- Verify the folder is in the correct `resourcepacks` directory

### Textures Not Appearing
- Make sure all 6 texture files are exactly 512x512 pixels
- Verify all texture files are named correctly (case-sensitive):
  - `custom_wood_top.png`
  - `custom_wood_bottom.png`
  - `custom_wood_north.png`
  - `custom_wood_south.png`
  - `custom_wood_east.png`
  - `custom_wood_west.png`
- Check that textures are in `assets/minecraft/textures/block/` folder
- Make sure the resource pack is enabled and at the top of the active list

### Game Crashes or Performance Issues
- 512x512 textures use more memory. If you experience issues, try:
  - Closing other applications
  - Reducing render distance
  - Using lower resolution textures (256x256 or 128x128)

### Still Seeing Mushroom Stem
- Make sure you're placing **mushroom stem** blocks (not other blocks)
- Verify the resource pack is enabled
- Try restarting Minecraft
- Check that the model file exists at `assets/minecraft/models/block/mushroom_stem.json`

## File Structure Check

Your resource pack should have this structure:
```
hopecubes_resourcepack/
├── pack.mcmeta
├── assets/
│   └── minecraft/
│       ├── blockstates/
│       │   └── mushroom_stem.json
│       ├── models/
│       │   └── block/
│       │       └── mushroom_stem.json
│       └── textures/
│           └── block/
│               ├── custom_wood_top.png (512x512)
│               ├── custom_wood_bottom.png (512x512)
│               ├── custom_wood_north.png (512x512)
│               ├── custom_wood_south.png (512x512)
│               ├── custom_wood_east.png (512x512)
│               └── custom_wood_west.png (512x512)
```

## Enjoy Your Custom Block!

Your custom wooden block should now be working in Minecraft! The mushroom stem block will display your custom textures on all 6 sides.

