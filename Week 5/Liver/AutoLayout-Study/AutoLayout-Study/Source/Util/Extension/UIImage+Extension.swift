//
//  UIImage+Extension.swift
//  AutoLayout-Study
//
//  Created by Kyungsoo Lee on 10/19/23.
//

import UIKit

extension UIImage {
    func resizeImage(image: UIImage, toSize size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        image.draw(in: CGRect(origin: CGPoint.zero, size: size))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return resizedImage
    }
}
