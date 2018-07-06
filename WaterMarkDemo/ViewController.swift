//
//  ViewController.swift
//  WaterMarkDemo
//
//  Created by Heeron on 2018/7/6.
//  Copyright © 2018年 HeeronChang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let textX = self.view.bounds.width/2
        let textY = self.view.bounds.height/2
        
        let dict = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 34),
                    NSAttributedStringKey.foregroundColor: UIColor.red]
        
        
//        let image = addTextMark(image: UIImage.init(named: "beautiful_scene")!, text: "白猫", position: CGPoint.init(x: textX, y: textY), attributes: dict as NSDictionary)
        
        let image2 = addImageMark(image: UIImage.init(named: "beautiful_scene")!, markImage: UIImage.init(named: "beautiful_scene")!, position: CGRect.init(x: 0, y: 0, width: 200, height: 200))
        
        
        self.imageView.image = image2
        
        self.imageView.image = shortCut(view: self.view)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    /// 添加文字水印
    ///
    /// - Parameters:
    ///   - image: 要添加水印的图片
    ///   - text: 要添加的文字水印
    ///   - position: 文字水印的位置
    ///   - attributes: 文字水印的样式
    /// - Returns: 添加了水印的图片
    func addTextMark(image: UIImage, text: NSString, position: CGPoint, attributes: NSDictionary) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(image.size, false, 0)
        image.draw(in: CGRect.init(x: 0, y: 0, width: image.size.width, height: image.size.height))
        text.draw(at: position, withAttributes: (attributes as! [NSAttributedStringKey : Any]))
        let newImg = UIGraphicsGetImageFromCurrentImageContext() as UIImage?
        UIGraphicsEndImageContext()
        
        return newImg!
    }
    
    
    /// 添加图片水印
    ///
    /// - Parameters:
    ///   - image: 要添加水印的图片
    ///   - markImage: 水印图片
    ///   - position: 水印图片的位置
    /// - Returns: 添加了水印的图片
    func addImageMark(image: UIImage, markImage: UIImage, position: CGRect) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(image.size, false, 0)
        image.draw(in: CGRect.init(x: 0, y: 0, width: image.size.width, height: image.size.height))
        markImage.draw(in: position)
        let newImage = UIGraphicsGetImageFromCurrentImageContext() as UIImage?
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
    /// 截图
    func shortCut(view: UIView) -> UIImage {
        UIGraphicsBeginImageContext(view.bounds.size)
        let currContext = UIGraphicsGetCurrentContext()
        view.layer.render(in: currContext!)
        let image = UIGraphicsGetImageFromCurrentImageContext() as UIImage?
        UIGraphicsEndImageContext()
        
        return image!
    }
}

