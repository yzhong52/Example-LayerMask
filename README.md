# Example of Using Layer Mask

First of all, we need to create a subclass from `UIView` (which you already did). But here is the code that I used:

    private extension FloatingPoint {
        var degreesToRadians: Self { return self * .pi / 180 }
        var radiansToDegrees: Self { return self * 180 / .pi }
    }
    
    @IBDesignable class MaskView: UIView {
        let startAngle: CGFloat = 180
        let endAngle: CGFloat = 0
        
        override func layoutSubviews() {
            super.layoutSubviews()
            
            // The multiplier determine how big the circle is
            let multiplier: CGFloat = 3.0
            let radius: CGFloat = frame.size.width * multipler
            let maskLayer = CAShapeLayer()
            let arcCenter = CGPoint(x: frame.size.width / 2, y: radius)
            maskLayer.path = UIBezierPath(arcCenter: arcCenter,
                                          radius: radius,
                                          startAngle: startAngle.degreesToRadians,
                                          endAngle: endAngle.degreesToRadians,
                                          clockwise: true).cgPath
            layer.mask = maskLayer
        }
    }

Then you can add a `MaskView` as a subView in the `ViewController`. Make sure select the view assigned the class `MaskView` in the storyboard:

<img src="https://i.stack.imgur.com/ibWDH.png" width="200"/>

Now we have a very simply view hierarchy: 

<img src="https://i.stack.imgur.com/9HSI2.png" width="200"/>

Compiles the code and it's looking great: 

<img src="https://i.stack.imgur.com/Gpj5l.png" width="250"/>

If you want a scrollable subview that is masked, add it as a subview of the maskView. Here is how the view hierarchy looks after this: 

<img src="https://i.stack.imgur.com/c4PA1.png" width="200"/>

And finally, this is how it looks running in the simulator: 

<img src="https://i.stack.imgur.com/r8YdN.png" width="250"/>


  [1]: https://i.stack.imgur.com/ibWDH.png
  [2]: https://i.stack.imgur.com/9HSI2.png
  [3]: https://i.stack.imgur.com/Gpj5l.png
  [4]: https://i.stack.imgur.com/c4PA1.png
  [5]: https://i.stack.imgur.com/r8YdN.png
