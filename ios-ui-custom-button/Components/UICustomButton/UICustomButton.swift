//
//  UICustomButton.swift
//  ios-ui-custom-button
//
//  Created by Lionel P. Albus on 5/8/21.
//

import Foundation
import UIKit

@IBDesignable
class UICustomButton: UIButton {
    
    public override class var layerClass: AnyClass {
        CAGradientLayer.self
    }
    
    private var gradientLayer: CAGradientLayer {
        layer as! CAGradientLayer
    }
    
    // button corner radius
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    // button border color
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    // button border width
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    // button shadow color
    @IBInspectable var shadowColor: UIColor = UIColor.clear {
        didSet{
            self.layer.shadowColor = shadowColor.cgColor
            self.layer.masksToBounds = false
        }
    }
    
    // button shadow radius
    @IBInspectable var shadowRadius: CGFloat = CGFloat(0.5) {
        didSet {
            self.layer.masksToBounds = false
            self.layer.shadowRadius = shadowRadius
        }
    }
    
    // button shadow opacity
    @IBInspectable var shadowOpacity: Float = 0.4 {
        didSet {
            self.layer.masksToBounds = false
            self.layer.shadowOpacity = shadowOpacity
        }
    }
    
    // button shadow offset
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 1, height: 4) {
        didSet {
            self.layer.masksToBounds = false
            self.layer.shadowOffset = shadowOffset
        }
    }
    
    // button corner position
    @IBInspectable var cornerPosition: Int = 0 {
        didSet {
            self.layer.maskedCorners = CornerPosition.initWith(position: cornerPosition).mask
        }
    }
    
    // button start color gradient
    @IBInspectable public var startColor: UIColor = .white {
        didSet {
            updateColors()
        }
    }
    
    // button end color gradient
    @IBInspectable public var endColor: UIColor = .red {
        didSet {
            updateColors()
        }
    }
    
    // button start point gradient
    @IBInspectable public var startPoint: CGPoint {
        get {
            gradientLayer.startPoint
        }
        
        set {
            gradientLayer.startPoint = newValue
        }
    }
    
    // button end point gradient
    @IBInspectable public var endPoint: CGPoint {
        get {
            gradientLayer.endPoint
        }
        set {
            gradientLayer.endPoint = newValue
        }
    }
    
    // update colores gradient
    private func updateColors() {
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
    }
}

class UICustomButtonHighlight: UICustomButton {
    @IBInspectable public var highlightBackgroundColor: UIColor = UIColor.clear {
        didSet {
            setupView()
        }
    }
    
    private var defaultBackgroundColor = UIColor.clear
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupActions()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupActions()
    }
    
    private func setupActions() {
        addTarget(self, action: #selector(handleTouchDown), for: .touchDown)
        addTarget(self, action: #selector(handleTouchUp), for: [.touchUpInside, .touchDragOutside, .touchCancel])
    }
    
    @objc func handleTouchDown() {
        animateBackgroundColor(color: highlightBackgroundColor)
    }
    
    @objc func handleTouchUp() {
        animateBackgroundColor(color: defaultBackgroundColor)
    }
    
    private func setupView() {
        if let backgroundColor = backgroundColor {
            defaultBackgroundColor = backgroundColor
        }
    }
    
    private func animateBackgroundColor(color: UIColor) {
        UIView.animate(
            withDuration: 0.3,
            delay: 0.0,
            usingSpringWithDamping: 1,
            initialSpringVelocity: 0.0,
            options: [.allowUserInteraction, .beginFromCurrentState],
            animations: {
                self.backgroundColor = color
            },
            completion: nil
        )
    }
    
    @IBInspectable var centerVertically: CGFloat = CGFloat(6.0) {
        didSet {
            let imageSize = self.imageView!.frame.size
            let titleSize = self.titleLabel!.frame.size
            let totalHeight = imageSize.height + titleSize.height + centerVertically
            
            self.imageEdgeInsets = UIEdgeInsets(
                top: -(totalHeight - imageSize.height),
                left: 0,
                bottom: 0,
                right: -titleSize.width
            )
            
            self.titleEdgeInsets = UIEdgeInsets(
                top: 0,
                left: -imageSize.width,
                bottom: -(totalHeight - titleSize.height),
                right: 0
            )
            
        }
    }
}
