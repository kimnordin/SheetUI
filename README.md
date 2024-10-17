# SheetUI
Easily present Dynamically Resized Sheets with SheetUI.

## Introduction
SheetUI is a lightweight SwiftUI Library that enables developers to present beautiful Sheets without having to rely on the native SwiftUI Sheets and their limitations.
SheetUI intends to resolve two main issues of the native SwiftUI Sheets:

- **Passthrough User Interactions:**  
Native Sheets doesn't allow you to select content behind the sheet.  
This was resolved in **iOS 16.4**, but Apps that rely on lower iOS Versions may use SheetUI to implement this functionality.

- **Dynamic Resizing:**  
Native Sheets lack the ability to dynamically resize to the content they wrap.  
This can be resolved through `presentationDetents`, but they mainly rely on static heights and don't play nice with dynamically sized content.
`presentationDetents` was introduced in **iOS 16**. Just as with Passthrough User Interactions, Apps relying on a lower iOS Version may use SheetUI to implement this functionality.
