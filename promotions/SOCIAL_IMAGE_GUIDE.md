# Social Preview Image Guide

Create a compelling social preview image that appears when people share your repo on Twitter, LinkedIn, etc.

---

## Required Dimensions

**GitHub Social Preview:** 1280 × 640 pixels (2:1 ratio)

---

## Design Tools (Free Options)

### Option 1: Canva (Easiest)
1. Go to https://www.canva.com/
2. Create custom size: 1280 × 640
3. Use template below
4. Download as PNG

### Option 2: Figma (Most Professional)
1. Go to https://www.figma.com/
2. Create frame: 1280 × 640
3. Design using template below
4. Export as PNG

### Option 3: Online Generator
- https://www.opengraph.xyz/
- https://www.bannerbear.com/demos/github-social-preview-generator/

---

## Design Template

### Background
- Color: Dark gradient (#0D1117 → #161B22) - GitHub dark theme
- Or: Solid (#1a1a1a) - Clean dark
- Or: Brand color with 90% opacity overlay

### Content Layout

```
┌──────────────────────────────────────────────────────────┐
│                                                          │
│              CLAUDE FRUGAL                               │
│         8.8× More Capacity from                          │
│          Claude Code Pro                                 │
│                                                          │
│    ✓ 97% Token Savings                                  │
│    ✓ 350+ Messages per Session                          │
│    ✓ Open Source & MIT Licensed                         │
│                                                          │
│    github.com/nadiradzedavit/claude-frugal              │
│                                                          │
└──────────────────────────────────────────────────────────┘
```

### Typography
- **Main Title:** 72-84px, Bold, White
- **Subtitle:** 48-56px, Medium, Light gray
- **Bullet Points:** 36-42px, Regular, White
- **URL:** 28-32px, Mono font, Gray

### Colors
- Primary text: #FFFFFF (white)
- Secondary text: #8B949E (gray)
- Accent: #58A6FF (GitHub blue) or #00D084 (green for savings)

### Optional Elements
- GitHub logo (small, corner)
- Graph/chart showing 8.8× improvement
- Code snippet aesthetic background (faded)

---

## Text Content for Image

**Version 1: Focus on Results**
```
CLAUDE FRUGAL
8.8× More Capacity from Claude Code Pro

✓ 97% Token Savings
✓ 350+ Messages (vs. 40 Standard)
✓ Open Source & MIT Licensed

github.com/nadiradzedavit/claude-frugal
```

**Version 2: Focus on Problem**
```
Hitting Claude Code Rate Limits?

CLAUDE FRUGAL
97% Token Reduction • 8.8× More Capacity

Precision Reading • Smart Compression • Budget Monitoring

github.com/nadiradzedavit/claude-frugal
```

**Version 3: Focus on Economics**
```
CLAUDE FRUGAL
$20/month → 350+ Messages

Same Quality • 97% Fewer Tokens • Zero Trade-offs

Open Source Efficiency Skills for Claude Code Pro

github.com/nadiradzedavit/claude-frugal
```

---

## Quick DIY with HTML/CSS

Save this as `social-preview.html` and screenshot it at 1280×640:

```html
<!DOCTYPE html>
<html>
<head>
<style>
body {
    margin: 0;
    width: 1280px;
    height: 640px;
    background: linear-gradient(135deg, #0D1117 0%, #161B22 100%);
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
    color: white;
}
h1 {
    font-size: 84px;
    font-weight: 800;
    margin: 0;
    background: linear-gradient(135deg, #58A6FF 0%, #00D084 100%);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
}
h2 {
    font-size: 56px;
    font-weight: 500;
    margin: 20px 0;
    color: #C9D1D9;
}
.features {
    font-size: 38px;
    margin: 30px 0;
    line-height: 1.6;
}
.url {
    font-size: 32px;
    font-family: 'Courier New', monospace;
    color: #8B949E;
    margin-top: 40px;
}
.check {
    color: #00D084;
    margin-right: 10px;
}
</style>
</head>
<body>
    <h1>CLAUDE FRUGAL</h1>
    <h2>8.8× More Capacity from Claude Code Pro</h2>
    <div class="features">
        <div><span class="check">✓</span> 97% Token Savings</div>
        <div><span class="check">✓</span> 350+ Messages per Session</div>
        <div><span class="check">✓</span> Open Source & MIT Licensed</div>
    </div>
    <div class="url">github.com/nadiradzedavit/claude-frugal</div>
</body>
</html>
```

**To create image:**
1. Open in browser (Chrome/Firefox)
2. Set zoom to 100%
3. Use browser screenshot tool (F12 → Cmd+Shift+P → "Capture screenshot")
4. Or use a screenshot tool to capture the exact 1280×640 window

---

## How to Upload to GitHub

1. Go to your repository settings
2. Click "Settings" → scroll down
3. Find "Social preview" section
4. Click "Edit"
5. Upload your image (PNG, max 1MB)
6. Save

**Test it:**
- Share repo URL on Twitter/LinkedIn
- Use https://www.opengraph.xyz/ to preview
- Check it looks good before posting

---

## Pro Tips

### Do:
✅ Keep text large and readable (people view on phones)
✅ High contrast (dark background, light text)
✅ Use brand colors consistently
✅ Include your GitHub URL
✅ Test on multiple devices
✅ Make it shareable-worthy

### Don't:
❌ Use tiny text (won't be readable when scaled down)
❌ Cram too much information
❌ Use busy backgrounds that compete with text
❌ Forget to include the repository name
❌ Use low-resolution images
❌ Make it look like a generic template

---

## Alternative: Screenshot of Terminal

Another approach - screenshot your token calculator in action:

1. Run `python3 demo/token-calculator.py --all`
2. Use a nice terminal theme (e.g., Dracula, Nord)
3. Capture the output
4. Add title overlay in image editor
5. Resize to 1280×640

**Tools for terminal screenshots:**
- https://carbon.now.sh/ (code screenshots)
- iTerm2 (Mac) built-in screenshot
- Windows Terminal built-in screenshot

---

## Inspiration

Check these repos for social preview examples:
- https://github.com/facebook/react
- https://github.com/microsoft/vscode
- https://github.com/vercel/next.js

Look at how they:
- Use consistent branding
- Keep text minimal but impactful
- Make it immediately clear what the project does

---

## Template Files

I've created a simple HTML template above. For more advanced designs:

**Canva Template:** Search "GitHub Social Preview" in Canva templates
**Figma Community:** Search for "Open Graph" templates

---

## Priority

**For initial launch:** Use the HTML template above - it's quick and professional.

**After 50 stars:** Invest in a custom design that matches your brand.

**After 100 stars:** Consider A/B testing different images to see which drives more clicks.

---

## Next Steps

1. [ ] Create image using HTML template or Canva
2. [ ] Upload to GitHub repository settings
3. [ ] Test with Twitter Card Validator: https://cards-dev.twitter.com/validator
4. [ ] Test with LinkedIn Post Inspector: https://www.linkedin.com/post-inspector/
5. [ ] Share a test link to verify it looks good
6. [ ] Launch! 🚀
