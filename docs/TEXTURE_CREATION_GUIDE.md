# Texture Creation Guide

This guide will help you create the 6 custom textures needed for your wooden block resource pack.

## Required Textures

You need to create 6 different texture files in PNG format. **All textures must be 512x512 pixels** (a power of 2).

**Target Resolution: 512x512 pixels**

This resolution provides maximum detail for your wooden block textures and logos. Note that 512x512 textures will use more memory and may slightly impact performance, but they will look extremely detailed in-game.

1. `custom_wood_top.png` - Top face of the block (512x512)
2. `custom_wood_bottom.png` - Bottom face of the block (512x512)
3. `custom_wood_north.png` - North face (front) (512x512)
4. `custom_wood_south.png` - South face (back) (512x512)
5. `custom_wood_east.png` - East face (right side) (512x512)
6. `custom_wood_west.png` - West face (left side) (512x512)

**Important:** All 6 textures must be exactly 512x512 pixels.

## Recommended Free Tools

### 1. MC Image Converter
- **Website**: https://mcimageconverter.com/
- **Best for**: Converting real photos to Minecraft-style pixel art
- **How to use**:
  1. Upload your photo
  2. Set output size to **512x512 pixels**
  3. Adjust pixelation/dithering settings
  4. Download the converted texture
  5. Save with the appropriate name (e.g., `custom_wood_top.png`)

### 2. Pixelcut AI Bedrock Texture Pack Editor
- **Website**: https://www.pixelcut.ai/create/bedrock-texture-pack-editor
- **Best for**: AI-powered texture creation from images
- **How to use**:
  1. Upload your image
  2. Use text prompts to modify the texture
  3. Export at **512x512 pixels**

### 3. GIMP (Free Image Editor) - **RECOMMENDED for 512x512**
- **Website**: https://www.gimp.org/
- **Best for**: Manual editing and adding logos/text at high resolutions
- **How to use**:
  1. Open your photo
  2. Go to Image > Scale Image
  3. Set size to **512x512 pixels**
  4. For pixel art style: Use Filters > Artistic > Cartoon or Filters > Blur > Pixelize
  5. For realistic style: Keep the photo quality or use Filters > Enhance > Sharpen
  6. Add your logo/text manually (512x512 gives you plenty of detail for logos!)
  7. Export as PNG

### 4. Paint.NET (Free Image Editor) - **RECOMMENDED for 512x512 on Windows**
- **Website**: https://www.getpaint.net/
- **Best for**: Simple editing on Windows at high resolutions
- **How to use**:
  1. Open your photo
  2. Go to Image > Resize
  3. Set to **512x512 pixels**
  4. For pixel art: Use Effects > Artistic > Ink Sketch or Effects > Blurs > Pixelate
  5. For realistic: Keep original quality or use Effects > Photo > Sharpen
  6. Export as PNG

## Step-by-Step Process

### Step 1: Prepare Your Photos
- Take or select 6 photos of your wooden block/logo from different angles:
  - One photo looking down at the top
  - One photo looking up at the bottom
  - One photo of the front (north)
  - One photo of the back (south)
  - One photo of the right side (east)
  - One photo of the left side (west)

### Step 2: Convert Photos to Textures
1. Use **GIMP** or **Paint.NET** (recommended for 512x512) or MC Image Converter
2. Upload/open each photo one at a time
3. Resize to **512x512 pixels**
4. Apply effects if desired (pixelate for retro look, or keep realistic)
5. Download/save the converted image

### Step 3: Add Your Logo (Optional)
If you want to add a logo or text to the textures:
1. Open the converted texture in GIMP or Paint.NET
2. Add your logo/text manually
3. At 512x512 resolution, you have plenty of detail for complex logos and text
4. Save as PNG

### Step 4: Name and Place Textures
1. Save each texture with the correct name:
   - `custom_wood_top.png`
   - `custom_wood_bottom.png`
   - `custom_wood_north.png`
   - `custom_wood_south.png`
   - `custom_wood_east.png`
   - `custom_wood_west.png`
2. Place all 6 files in: `hopecubes_resourcepack/assets/minecraft/textures/block/`

## Tips

- **Resolution**: All 6 textures must be exactly **512x512 pixels**
- **Use high contrast**: Minecraft textures work best with clear, distinct colors
- **Test in-game**: After creating textures, test them in Minecraft to see how they look
- **Consistent style**: Try to keep all 6 textures in a similar style/color scheme
- **Logo placement**: At 512x512, you can add very detailed logos and text on any face
- **Performance note**: 512x512 textures use more memory than lower resolutions, but provide maximum detail. If you experience performance issues, you can always scale down to 256x256 or 128x128 later
- **File size**: Each 512x512 PNG will be larger than lower resolution textures, but the quality will be excellent

## Testing Your Textures

1. Copy the entire `hopecubes_resourcepack` folder to:
   - Windows: `%appdata%\.minecraft\resourcepacks\`
   - Or: `C:\Users\[YourUsername]\AppData\Roaming\.minecraft\resourcepacks\`
2. Launch Minecraft
3. Go to Options > Resource Packs
4. Enable "Custom Wooden Block Resource Pack" (or whatever name appears)
5. Enter a world and place mushroom stem blocks to see your custom textures!

