# Emotion Garden

An interactive animation made with **Processing** for 52685 Creative Coding, Assessment 2 (Code Prototype Project).

Emotion Garden shows four feelings as four small gardens. Each one uses colour, nature and movement:

| Key | Scene | What you see |
|---|---|---|
| 1 | Happy | bright sky, flowers that grow from nothing, a butterfly flying across |
| 2 | Calm | soft blue sky, two slow clouds, pink petals floating down |
| 3 | Sad | grey sky, dark clouds, rain, flowers bent down |
| 4 | Angry | red sky, orange sun, fast wind lines, spinning leaves |

You can also click the four buttons at the bottom of the window. Every time you go back to Happy, the flowers grow again from the start.

![The four scenes](screenshots/four_scenes.png)

---

## How to run it

1. Install Processing 4 from https://processing.org/download (free).
2. Download this repository: green **Code** button → **Download ZIP**, then unzip it.
3. Open the folder `EmotionGarden` and double-click `EmotionGarden.pde`. Processing opens it.
4. Click the **Run** button (the triangle at the top left).
5. Press **1**, **2**, **3** or **4**, or click a button at the bottom, to change the scene.

The sketch needs no extra libraries, pictures or sounds. Everything is drawn with code.

**Note:** Processing only opens a `.pde` file that sits inside a folder with the same name. That is why the code is in `EmotionGarden/EmotionGarden.pde`.

---

## Files

| File / folder | What it is |
|---|---|
| `EmotionGarden/EmotionGarden.pde` | The whole program (one file) |
| `screenshots/` | Pictures of the four scenes |
| `journal/EmotionGarden_Project_Journal.pptx` | My project journal, one slide per week |
| `README.md` | This file |

### Inside `EmotionGarden.pde`

| Part | What it does |
|---|---|
| variables at the top | `scene` remembers which scene is showing; `bloomSize` and `butterflyX` for Happy; arrays for the petals, raindrops and leaves |
| `setup()` | runs once: makes the 900 × 600 window and gives every petal, raindrop and leaf a random start position and speed |
| `draw()` | runs again and again, about 60 times a second: checks `scene` and draws that scene, then the buttons on top |
| `happyScene()` | flowers grow with `bloomSize` (+0.01 each frame, up to 1); the butterfly moves 2 pixels each frame |
| `calmScene()` | clouds move slowly; a `for` loop moves 35 petals down, with `sin()` for a little side-to-side |
| `sadScene()` | a `for` loop moves 80 raindrops; three bent flowers |
| `angryScene()` | six wind lines and 25 leaves that move fast and rotate |
| `drawHappyFlower()`, `drawCloud()`, ... | small functions that draw one thing at the x and y you give them |
| `keyPressed()`, `mousePressed()` | keys 1–4 and the buttons call `changeScene()` |
| `changeScene()` | sets `scene`, and for Happy starts the flowers and butterfly again |

---

## Where I learned things

Marked in the code comments with **[W4]** and **[REF]**:

- [W4] Creative Coding Week 4 lecture, "Animation Loop" example: `setup()` runs once, `draw()` repeats.
- [REF] Processing Reference, https://processing.org/reference/ — `pushMatrix()`, `translate()`, `rotate()`, `scale()`, `sin()`, `random()`, `%`.

The scenes, shapes, colours, numbers and the way the scenes change are my own.

## Known limits

- The scene changes at once; there is no fade between scenes.
- One colour idea for each feeling (for example red for angry). Not everyone reads the colours the same way.
