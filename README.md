# Custom Wooden Block Resource Pack

This resource pack replaces the mushroom stem block with a custom wooden block featuring different textures on each side.

## Quick Start

1. **Create your textures**: Follow the instructions in [`docs/TEXTURE_CREATION_GUIDE.md`](docs/TEXTURE_CREATION_GUIDE.md) to create 6 texture files from your photos. All textures must be **512x512 pixels** (all 6 files must be the same resolution)
2. **Place textures**: Put your 6 PNG files in `hopecubes_resourcepack/assets/minecraft/textures/block/` with these exact names:
   - `custom_wood_top.png`
   - `custom_wood_bottom.png`
   - `custom_wood_north.png`
   - `custom_wood_south.png`
   - `custom_wood_east.png`
   - `custom_wood_west.png`
3. **Install**: Copy the entire `hopecubes_resourcepack` folder to:
   - `%appdata%\.minecraft\resourcepacks\`
   - Or: `C:\Users\[YourUsername]\AppData\Roaming\.minecraft\resourcepacks\`
4. **Enable**: Launch Minecraft → Options → Resource Packs → Enable this pack
5. **Test**: Place mushroom stem blocks in-game to see your custom textures!

## Documentation

- **[Installation & Testing Guide](docs/INSTALLATION.md)** - Detailed installation instructions and troubleshooting
- **[Texture Creation Guide](docs/TEXTURE_CREATION_GUIDE.md)** - Step-by-step guide for creating custom textures from photos
- **[Server Setup Guide](docs/SERVER_SETUP.md)** - Complete instructions for setting up automatic resource pack distribution on Paper servers

## Files Included

- `pack.mcmeta` - Resource pack metadata (Minecraft 1.21.11)
- `assets/minecraft/blockstates/mushroom_stem.json` - Block state definition
- `assets/minecraft/models/block/mushroom_stem.json` - Block model with 6-sided textures
- `create_server_pack.ps1` - PowerShell script to create server resource pack ZIP (Windows)
- `create_server_pack.sh` - Bash script to create server resource pack ZIP (Linux/Mac)

## Server Setup (Paper/Spigot)

If you want to automatically distribute this resource pack to players on your server, see [`docs/SERVER_SETUP.md`](docs/SERVER_SETUP.md) for complete instructions on:
- Packaging the resource pack as a ZIP (using the provided scripts)
- Configuring server.properties
- Hosting the resource pack
- Setting up automatic downloads

## Next Steps

- **For texture creation**: See [`docs/TEXTURE_CREATION_GUIDE.md`](docs/TEXTURE_CREATION_GUIDE.md) for detailed instructions on creating your custom textures from real photos using free tools like MC Image Converter, GIMP, or Paint.NET.
- **For installation**: See [`docs/INSTALLATION.md`](docs/INSTALLATION.md) for detailed installation steps and troubleshooting.
- **For server setup**: See [`docs/SERVER_SETUP.md`](docs/SERVER_SETUP.md) for instructions on setting up automatic resource pack distribution on your Paper server.

