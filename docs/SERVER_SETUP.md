# Paper Server Setup Guide

This guide will help you set up your custom resource pack on a Paper Minecraft server so that clients automatically download it when they connect.

## Step 1: Package Your Resource Pack

First, you need to create a ZIP file of your resource pack.

### Option A: Using the Provided Scripts (Recommended)

We provide scripts to automatically create the ZIP file with the correct structure:

**Windows (PowerShell):**
```powershell
.\create_server_pack.ps1
```

**Linux/Mac (Bash):**
```bash
chmod +x create_server_pack.sh
./create_server_pack.sh
```

These scripts will:
- Create `hopecubes_resourcepack.zip` with the correct structure
- Calculate the SHA-1 hash automatically
- Display the hash for you to copy

### Option B: Using Windows File Explorer
1. Navigate to the `hopecubes_resourcepack` folder
2. Select all files and folders inside (Ctrl+A)
3. Right-click → Send to → Compressed (zipped) folder
4. Rename the ZIP file to `hopecubes_resourcepack.zip`

**Important:** Make sure the ZIP file contains the folder structure starting with `pack.mcmeta` and `assets/` at the root level of the ZIP, not a nested folder.

### Option C: Using PowerShell Manually
```powershell
cd hopecubes_resourcepack
Compress-Archive -Path "*" -DestinationPath "..\hopecubes_resourcepack.zip" -Force
cd ..
```

## Step 2: Host Your Resource Pack

You have two options for hosting:

### Option A: Host on Your Server (Recommended for Small Packs)

1. Upload `hopecubes_resourcepack.zip` to your server
2. Place it in a web-accessible directory (or use a simple HTTP server)
3. Get the direct download URL (e.g., `http://your-server.com/resourcepacks/hopecubes_resourcepack.zip`)

https://github.com/rohansampson/thn_minecraft/releases/download/0.1/hopecubes_resourcepack.zip

### Option B: Use External Hosting

Upload your ZIP file to a reliable hosting service:
- **GitHub Releases** (free, reliable)
- **Dropbox** (get direct link)
- **Google Drive** (get direct link)
- **Your own web server**

**Important:** The URL must be a direct download link (not a page that requires clicking a download button).

## Step 3: Calculate SHA-1 Hash

Minecraft requires a SHA-1 hash to verify the resource pack integrity.

### On Windows (PowerShell):
```powershell
Get-FileHash -Path "hopecubes_resourcepack.zip" -Algorithm SHA1
```

Copy the hash value (it will look like: `A1B2C3D4E5F6...`)
BDDFE2FD6092983C5EC9542C083B28C7411512DE

**Note:** The provided scripts (`create_server_pack.ps1` and `create_server_pack.sh`) will automatically calculate and display the SHA-1 hash for you.

### On Linux/Mac:
```bash
sha1sum hopecubes_resourcepack.zip
```

### Online Tool:
You can also use an online SHA-1 calculator if needed.

## Step 4: Configure server.properties

Edit your server's `server.properties` file and add/modify these lines:

```properties
# Resource Pack Configuration
resource-pack=https://your-server.com/resourcepacks/hopecubes_resourcepack.zip
resource-pack-sha1=YOUR_SHA1_HASH_HERE
require-resource-pack=false
resource-pack-prompt="This server uses a custom resource pack. Download it to see custom blocks!"
```

### Configuration Options:

- **`resource-pack`**: The direct URL to your ZIP file
- **`resource-pack-sha1`**: The SHA-1 hash you calculated (without spaces)
- **`require-resource-pack`**: 
  - `false` = Optional (players can decline)
  - `true` = Required (players must accept to join)
- **`resource-pack-prompt`**: Custom message shown to players (optional) - **Must be a valid JSON string** (wrap in quotes)

### Example Configuration:

```properties
resource-pack=https://github.com/yourusername/repo/releases/download/v1.0/hopecubes_resourcepack.zip
resource-pack-sha1=a1b2c3d4e5f6789012345678901234567890abcd
require-resource-pack=false
resource-pack-prompt="Download the custom resource pack to see our special wooden blocks!"
resource-pack-id=65177c29-2639-4981-9294-ed3435fc4c38
```

## Step 5: Restart Your Server

