//
//  PlayingCardView.swift
//  Plyacard
//
//  Created by Tejaswini MR on 15/03/21.
//

import UIKit

class PlayingCardView: UIView {
    var rank: Int = 5 {didSet{setNeedsDisplay();setNeedsLayout()}}
    var suit: String = "♥️" {didSet {setNeedsDisplay();setNeedsLayout()}}
    var isfaceup: Bool = true {didSet {setNeedsDisplay();setNeedsLayout()}}
    
    private func centerAttributedString(_ string: String, fontSize: CGFloat)->NSAttributedString {
        var font = UIFont.preferredFont(forTextStyle: .body).withSize(fontSize)
        font = UIFontMetrics(forTextStyle: .body).scaledFont(for: font)
        let paragraphstyle = NSMutableParagraphStyle()
        paragraphstyle.alignment = .center
        return NSAttributedString(string: string, attributes: [.paragraphStyle:paragraphstyle,.font:font])
    }
    private var cornerString:NSAttributedString {
        centerAttributedString("\(rank)\n\(suit)", fontSize: cornerFontSize)
    }
    
    private lazy var upperLeftCornerLabel = createCornerLabel()
    private lazy var lowerRightCornerlable = createCornerLabel()
    
    private func createCornerLabel()->UILabel{
        let label = UILabel()
        label.numberOfLines = 0
        addSubview(label)
        return label
    }
    private func configureCornerlabel(_ label:UILabel){
        label.attributedText = cornerString
        label.frame.size = CGSize.zero
        label.sizeToFit()
        label.isHidden = !isfaceup
    }
    override func layoutSubviews() {
        super .layoutSubviews()
        configureCornerlabel(upperLeftCornerLabel)
        upperLeftCornerLabel.frame.origin = bounds.origin.offsetBy(dx: cornerOffset, dy: cornerOffset)
        configureCornerlabel(lowerRightCornerlable)
        lowerRightCornerlable.transform = CGAffineTransform.identity
            .translatedBy(x: lowerRightCornerlable.frame.size.width, y: lowerRightCornerlable.frame.size.height)
            .rotated(by: CGFloat.pi)
        lowerRightCornerlable.frame.origin = CGPoint(x: bounds.maxX, y: bounds.maxY).offsetBy(dx: -cornerOffset, dy: -cornerOffset).offsetBy(dx: -lowerRightCornerlable.frame.size.width, dy: -lowerRightCornerlable.frame.size.height)
    }
    override func draw(_ rect: CGRect) {
        let roundrect = UIBezierPath(roundedRect: bounds, cornerRadius:cornerRadius)
        roundrect.addClip()
        UIColor.white.setFill()
        roundrect.fill()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setNeedsLayout()
        setNeedsDisplay()
    }


}
extension CGRect {
    var leftHalf: CGRect {
        return CGRect(x: minX, y: minY, width: width/2, height: height)
    }
    
    var rightHalf: CGRect {
        return CGRect(x: midX, y: minY, width: width/2, height: height)
    }
    
    func inset(by size: CGSize) -> CGRect {
        return insetBy(dx: size.width, dy: size.height)
    }
    
    func sized(to size: CGSize) -> CGRect {
        return CGRect(origin: origin, size: size)
    }
    
    func zoom(by scale: CGFloat) -> CGRect {
        let newWidth = width * scale
        let newHeight = height * scale
        return insetBy(dx: (width - newWidth) / 2, dy: (height - newHeight) / 2)
    }
}

extension CGPoint {
    func offsetBy(dx: CGFloat, dy: CGFloat) -> CGPoint {
        return CGPoint(x: x+dx, y: y+dy)
    }
}

extension PlayingCardView {
    private struct SizeRatio {
        static let cornerFontSizeToBoundsHeight: CGFloat = 0.085
        static let cornerRadiusToBoundsHeight: CGFloat = 0.06
        static let cornerOffsetToCornerRadius: CGFloat = 0.33
        static let faceCardImageSizeToBoundsSize: CGFloat = 0.75
    }
    
    public var cornerRadius: CGFloat {
        return bounds.size.height * SizeRatio.cornerRadiusToBoundsHeight
    }
    
    public var cornerOffset: CGFloat {
        return cornerRadius * SizeRatio.cornerOffsetToCornerRadius
    }
    
    public var cornerFontSize: CGFloat {
        return bounds.size.height * SizeRatio.cornerFontSizeToBoundsHeight
    }
    
    public var rankString: String {
        switch rank {
        case 1:
            return "A"
        case 2...10:
            return String(rank)
        case 11:
            return "J"
        case 12:
            return "Q"
        case 13:
            return "K"
        default:
            return "?"
        }
    }
}
