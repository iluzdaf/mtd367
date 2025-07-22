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
- **Lesson #5 - Streaming Multimedia Swiftly (Today)**
- Lesson #6 - Putting The Map On Your App (15/9/2025)

---

## ❓ Questions About Lesson #4

- Basics Of SwiftData
  - Why Persist data?
  - What Is SwiftData?
  - How SwiftData Works?
  - SwiftData Vs CoreData

---

## ❓ Questions About Virtual Lab #4

Improve your To-Do List app!

- Use a gesture to mark a task as done
- Display done in a separate list
- Display done and in-progress tasks separately
- Use a gesture to switch views between done and in-progress

---

## ✅ Today’s Agenda

- ☐ Learn how to show images, play audio or play video in a Swift app

---

## 🎬 Swift Multimedia Features

| Media Type           | Details                                                                                           |
|----------------------|---------------------------------------------------------------------------------------------------|
| **🎥 Video**         | - Play local videos with `VideoPlayer` and `Bundle` <br> - Stream videos from internet URLs       |
| **🎵 Audio**         | - Play local audio with `AVAudioPlayer` <br> - Stream audio from internet URLs using `AVPlayer`   |
| **🖼️ Images**        | - Load images from assets with `Image("...")` <br> - Load images from internet using `AsyncImage` |
| **🗂 Media Picker**  | - Select photos or videos from device library using `PhotosPicker`                                |

---

### 🚀 XCode

![Nyan](https://media3.giphy.com/media/v1.Y2lkPTc5MGI3NjExZTc5OGNjN2dhbHZjNmNzYXpocGRmMmF6NWp6bGd5ZW9ydGppOWkxeSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/vSshnLWTe7W9y/giphy.gif)

---

## 📋 Hands-On #6

Improve your To-Do List app!

- Play motivational audio when task is completed!

---

## ✅ Summary

- ✅ Learn how to show images, play audio or play video in a Swift app

---

## 📋 Virtual Lab #5 (13/9/2025)

Improve your To-Do List app!

- Let User add their own images and videos in their tasks.

---

## ❓ Questions?

I’d love to hear how the class went or how I can improve.

Feel free to email me at:  
<muhammadfadzuli001@suss.edu.sg>

📂 All course materials are available at:  
[www.github.com/iluzdaf/mtd367](https://www.github.com/iluzdaf/mtd367)

---

## Appendix

## Playing Video

```swift
import SwiftUI
import AVKit

struct VideoView: View {
    let url = URL(string: "https://example.com/video.mp4")!
    var body: some View {
        VideoPlayer(player: AVPlayer(url: url))
            .frame(height: 300)
    }
}
```

---

### Also works with local files

```swift
let localURL = Bundle.main.url(forResource: "myVideo", withExtension: "mp4")!
VideoPlayer(player: AVPlayer(url: localURL))
```

---

## Playing Audio

```swift
import AVFoundation

let url = URL(string: "https://example.com/audio.mp3")!
let player = AVPlayer(url: url)
player.play()
```

---

### Playing local audio files

```swift
import AVFoundation

var player: AVAudioPlayer?

func playLocalAudio() {
    if let url = Bundle.main.url(forResource: "sound", withExtension: "mp3") {
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print("Audio error: \(error)")
        }
    }
}
```

---

## Showing Images

Displaying Images From Assets:

```swift
Image("photoName")
    .resizable()
    .scaledToFit()
```

---

### Loading Images From the Internet using AsyncImage

```swift
AsyncImage(url: URL(string: "https://example.com/photo.jpg")) { image in
    image.resizable().scaledToFit()
} placeholder: {
    ProgressView()
}
.frame(width: 300, height: 300)
```

---

## Loading Media from Device

Local Images / Videos / Audio:

- Bundle resources
  - Put your media files in Xcode → Resources folder
- File Manager
  - Access user documents folder
- Photo Picker (for photos or videos)

---

```swift
import PhotosUI

struct PhotoPickerExample: View {
    @State private var selectedImage: UIImage?

    var body: some View {
        PhotosPicker(
            selection: .constant(nil),
            matching: .images
        ) {
            Text("Pick a Photo")
        }
        .onChange(of: selectedImage) { newImage in
            // do something with newImage
        }
    }
}
```
