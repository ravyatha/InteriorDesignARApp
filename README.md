# Interior Design AR App


Create an AR application for interior design that allows users to scan their room, place virtual
furniture, and visualize how it would look with realistic lighting and physics.

##  Features

-  Room scanning with ARKit scene reconstruction
-  Plane detection for walls, floors, and ceilings
-  Load 3D furniture models in USDZ format from a built-in catalog
-  Tap-to-place on detected surfaces
-  Rotate and scale furniture using gestures
-  Realistic lighting estimation using ARKit
-  Occlusion handling with real world objects
-  Furniture selection dropdown using SwiftUI `Picker`
-  Built using MVVM architecture with Combine-based reactive state management

---

## Folder Structure

```
InteriorDesignARApp/
├── Models/
│ └── FurnitureModel.swift
├── ViewModels/
│ └── ARViewModel.swift
├── Views/
│ ├── ContentView.swift
│ └── ARViewContainer.swift
├── Resources/
│ ├── toy_car.usdz
│ ├── toy_biplane_realistic.usdz
│ ├── robot.usdz
│ └── ball_soccerball_realistic.usdz
├── InteriorDesignARApp.swift
└── README.md
```
---

##  How to Run (Xcode via MacinCloud)

This project was written using **VS Code on Windows** and tested with **Xcode (via MacinCloud)**.

To run the App:

1. Open **Xcode** on macOS (via MacinCloud).
3. Create a new **SwiftUI App** project named `InteriorDesignARApp`
4. Drag all the `.swift` files and folders into the Xcode project navigator
5. Next add all the `.usdz` files from `Resources/` to **Copy Bundle Resources** in Build Phases
6. Select an ARKit-compatible ios simulator (or real device)
7. Next Build and run the project

---

## Tools & Platform

- Code written: **VS Code (Windows)**
- Tested in: **Xcode 15+ on MacinCloud**
- Target Platform: **ios 17+**
- Language & Frameworks: **Swift 5.10 & SwiftUI, ARKit, RealityKit, Combine**
