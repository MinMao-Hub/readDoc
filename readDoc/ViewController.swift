//
//  ViewController.swift
//  readDoc
//
//  Created by 郭永红 on 2016/10/12.
//  Copyright © 2016年 郭永红. All rights reserved.
//

/*
 UIDocumentInteractionController是iOS 很早就出来的一个功能。但由于平时很少用到，压根就没有听说过它。而我们忽略的却是一个功能强大的”文档阅读器”。
 UIDocumentInteractionController主要有两个功能，一个是文件预览，另一个就是调用iPhoneh里第三方相关的app打开文档（注意这里不是根据url scheme 进行识别，而是苹果的自动识别）
 */


import UIKit

class ViewController: UIViewController,UIDocumentInteractionControllerDelegate {

    
    var documentController:UIDocumentInteractionController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let docUrl = Bundle.main.url(forResource: "test1", withExtension: "pdf")
        
        documentController = UIDocumentInteractionController(url:docUrl!)
        documentController.delegate = self;
        
    }
    
    @IBAction func preViewDocument(_ sender: AnyObject) {
        
        //当前APP打开  需实现协议方法才可以完成预览功能
        documentController.presentPreview(animated: true)
        
    }
    
    @IBAction func openDocument(_ sender: AnyObject) {
        
        //第三方打开 手机中安装有可以打开此格式的软件都可以打开
        documentController.presentOpenInMenu(from: (sender as! UIButton).frame, in: self.view, animated: true)
        
    }
    
    public func documentInteractionControllerViewControllerForPreview(_ controller: UIDocumentInteractionController) -> UIViewController
    {
        return self
    }


}