1. Save the `server.properties` file
2. Restart your Paper server
3. The resource pack will now be offered to players when they connect

## Step 6: Test the Setup

1. Connect to your server with a Minecraft client
2. You should see a prompt asking to download the resource pack
3. Accept the download
4. The resource pack should automatically apply
5. Place mushroom stem blocks to verify your custom textures appear

## Troubleshooting

### Resource Pack Not Downloading

**Check the URL:**
- Make sure the URL is accessible from outside your network
- Test the URL in a browser - it should directly download the ZIP file
- If using GitHub, use the "raw" or "direct download" link
- If using Google Drive, use a direct download link generator

**Check the SHA-1 Hash:**
- Make sure there are no spaces in the hash
- Make sure you're using SHA-1, not SHA-256 or MD5
- Recalculate the hash if you've updated the ZIP file

**Check server.properties:**
- Make sure there are no typos in the property names
- Ensure the URL is on a single line (no line breaks)
- Restart the server after making changes

### JSON Parsing Error for resource-pack-prompt

If you see an error like `JsonSyntaxException: MalformedJsonException` when starting your server, it means the `resource-pack-prompt` value is not in valid JSON format.

**The Fix:**
The `resource-pack-prompt` must be a valid JSON string. Wrap your message in double quotes:

```properties
# ❌ WRONG - This will cause a JSON parsing error
resource-pack-prompt=Custom resources made by The Hope Network to make you comfortable!

# ✅ CORRECT - Wrap in quotes to make it a valid JSON string
resource-pack-prompt="Custom resources made by The Hope Network to make you comfortable!"
```

**Alternative JSON Text Component Format:**
You can also use a full JSON text component object for more formatting options:

```properties
resource-pack-prompt={"text":"Custom resources made by The Hope Network to make you comfortable!"}
```

**Note:** In Paper 1.21.11+, the `resource-pack-prompt` field requires valid JSON, not plain text.

### Players Can't See Custom Textures

**Verify the Resource Pack:**
- Make sure players accepted the resource pack download
- Check that the resource pack is enabled in their client
- Players can check: Options → Resource Packs → should see your pack enabled

**Check File Structure:**
- Open the ZIP file and verify it contains:
  - `pack.mcmeta` at the root
  - `assets/` folder at the root
  - All texture files are present

**Server Logs:**
- Check server logs for any resource pack errors
- Look for messages about failed downloads or hash mismatches

### Resource Pack Too Large

Minecraft has size limits for server resource packs:
- **1.19+**: 250 MB limit
- **1.18 and below**: 100 MB limit

If your pack is too large:
- Consider reducing texture resolution (512x512 → 256x256 or 128x128)
- Remove unnecessary files
- Compress images further

### Using a Plugin (Advanced)

For more control, you can use the **ForcePack** plugin:

1. Download ForcePack from [Modrinth](https://modrinth.com/plugin/forcepack)
2. Place it in your `plugins/` folder
3. Configure it in `plugins/ForcePack/config.yml`
4. This allows features like:
   - Multiple resource packs
   - Per-world resource packs
   - Custom messages
   - Live reloading

## Alternative: Local File Method

If your server and clients are on the same network, you can use a local file path:

```properties
resource-pack=file:///path/to/hopecubes_resourcepack.zip
```

However, this only works for local clients and is not recommended for hosted servers.

## Security Note

- **SHA-1 Hash**: The hash is meant to be public - it's sent to clients for integrity verification. It doesn't reveal your resource pack contents and helps ensure players download the correct, unmodified pack. It's safe to include in public documentation or server.properties.
- **Resource Pack URL**: Always use HTTPS URLs when possible to prevent man-in-the-middle attacks
- **URL Privacy**: If you want to keep your resource pack private, don't share the download URL publicly. However, the hash itself can be public without security concerns
- **Protection**: The hash protects against accidental corruption or tampering, but if someone controls both the URL and can create a matching hash, they could replace your pack. Use trusted hosting services (like GitHub Releases) to minimize this risk

## Summary

1. ✅ Package resource pack as ZIP
2. ✅ Host ZIP file and get direct download URL
3. ✅ Calculate SHA-1 hash
4. ✅ Configure `server.properties`
5. ✅ Restart server
6. ✅ Test with a client

Your resource pack should now automatically download for all players connecting to your Paper server!

