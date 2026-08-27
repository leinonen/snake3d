# Cube Snake

Snake on the surface of a cube. Each face is a 10×10 grid; run off an edge and
you continue on the neighbouring face while the camera rolls over with you.

**Play:** https://snake.leinonen.ninja

Single `index.html`, pure JS + WebGL, no dependencies. Post-processing shader
(bloom, chromatic aberration, scanlines, warp starfield) and a SID-style
Web Audio chiptune, all synthesized in code.

## Controls

| Key | Action |
|---|---|
| Arrows / WASD | Move (relative to the screen) |
| Space / Enter | Start / restart |
| M | Mute music |

## Gameplay

- Combo: eat quickly for a score multiplier.
- Food expires — grab it early for a bonus.
- Rocks appear as you score; never on your face or the one ahead.
- Face collapse: a face flashes red, then becomes lethal for a few seconds.
- Power-ups: cyan **ghost** (pass through yourself), magenta **shrink**,
  white **slow-mo**.

## Development

```
make run      # serve on http://localhost:8000
make deploy   # sync to S3 + CloudFront invalidation
```

## License

MIT — see [LICENSE](LICENSE).
