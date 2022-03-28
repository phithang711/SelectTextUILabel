//
//  UILabelCanSelect.swift
//  SelectText
//
//  Created by Nguyễn Phi Thăng on 28/03/2022.
//
import UIKit

class UILabelCanSelect: UILabel {
    // Private variable
    private var defaultText = ""
    private var startIndex = -1
    private var selectedText = NSMutableAttributedString()
    
    // Layout manager for detect text
    private let layoutManager = NSLayoutManager()
    private let textContainer = NSTextContainer(size: .zero)
    private var textStorage = NSTextStorage()
    

    override var canBecomeFirstResponder: Bool {
            return true
        }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        isUserInteractionEnabled = true
    }
    
    override var text: String? {
        get {
            return super.attributedText?.string
        }
        set {
            if (startIndex == -1) {
                if (defaultText != newValue) {
                    defaultText = newValue!
                }
                let attrs: [NSAttributedString.Key : Any] = [.font: font!]
                attributedText = NSAttributedString(string: defaultText , attributes: attrs)
                updateTextContainer()
                self.removeAllSubViews()
            } else {
                super.attributedText = selectedText
            }
        }
    }
    
    private func updateTextContainer() {
        textStorage = NSTextStorage(attributedString: attributedText!)
        
        layoutManager.addTextContainer(textContainer)
        textStorage.addLayoutManager(layoutManager)
        
        textContainer.lineFragmentPadding = 0.0
        textContainer.lineBreakMode = self.lineBreakMode
        textContainer.maximumNumberOfLines = self.numberOfLines
    }
}

// MARK: UI Methods
extension UILabelCanSelect {
}

// MARK: - Actions
extension UILabelCanSelect {
    
}
