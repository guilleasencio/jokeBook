//
//  UIImage.swift
//  jokeBookApp
//
//  Created by Guillermo Asencio Sanchez on 28/2/21.
//

import UIKit

extension UIImage {
  
  convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
    // Ensure the size of the image is not zero to avoid invalid context errors when drawing
    let imageSize = CGSize(width: max(1, size.width), height: max(1, size.height))
    UIGraphicsBeginImageContextWithOptions(imageSize, false, 0)
    color.setFill()
    UIRectFill(CGRect(origin: CGPoint.zero, size: imageSize))
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    guard let cgImage = image?.cgImage else {
      return nil
    }
    self.init(cgImage: cgImage)
  }
}
