---
marp: true
theme: gaia
class: invert
paginate: true
---

# 🚀 MTD 367 iOS Application Development

- ~~Lesson #1 - Building Apps That Matter and Swift~~
- ~~Lesson #2 - Dealing With Swift Types And SwiftUI~~
- ~~Lesson #3 - Doubling Down On SwiftUI~~
- ~~Lesson #4 - All To-Do With SwiftData~~
- ~~Lesson #5 - Streaming Multimedia Swiftly~~
- **Lesson #6 - Putting The Map On Your App (Today)**

---

## ❓ Questions About Lesson #5

- Learn how to show images, play audio or play video in a Swift app

---

## ❓ Questions About Virtual Lab #5

Improve your To-Do List app!

- Let User add their own images and videos in their tasks.

---

## ✅ Today’s Agenda

- ☐ CoreLocation
- ☐ MapKit
- ☐ ARKit

---

### 📍 What Is Core Location?

- Apple's framework for **working with location data**
- Helps apps know:
  - Where the user is
  - How fast they’re moving
  - Which direction they’re heading

---

## 🎯 Why Maps & AR?

- Many modern apps combine:
  - Maps to show **where**
  - AR to show **what** at that location
- Great for:
  - Navigation
  - Games
  - Education
  - Tourism apps

---

## 🗺️ What Is MapKit?

- Apple’s framework for displaying maps
- Works with:
  - Standard maps
  - Satellite
  - Hybrid views
- Supports:
  - Pins (annotations)
  - User location
  - Routes & overlays

---

## 👓 What Is ARKit?

- Apple’s framework for Augmented Reality
- Uses device camera + sensors
- Places virtual objects in the real world

---

### 🚀 XCode

![alt text](https://media1.giphy.com/media/v1.Y2lkPTc5MGI3NjExczF5b2phaW5ocDE3aWJzNGJuM3liNGU2ejZjajR3dHV2Zzg0dWFlciZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/Ogak8XuKHLs6PYcqlp/giphy.gif)

---

## Hands-On #7

Improve your To-Do List app!

- Let Users add Location and

---

## ✅ Summary

- ✅ CoreLocation
- ✅ MapKit
- ✅ ARKit

---

## ⚠️ Reminder

- TMA 2 is due on 22/8/2025
- ECA is due on 14/10/2025

---

## Virtual Lab #6 (20/9/2025)

Improve your To-Do List app!

---

## ❓ Questions?

I’d love to hear how the class went or how I can improve.

Feel free to email me at:  
<muhammadfadzuli001@suss.edu.sg>

📂 All course materials are available at:  
[www.github.com/iluzdaf/mtd367](https://www.github.com/iluzdaf/mtd367)

---

## Appendix

### CoreLocation

```swift
import CoreLocation
let locationManager = CLLocationManager()
locationManager.requestWhenInUseAuthorization() 
// or
locationManager.requestAlwaysAuthorization()
// Fetch location
if let location = locationManager.location {
    print("User is at \(location.coordinate.latitude), \(location.coordinate.longitude)")
}
// Use delegate methods for updates
class MyLocationDelegate: NSObject, CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            print("Updated location: \(location.coordinate.latitude), \(location.coordinate.longitude)")
        }
    }
}
```

---

### MapKit

Shows a map centered on San Francisco:

```swift
import MapKit
struct MapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )

    var body: some View {
        Map(coordinateRegion: $region).frame(height: 300)
    }
}
```

---

### ARKit

Places a small blue box in AR space:

```swift
import ARKit
struct ARViewContainer: UIViewRepresentable {
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        let box = MeshResource.generateBox(size: 0.1)
        let material = SimpleMaterial(color: .blue, isMetallic: false)
        let modelEntity = ModelEntity(mesh: box, materials: [material])
        let anchor = AnchorEntity(world: SIMD3(x: 0, y: 0, z: -0.5))
        anchor.addChild(modelEntity)
        arView.scene.anchors.append(anchor)
        return arView
    }
}
```
