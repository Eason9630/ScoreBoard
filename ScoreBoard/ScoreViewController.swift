//
//  ScoreViewController.swift
//  ScoreBoard
//
//  Created by 林祔利 on 2023/3/26.
//

import UIKit

class ScoreViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var sectionLabel: UILabel!
    @IBOutlet weak var guestScoreLabel: UILabel!
    @IBOutlet weak var homeScoreLabel: UILabel!
    var timer: Timer?
    var downSeconds = 5
    var homeScore = 0
    var guestScore = 0
    var count = 0
    let maxCount = 4
    let eventTime = 60
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

    }

    func downTime () {
     if downSeconds > 0 {
         downSeconds -= 1
         timeLabel.text = String(format: "%02d:%02d", downSeconds / 60 , downSeconds % 60)
     }else if downSeconds == 0 {
         self.count += 1
         self.downSeconds = 5
        }
    }
    
    
    @IBAction func startGame(_ sender: Any) {
        self.startButton.isHidden = true
        
            timer?.invalidate()
                
            // 初始化分數的值和計數器的值
            homeScore = 0
            guestScore = 0
            count = 0
                
            // 創建新的 Timer 物件，每隔 10 分鐘觸發一次事件處理方法
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            self.guestScore += Int.random(in: 0...4)
            self.homeScore += Int.random(in: 0...4)
            self.homeScoreLabel.text = String(format: "%3d", self.homeScore)
            self.guestScoreLabel.text = String(format: "%3d", self.guestScore)
            
            
            if(self.count == 0){
                self.sectionLabel.text = "First"
                self.downTime()
            }else if self.count == 1 {
                self.sectionLabel.text = "Second"
                self.downTime()
            }else if self.count == 2 {
                self.sectionLabel.text = "Third"
                self.downTime()
            }else if self.count == 3 {
                self.sectionLabel.text = "Final"
                self.downTime()
            }
            
           
            
            if self.count == self.maxCount {
                self.timer?.invalidate()
                self.startButton.isHidden = false
            }

            
            
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
