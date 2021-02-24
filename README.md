# 🌊 AquaProgressIndicatorSample

🌊 Aqua Progress indicator helps to keep the user engaged and updated with the progress you are making.

## 📺 Demo

![AquaProgressIndicator_demo](https://user-images.githubusercontent.com/22410262/108549531-45598680-7313-11eb-99c4-44951e3b48c6.gif)


## 📜 Installation Guide

Step 1: Download/Clone the AquaProgressIndicatorSample project. 

![Screenshot 2021-02-20 at 8 07 20 PM](https://user-images.githubusercontent.com/22410262/108599600-2103b580-73b8-11eb-9518-78d9d1515584.png)

Step 2: Drag the AquaProgressIndicator folder from the sample project and drop that in your project.

![Screenshot 2021-02-20 at 11 44 57 PM](https://user-images.githubusercontent.com/22410262/108604770-f1fc3c80-73d5-11eb-8bd0-643b2787b52f.png)

   NOTE: Don't forget to check the "Copy items if needed" checkbox.
        
  ![Screenshot 2021-02-20 at 7 58 10 PM](https://user-images.githubusercontent.com/22410262/108599589-1812e400-73b8-11eb-831d-4468bf0927da.png)
       
Step 3: Add an Objective C bridging header if you don't have one and add the following in the bridging header file.

```Objective-C
#import "DynamicWaterNode.h"
```

## 📃 Usage Guide

Step 1: Go to the storyboard and add a SKView object from the object Library.

![Screenshot 2021-01-28 at 2 04 50 AM](https://user-images.githubusercontent.com/22410262/106051218-2dc12080-610e-11eb-9876-9ec37c8a806f.png)

Step 2: Change the class name in the Identity inspector to AquaProgressIndicator.

![Screenshot 2021-02-20 at 7 59 22 PM](https://user-images.githubusercontent.com/22410262/108599591-1ba66b00-73b8-11eb-82b3-731901099ce0.png)

Step 3: Create an IBOutlet for the SKView from the storyboard.

```Swift
@IBOutlet weak var aquaProgressIndicator: AquaProgressIndicator!
```

Step 4: Call addAquaScene() using the outlet.

```Swift
aquaProgressIndicator.addAquaScene()
```

Step 5: Call changeWaterLevel(to level:CGFloat) with the progress value using the outlet.

```Swift
aquaProgressIndicator.changeWaterLevel(to: CGFloat(sender.value))
```

## 🥞 Tech stack

Xcode, UIKit & SpriteKit.

## 🙏🏽 Credits

Steve Barnegren & Astemir Eleev aka jVirus.


# 👨‍💻 Author 
[Rajai kumar](https://github.com/Rajaikumar-iOSDev)

# 🔖 Licence 
The project is availabe under [MIT licence](https://github.com/Rajaikumar-iOSDev/AquaProgressIndicatorSample/blob/main/LICENSE).

