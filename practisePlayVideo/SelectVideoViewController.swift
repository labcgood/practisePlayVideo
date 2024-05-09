//
//  selectVideoViewController.swift
//  practisePlayVideo
//
//  Created by Labe on 2024/5/8.
//

import UIKit
import AVKit
import SafariServices

class SelectVideoViewController: UIViewController {
    @IBOutlet var images: [UIImageView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for i in 0...images.count-1 {
            images[i].layer.cornerRadius = 20
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func playVideoAvocado(_ sender: Any) {
            
            let alerController = UIAlertController(title: "準備好看萌貓了嗎？！", message: "小心心臟爆擊", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "看爆", style: .default) { _ in
                if let url = Bundle.main.url(forResource: "avocado", withExtension: "MOV") {
                    let player = AVPlayer(url: url)
                    let controller = AVPlayerViewController()
                    controller.player = player
                    self.present(controller, animated: true) {
                        player.play()
                    }
                }
            }
            alerController.addAction(okAction)
            
            let cancelAction = UIAlertAction(title: "等一下，還沒做好準備！", style: .cancel)
            alerController.addAction(cancelAction)
            
            present(alerController, animated: true)
    }
    
    @IBAction func shareAvocado(_ sender: UIButton) {
        let controller = UIActivityViewController(activityItems: ["酪梨", UIImage(named: "avocado")!], applicationActivities: nil)
        controller.popoverPresentationController?.sourceView = sender
        present(controller, animated: true)
    }
    
    @IBAction func playVideoCarbon(_ sender: Any) {
        
        let alertController = UIAlertController(title: "猜猜我是誰", message: "猜錯就不給你看", preferredStyle: .alert)
        
        let select1 = UIAlertAction(title: "黑豬", style: .default)
        alertController.addAction(select1)
        
        let select2 = UIAlertAction(title: "黑炭", style: .default) { _ in
            if let url = Bundle.main.url(forResource: "carbon", withExtension: "MOV") {
                let player = AVPlayer(url: url)
                let controller = AVPlayerViewController()
                controller.player = player
                self.show(controller, sender: nil)
            }
        }
        alertController.addAction(select2)
        
        let select3 = UIAlertAction(title: "小黑", style: .default)
        alertController.addAction(select3)
        
        let cancelAction = UIAlertAction(title: "取消", style: .cancel)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true)
    }
    
    @IBAction func shareCarbon(_ sender: UIButton) {
        let controller = UIActivityViewController(activityItems: ["黑炭", UIImage(named: "carbon")!], applicationActivities: nil)
        controller.popoverPresentationController?.sourceView = sender
        present(controller, animated: true)
    }
    
    @IBAction func playOtherVideo(_ sender: Any) {
        let alertController = UIAlertController(title: "看看其他可愛動物", message: "請選擇", preferredStyle: .actionSheet)
        
        let catAction = UIAlertAction(title: "高傲雙峰", style: .default) { _ in
            self.connection(inprtUrl: "https://www.youtube.com/results?search_query=%E9%9B%99%E5%B3%B0%E9%A7%B1%E9%A7%9D")
        }
        alertController.addAction(catAction)
        
        let dogAction = UIAlertAction(title: "呆呆狗狗", style: .default) { _ in
            self.connection(inprtUrl: "https://www.youtube.com/results?search_query=%E7%8B%97%E7%8B%97%E6%90%9E%E7%AC%91")
        }
        alertController.addAction(dogAction)
        
        let rabbitAction = UIAlertAction(title: "不可以吃兔兔", style: .default) { _ in
            self.connection(inprtUrl: "https://www.youtube.com/results?search_query=%E5%85%94%E5%AD%90")
        }
        alertController.addAction(rabbitAction)
        
        let cancelAction = UIAlertAction(title: "算了", style: .cancel)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true)
    }
    
    func connection(inprtUrl: String) {
        if let url = URL(string: inprtUrl) {
            let controller = SFSafariViewController(url: url)
            present(controller, animated: true)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}



