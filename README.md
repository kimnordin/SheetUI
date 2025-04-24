# SheetUI
Easily present Dynamically Resized Sheets with SheetUI.

## Introduction
SheetUI is a lightweight SwiftUI Library that enables developers to present beautiful Sheets without having to rely on the native SwiftUI Sheets and their limitations.
SheetUI intends to resolve two main issues of the native SwiftUI Sheets:

- **Passthrough User Interactions:**  
Native Sheets doesn't allow you to select Content behind the Sheet.  
This was resolved in **iOS 16.4**, but Apps that rely on lower iOS Versions may use SheetUI to implement this functionality.

- **Dynamic Resizing:**  
Native Sheets lack the ability to dynamically resize to the Content they wrap.  
This can be resolved through `presentationDetents`, but they mainly rely on static heights and don't play nice with dynamically sized Content.
`presentationDetents` was introduced in **iOS 16**. Just as with Passthrough User Interactions, Apps relying on a lower iOS Version may use SheetUI to implement this functionality.

## Getting Started
### Installation
SheetUI can be installed using Swift Package Manager.

1. **Open Your Project in Xcode:**
Start by opening your Swift project in Xcode.
2. **Add Package Dependency:**  
  •	Go to File → Swift Packages → Add Package Dependency.  
  •	Paste the URL of the ReduxUI GitHub repository: https://github.com/kimnordin/SheetUI.git.
3. **Specify the Version:**
Choose the version of the SheetUI package you want to add. You can specify a version number, a branch, or a commit.
4. **Add to Your Target:**
After Xcode loads the package and its dependencies, select the SheetUI library, and add it to your project’s target(s).

### Usage
SheetUI is seamlessly integrated into your project through the `dynamicSheet` modifier.  
The modifier mimicks the existing syntax of the official `sheet` modifier, ensuring for familiarity and replaceability.

You apply the `dynamicSheet` modifier to any View in your hierarchy which should display the Sheet:
```swift
.dynamicSheet(isPresented: $displaySheet) {
    Text("Hello!")
}
```

The `dynamicSheet` modifier accepts the following arguments:
- `isPresented`: A Boolean Binding which toggles the Sheet.
- `backgroundColor`: A Background Color to apply to the Sheet.
- `ignoresSafeArea`: A Set of Edges to ignore.
- `content` A closure returning the Content to display inside the Sheet.

#### Example Implementation
```swift
import SwiftUI
import SheetUI

struct SheetView: View {
    @State private var displaySheet: Bool = false
    
    var body: some View {
        Button("Display Sheet") {
            displaySheet.toggle()
        }
        .dynamicSheet(isPresented: $displaySheet) { // Apply the `dynamicSheet` modifier
            Text("Hello")
        }
    }
}
```
> [!NOTE]
> As the `dynamicSheet` modifier allows for passthrough touches, you may either swipe-dismiss the sheet _or_ press the Button in the "background".

https://github.com/user-attachments/assets/2bb2ec49-8b62-4026-b85c-ae0dc9674c2f
