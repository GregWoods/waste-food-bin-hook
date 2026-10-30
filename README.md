# Waste food caddy hook

A hook that screws to the inside of a shaker-style cupboard door to hold a
kitchen waste food caddy. A 10 mm round rail stands off from a back plate; the
caddy's rear hook drops over the rail into the 4 mm slot between rail and plate.

## Design

- **80 mm wide**, about 150 mm tall.
- **Shaker door fit**: the centre panel of a shaker door is too thin to screw
  into, so the back plate extends upward and the two countersunk screw holes
  sit in the top 50 mm, which screws to the solid door frame. The lower section
  has 5.5 mm of rear packing that fills the recessed panel, so the plate bears
  flat. A small chamfer at the step clears the moulding where panel meets frame.
- **Screws**: No.6 / 3.5 mm countersunk wood screws (4 mm clearance holes,
  22 mm in from each end).
- **Tape recess**: an optional 45 × 34 mm, 1 mm deep pocket on the back of the
  packing (centred, 30 mm up from the bottom edge) for a piece of double-sided
  tape. Turn it off with `tape_recess = false`.
- **Test piece**: set `test_piece = true` for a 10 mm wide full-height slice of
  the profile. It prints the same layers as the full part, just fewer of them,
  so you can check the fit on the door and caddy cheaply.

All dimensions are parameters at the top of `waste-food-bin-hook.scad`.

## Printing

The model is exported standing on one end (`print_upright = true`), with the
rail profile on the bed. The rail then needs no support, and the layer lines run
across the bending load instead of along it. The ends are flush, so nothing
overhangs.

### Recommended slicer settings

| Setting | Value |
|---------|-------|
| Nozzle | 0.6 mm |
| Quality | `fast` (0.45 mm layers, the nozzle's maximum) |
| Walls | 4 |
| Infill | 10% |
| Supports | none |
| Adhesion | 5 mm brim (tall, narrow footprint on the bed) |

Four walls with a 0.6 mm nozzle print solid up to about 4 mm, so the 4 mm
screw section and most of the thin bracket print solid. The sparse infill only
reaches the thicker lower plate, which keeps the part strong while saving time
and filament. Expect about 2 hours.

```powershell
& "Z:\greg\3D Design and Print\slice.ps1" -StlFile waste-food-bin-hook.stl `
    -NozzleDia 0.6 -Quality fast -Strength strong -Walls 4 -Infill 10 -AdhesionType brim
```

## Files

| File | Contents |
|------|----------|
| `waste-food-bin-hook.scad` | OpenSCAD source |
| `waste-food-bin-hook.stl` | Full part, print orientation |
| `waste-food-bin-hook-test.stl` | 10 mm test slice |
| `prompts.md` | Design prompt history |
