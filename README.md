# German Stahlhelm Collection

Historically-inspired **WW2 German helmets** for **Barotrauma** — focused on authenticity, clean balancing, and lore-rich flavor texts.  
Every helmet is built as a proper `Wearable` item with unique textures, factory codes, and lot numbers drawn from real examples.

---

## ✨ What’s inside

- **M42 series** (initial wave):  
  - Heer (WH) — *Normandy camo* (ckl64 lot 2979)  
  - Heer — *single decal* ET64 (lot 3119)  
  - Luftschutz — *beaded* EF66 (lot 1047)  
  - Luftschutz — *beaded* hkp64 (lot 1554)
- **Balanced protection** (steel lids, not sci-fi):
  - Cuts / gunshot / blunt reduced, **concussion still felt**.
- **Integrated economy & loot**:
  - Craft at **workbench** with **steel + organic fiber**.  
  - Deconstruct returns **steel**.  
  - Natural spawn routing to armories, wrecks, outposts (variant-dependent).
- **Lore-first localization**:
  - Each helmet has a short, atmospheric description (factory, lot, field hints).
- **Consistent asset naming**:
  - **Identifier = sprite names = PNG filename** (e.g. `oh_42_wh_c1.png`).

---

## 🧭 Roadmap / Planned Models

- **M42** (many more variants)  
- **M40, M35, M38, M34, M16, M17, M18, M18 Earcut, M44/45**

All helmets are based on **real-life examples**; **~99% are original, not restored**.  
Some pieces are from my own collection.

---

## ⚖️ Balance & Pricing

Helmets inherit common protection from a shared base template. Prices follow a simple, transparent system:

**Branch value (baseline = Heer = 1.0x)**  

- SA **2.3x** · SS **2.0x** · KM **1.6x** · WH **1.0x** · LW **0.9x** · Luftschutz **0.8x**

**Appearance bonuses**  

- Camo **×1.6** · Chickenwire **×2.2** · Net/loops **×1.5**  
- Single decal **×1.2** · Double decal **×1.4** · Beaded shell **×1.4**

> Final price = **BaseWH × Branch × (Appearance multipliers)**  
> Default BaseWH used in this pack: **500**

---

## 🛠️ Crafting & Deconstruction

- **Fabrication** (workbench):  
  - `steel ×2` + `organicfiber ×1` (basic mechanical skill)  
- **Deconstruction**:  
  - returns `steel ×1`

---

## 🔎 Identifiers

Short, structured IDs keep things tidy (and debugging fast):

oh_`model``branch``type``#`

- `model`: `42`, `40`, `35`, …  
- `branch`: `wh` (Heer), `lw` (Luftwaffe), `km` (Kriegsmarine), `ss`, `sa`, `ls` (Luftschutz)  
- `type`: `c` (camo), `sd` (single-dec), `dd` (double-dec), `bd` (beaded), etc.  
- `#`: running number per type (e.g., `c1`, `sd1`)

**Examples:**  

- `oh_42_wh_c1` — M42 Heer, camo #1  
- `oh_42_wh_sd1` — M42 Heer, single-dec #1  
- `oh_42_ls_bd2` — M42 Luftschutz, beaded #2

> Texture filenames **match the identifier** (e.g. `oh_42_wh_c1.png`).

---

## ❓ FAQ

**Q: Will you create a pack for X country?**  
A: Probably not, but feel free to ask.

**Q: Will you censor it?**  
A: No. If you are not comfortable with historically accurate symbols, you should probably avoid the World War II hobby and genre.

**Q: Can you add X helmet?**  
A: Maybe. Ask away and I’ll see what I can do.

**Q: Is this compatible with X?**  
A: Probably. No known incompatibilities.

**Q: Will you add other headwear?**  
A: Maybe. It might become its own pack; not sure yet.

---

## 🤝 Help Wanted

I’m looking for an **experienced Lua writer/modder** for Barotrauma to help implement **orientation-aware helmet sides** (left/right-specific textures while worn).  
If that’s you, please open an issue or reach out.

---

## 📜 Credits

- Research & textures: historical examples, factory codes (ckl, ET, EF, hkp), and lot numbers.  
- Balance & XML structure: built to fit cleanly with vanilla Barotrauma conventions.  
- Thanks to the Barotrauma modding community for documentation and examples.

---

## 📦 Package

**Package Name:** `German Stahlhelm Collection`  
**Package Version:** `0.1.0`
