import UIKit

final class CustomButton: UIButton {
    
    var buttonTitle: String = ""
    var titleColor: UIColor? = nil
    var bgImage: UIImage? = nil
    var cornerRadius: Float = 0
    
    var tapClosure: (() -> Void)?
    
    init(frame: CGRect, title: String, titleColor: UIColor, bgImage: UIImage?, cornerRadius: Float) {
        self.buttonTitle = title
        self.titleColor = titleColor
        self.bgImage = bgImage
        self.cornerRadius = cornerRadius
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
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
        self.addTarget(self, action: #selector(tapOnButton), for: .touchUpInside)
    }
    
    @objc func tapOnButton() {
        tapClosure?()
    }
    
}

