# R.M.S. Titanic: Take the Helm

**Live site: https://aaravvedham.github.io/titanic-khoj-website/**

A touch-friendly website about the night of 14 April 1912, built for a classroom smartboard. It has two parts:

- **Take the Helm**: you're on Titanic's bridge at 11:39:06 pm, with the iceberg dead ahead. Steer and signal the engine room to try to miss it.
- **Explore the Ship**: a 3D model you can turn and zoom. Tap the brass markers for the history.

> On a small screen, zoom the browser out to about 70% to see the front of the ship.

## Files

| File | Contents |
|---|---|
| `index.html` | Home page and visit counter |
| `game.html` | The whole game in one file, drawn with canvas and SVG |
| `ship.html` | 3D viewer built with three.js 0.160 |
| `titanic.glb` | The ship model |
| `intro.mp4` | Video played before the game |
| `ship-profile.png` | Home page picture, rendered from the model |

There's no build step and no framework, just plain HTML, CSS and JavaScript.

## Game

- **Controls:** turn the wheel from wherever you grab it, or swipe left or right on its panel. Drag or tap the engine telegraph. Holding ← / → turns the wheel; ↑ / ↓ change the engine order. That means two buttons on a USB-keyboard microcontroller, such as an Arduino with `Keyboard.h`, can work as controls.
- **Settings:** these are near the top of the script in `game.html`.
  - `INTRO_VIDEO_PATH` sets the intro video.
  - `START_OFFSET_SECS` sets the difficulty.
  - `RETURN_TO_MENU_SECS` sets how long the result screen stays up.
  - `MAX_RUDDER_RATE` sets how fast the rudder swings.
  - `TELEGRAPH_STEPS` lists the engine settings.
- **Performance:** the bridge view renders at no more than 1280×720 and is stretched to fill the screen, so 4K works. The "Graphics: Auto" setting switches to a lighter mode if play runs below about 28 fps.

## 3D model

Made from an Onshape CAD export. With [glTF-Transform](https://gltf-transform.dev/), its 2,634 parts were merged into 42 meshes and the file shrank from 11.5 MB to 3.5 MB. A few placeholder colours were fixed. The model covers the exterior and decks only; the hull is hollow.

The markers are in the `SPOTS` list in `ship.html`. Their positions are in metres: x runs from the stern (0) to the bow (about 270), y is up, and +z is starboard.

## Visit counter

The counter uses the free [Abacus](https://v2.jasoncameron.dev/abacus) API and counts once per browser session. If you reuse this project, change `NAMESPACE` in `index.html` so your visits are counted separately.
