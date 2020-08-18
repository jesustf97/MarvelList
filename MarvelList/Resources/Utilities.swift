//
//  Utilities.swift
//  MarvelList
//
//  Created by Jesús Calleja Rodríguez on 05/05/2020.
//  Copyright © 2020 Jesús Calleja Rodríguez. All rights reserved.
//

import Foundation
import var CommonCrypto.CC_MD5_DIGEST_LENGTH
import func CommonCrypto.CC_MD5
import typealias CommonCrypto.CC_LONG
import UIKit


fileprivate var aView: UIView?

extension UIViewController {
    
    func MD5(string: String) -> Data {
            let length = Int(CC_MD5_DIGEST_LENGTH)
            let messageData = string.data(using:.utf8)!
            var digestData = Data(count: length)

            _ = digestData.withUnsafeMutableBytes { digestBytes -> UInt8 in
                messageData.withUnsafeBytes { messageBytes -> UInt8 in
                    if let messageBytesBaseAddress = messageBytes.baseAddress, let digestBytesBlindMemory = digestBytes.bindMemory(to: UInt8.self).baseAddress {
                        let messageLength = CC_LONG(messageData.count)
                        CC_MD5(messageBytesBaseAddress, messageLength, digestBytesBlindMemory)
                    }
                    return 0
                }
            }
            return digestData
        }

    func getRequestParams(limit: Int = 1, offset: Int = 0) -> [String: Any] {
        let ts = "\(Date().timeIntervalSince1970)"
        let input = "\(ts)\(Constants.marvelApiPrivateKeyValue)\(Constants.marvelApiPublicKeyValue)"
        
        let hash = MD5(string: input).map { String(format: "%02hhx", $0) }.joined()
        
        return
            [Constants.marvelApiPublicKey: Constants.marvelApiPublicKeyValue,
             Constants.timeStamp: ts,
             Constants.hash: hash,
             Constants.limit: limit,
             Constants.offset: offset
        ]
    }
    
    func showSpinner() {
        aView = UIView(frame: self.view.bounds)
        aView?.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        ai.color = UIColor.white
        ai.center = aView!.center
        ai.startAnimating()
        aView?.addSubview(ai)
        self.view.addSubview(aView!)
    }
    
    func removeSpinner() {
        aView?.removeFromSuperview()
        aView = nil
    }
    
    
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size

        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height

        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        }

        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage!
    }

func getUrl(image: Image) -> String{
    return image.path + "." + image.format
}

    func showDialog(title: String, message: String, dismissAfter: Bool = false){
    let alert = UIAlertController(title: title , message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: Messages.actionAccept, style: UIAlertAction.Style.default, handler: nil))
           DispatchQueue.main.async {
            self.present(alert, animated: true) {
                if(dismissAfter){
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [weak self] in
                           guard self?.presentedViewController == alert else { return }

                           self?.dismiss(animated: true, completion: nil)
                }
            }
        }
    }
}
    
static func styleFilledButton(_ button:UIButton) {
    button.backgroundColor = UIColor.white
    button.layer.cornerRadius = 20.0
    button.tintColor = UIColor.white
    }

}

