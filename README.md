![FunnyBones logo](https://i.ibb.co/m4c0hQV/funnybones.png)

# FunnyBones

### Simple skeleton loading in SwiftUI



#### What is skeleton loading? 



#### Why is this beneficial? 


#### How do I use this? 

```
import FunnyBones 
import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: DemoViewModel = DemoViewModel()
    
    var body: some View {
        ScrollView {
            VStack {
                BonesView(data: viewModel.items,
                          placeholder: Item.placeholders,
                          content: { itemsView(with: $0) })
            }
        }
    }
}
```

Ensure you have a view into which you can pass model objects to display

If you have a single object that's loading, you can also use `SingleBonesView` in the same way.   
