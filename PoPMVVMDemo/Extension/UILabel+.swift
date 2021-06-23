//
//  UILabel+.swift
//  plexigo
//
//  Created by Mukesh Lokare on 13/07/20.
//  Copyright © 2020 neosoft. All rights reserved.
//

import UIKit

extension UILabel {
  
    func curveSpecificCorners(_ corners: UIRectCorner, radius: CGFloat) {
        
        let maskPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = maskPath.cgPath
        self.backgroundColor?.setFill()
        layer.mask = maskLayer
        layer.masksToBounds = true
    }
    
  private struct Constant {
    static let pattern = "(?:^|\\s|$|[.]#)@[\\p{L}0-9_.]*"
  }
  
  
  func rangesOfAttributedText(taggedUsers: [String], username: String, statusText: String ,hashTgs: [String], hashTagRanges : [NSTextCheckingResult]) -> [NSRange] {
    let mentions = taggedUsers.map { "@\($0)" }.joined(separator: " ")
//    let hashTagMentions = hashTgs
    
    let comment = "\(username) \(statusText)"
    let attributedComment = NSMutableAttributedString(string: "\(comment) \(mentions)")
    
    var tagRangeList = [NSRange]()
    
    // tagged users
    if let expression = try? NSRegularExpression(pattern: Constant.pattern) {
      expression.enumerateMatches(in: attributedComment.string, range: NSMakeRange(comment.utf16.count + 1, mentions.utf16.count)) { (match, _, _) in
        if let match = match {
          tagRangeList.append(match.range)
        }
      }
    }
    
    // Hahs tags
    if (try? NSRegularExpression(pattern: Constant.pattern)) != nil {
        hashTagRanges.forEach { (range) in
            tagRangeList.append(range.range)
        }
        
//        expression.enumerateMatches(in: attributedComment.string, range: NSMakeRange(comment.utf16.count + 1, hashTagMentions.utf16.count)) { (match, _, _) in
//            if let match = match {
//                tagRangeList.append(match.range)
//            }
//        }
    }
    
    // post owner
    tagRangeList.insert(NSMakeRange(0, username.count), at: 0)
    
    return tagRangeList
  }
  
  func tappedUser(with gesture: UITapGestureRecognizer,
                  taggedUsers: [String],
                  username: String,
                  statusText: String,
                  hashTags: [String],
                  hashTagRanges : [NSTextCheckingResult]) -> String? {
    
    var usernames = [String]()
    usernames.append(username)
    usernames.append(contentsOf: taggedUsers)
    usernames.append(contentsOf: hashTags)
    
    let ranges = rangesOfAttributedText(taggedUsers: taggedUsers, username: username, statusText: statusText, hashTgs: hashTags, hashTagRanges: hashTagRanges)
    
    for (index, range) in ranges.enumerated() {
      if self.didTapAttributedTextInLabel(tapGestureRecognizer: gesture, inRange: range) {
        return usernames[index]
      }
    }
    return nil
  }

  
  func didTapAttributedTextInLabel(tapGestureRecognizer: UITapGestureRecognizer, inRange targetRange: NSRange) -> Bool {
    let textContainer = NSTextContainer(size: bounds.size)
    textContainer.lineFragmentPadding = 0.0
    textContainer.maximumNumberOfLines = numberOfLines
    textContainer.lineBreakMode = lineBreakMode
    
    let paragraphStyle = NSMutableParagraphStyle()
    paragraphStyle.alignment = textAlignment
    
    let attributedText = NSMutableAttributedString(attributedString: self.attributedText ?? NSAttributedString())
    if let font = font{
        attributedText.addAttributes([NSAttributedString.Key.font: font, NSAttributedString.Key.paragraphStyle: paragraphStyle], range:  NSMakeRange(0, attributedText.string.count))
        
    }
    
    let textStorage = NSTextStorage(attributedString: attributedText)
    
    let layoutManager = NSLayoutManager()
    textStorage.addLayoutManager(layoutManager)
    layoutManager.addTextContainer(textContainer)
    
    // UILabel centers its text vertically, so adjust the point coordinates accordingly
    let glyphRange = layoutManager.glyphRange(for: textContainer)
    let wholeTextRect = layoutManager.boundingRect(forGlyphRange: glyphRange, in: textContainer)
    
    var tapPoint = tapGestureRecognizer.location(in: self)
    tapPoint.y -= (bounds.height - wholeTextRect.height) / 2
    
    // Bail early if point outside the whole text bounding rect
    if !wholeTextRect.contains(tapPoint) {
      return false
    }
    
    // ask the layoutManager which glyph is under this tapped point
    let glyphIdx = layoutManager.glyphIndex(for: tapPoint, in: textContainer, fractionOfDistanceThroughGlyph: nil)
    
    // as explained in Apple's documentation the previous method returns the nearest glyph
    // if no glyph was present at that point. So if we want to ensure the point actually
    // lies on that glyph, we should check that explicitly
    let glyphRect = layoutManager.boundingRect(forGlyphRange: NSMakeRange(glyphIdx, 1), in: textContainer)
    
    var index = NSNotFound
    if glyphRect.contains(tapPoint) {
      index = layoutManager.characterIndexForGlyph(at: glyphIdx)
    }
    
    return targetRange.lowerBound...targetRange.upperBound ~= index
  }
  
}

// Calculate estimated number of lines
extension UILabel {
//    func calculateMaxLines() -> Int {
//        let maxSize = CGSize(width: frame.size.width, height: CGFloat(Float.infinity))
//        let charSize = font.lineHeight
//        let text = (self.text ?? "") as NSString
//        guard let font = font else {
//            return Int(UIFont.systemFontSize)
//        }
//        let textSize = text.boundingRect(with: maxSize, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
//
//        let linesRoundedUp = Int(ceil(textSize.height/charSize))
//        return linesRoundedUp
//    }
    public var requiredHeight: CGFloat {
      let label = UILabel(frame: CGRect(x: 0, y: 0, width: frame.width, height: CGFloat.greatestFiniteMagnitude))
      label.numberOfLines = 0
      label.lineBreakMode = NSLineBreakMode.byWordWrapping
      label.font = font
      label.text = text
      label.attributedText = attributedText
      label.sizeToFit()
      return label.frame.height
    }
}


@IBDesignable class PaddingLabel: UILabel {

    @IBInspectable var topInset: CGFloat = 5.0
    @IBInspectable var bottomInset: CGFloat = 5.0
    @IBInspectable var leftInset: CGFloat = 7.0
    @IBInspectable var rightInset: CGFloat = 7.0

    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: rect.inset(by: insets))
    }

    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + leftInset + rightInset,
                      height: size.height + topInset + bottomInset)
    }

    override var bounds: CGRect {
        didSet {
            // ensures this works within stack views if multi-line
            preferredMaxLayoutWidth = bounds.width - (leftInset + rightInset)
        }
    }
}
