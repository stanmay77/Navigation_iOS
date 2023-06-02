import UIKit

final class CustomButton: UIButton {
    
    typealias Action = (()->Void)
    
    var buttonTitle: String = ""
    var titleColor: UIColor? = nil
    var bgImage: UIImage? = nil
    var cornerRadius: Float = 0
    var tapClosure: Action
    
    init(frame: CGRect, title: String, titleColor: UIColor, bgImage: UIImage?, cornerRadius: Float, action: @escaping Action) {
        tapClosure = action
        self.buttonTitle = title
        self.titleColor = titleColor
        self.bgImage = bgImage
        self.cornerRadius = cornerRadius
        super.init(frame: frame)
        self.setTitle(buttonTitle, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        
        if let bgImage = bgImage {
            self.setBackgroundImage(bgImage, for: .normal)
            self.setBackgroundImage(bgImage.image(alpha: 0.8), for: .selected)
            self.setBackgroundImage(bgImage.image(alpha: 0.8), for: .highlighted)
            self.setBackgroundImage(bgImage.image(alpha: 0.8), for: .disabled)
            self.imageView?.layer.cornerRadius = CGFloat(cornerRadius)
        }
        
        self.layer.cornerRadius = CGFloat(cornerRadius)
        self.clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
        addTarget(self, action: #selector(tapOnButton), for: .touchUpInside)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tapOnButton() {
        tapClosure()
    }
    
}

