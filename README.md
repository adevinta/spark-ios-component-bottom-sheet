
# BottomSheet

In iOS, the native bottom sheet component from Apple is used for both UIKit and SwiftUI. Many of the features of the component given in the specifications are only available from iOS 16 upwards. 
To help with the sizing of the bottom sheet, some helper functions have been added.

## Specifications

The bottomsheet specification on Zeroheight can be found [here](https://spark.adevinta.com/1186e1705/p/67d41e-bottom-sheet).

![Figma anatomy](https://github.com/adevinta/spark-ios-component-bottom-sheet/blob/main/.github/assets/anatomy.png)

## Usage

### UIKit
Two custom detents have been added:
- maxHeight: This is similar to the iOS `large` which takes the full height. As opposed to the `large` detent, the bottom sheet expands to almost the full height, but the background is not made smaller.
- compressedHeight(of view: UIView): This detent expands to the compressed height of the view.
- expandedHeight(of view: UIView): This detent expands to the expanded height of the view

### Sample
```
let controller = ExampleBottomSheetViewController()
if #available(iOS 16.0, *) {
   if let sheet = controller.sheetPresentationController {
     sheet.detents = [.compressedHeight(of: controller.view)]
   }
 }
 present(controller, animated: true)
```

### SwiftUI
Custom detents:
- maxHeight: This is similar to the iOS `large` which takes the full height. As opposed to the `large` detent, the bottom sheet expands to almost the full height, but the background is not made smaller.
- there is no custom detent for the height. Instead there is a general view modifier to calculate the view height which can be used with the existing height detent.

### Sample
```
    @State private var height: CGFloat = 100
    
    var body: some View {
        Button("Show bottom sheet with longer text") {
            self.showingMediumSheet.toggle()
        }
        .sheet(isPresented: $showingMediumSheet) {
            BottomSheetPresentedView(description: mediumDescription) {
                self.showingMediumSheet.toggle()
            }
            .readHeight(self.$height)
            .presentationDetents([.height(self.height), .maxHeight])
        }
    }
```

## License

```
MIT License

Copyright (c) 2024 Adevinta

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
