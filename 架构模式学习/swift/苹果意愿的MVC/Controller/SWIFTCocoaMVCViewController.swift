//
//  SWIFTCocoaMVCViewController.swift
//  架构模式学习
//
//  Created by mo2323 on 2018/11/19.
//  Copyright © 2018年 com.developer.meanmouse. All rights reserved.
//

import UIKit

class SWIFTCocoaMVCViewController: UIViewController {

    weak var promptLabel: UILabel!
    var detailView: SWIFTCocoaMVCView!
    var dog: SWIFTCocoaMVCAnimal?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white;
        self.initModel();
        self.initView();
    }
    
     private func initView() {
        
        detailView = SWIFTCocoaMVCView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width / 3.0, height: 150));
        detailView.backgroundColor = UIColor.lightGray;
        detailView.center = self.view.center;
        detailView.nameLabel.text = dog?.name;
        detailView.bloodVolumeLabel.text = "血量：\(dog?.bloodVolume ?? 0.00)";
        detailView.defensesLabel.text = "防御：\(dog?.defenses ?? 0.00)";
        detailView.aggressivityLabel.text = "攻击：\(dog?.aggressivity ?? 0.00)";
        self.view.addSubview(detailView);
        
        let promptLabel = UILabel(frame: CGRect(x: 30, y: detailView.frame.origin.y - 50, width: self.view.frame.size.width - 60, height: 20));
        promptLabel.backgroundColor = UIColor.clear;
        promptLabel.textAlignment = NSTextAlignment.center;
        promptLabel.numberOfLines = 0;
        promptLabel.isHidden = true;
        self.promptLabel = promptLabel;
        self.view.addSubview(promptLabel);
        
        let attackButton = UIButton(type: UIButton.ButtonType.custom);
        attackButton.frame = CGRect(x: ( self.view.frame.size.width - 120 ) / 2.0, y: detailView.frame.maxY + 30, width: 120, height: 35);
        attackButton.setTitle("攻击\(dog?.name ?? "")", for: UIControl.State.normal);
        attackButton.setTitleColor(UIColor.white, for: UIControl.State.normal);
        attackButton.backgroundColor = UIColor.red;
        attackButton.addTarget(self, action: #selector(SWIFTCocoaMVCViewController.attackButtonAction), for: UIControl.Event.touchUpInside);
        self.view.addSubview(attackButton);
    }
    
    private func initModel() {
        dog = SWIFTCocoaMVCAnimal();
        dog?.name = "蠢狗";
        dog?.bloodVolume = 50.00;
        dog?.aggressivity = 0.00;
        dog?.defenses = 5.00;
    }

    @objc private func attackButtonAction(sender: UIButton) {
        
        if let dogAnimal = dog {
            
            let reduceValue:Float = Float(arc4random() % 15);
            let bloodReduceValue = reduceValue - dogAnimal.defenses;
            if bloodReduceValue <= 0 {
                
                self.showPromptText(text: "无效攻击！", isError: true)
                return;
            }
            if dogAnimal.bloodVolume > bloodReduceValue {
              
                dogAnimal.bloodVolume = dogAnimal.bloodVolume - bloodReduceValue;
                detailView.bloodVolumeLabel.text = "血量：\(dogAnimal.bloodVolume)";
                self.showPromptText(text: (dogAnimal.name! + "受到\(bloodReduceValue)伤害"), isError: false);
            } else {
               
                dogAnimal.bloodVolume = 0;
                detailView.bloodVolumeLabel.text = "血量：\(dogAnimal.bloodVolume)";
                self.showPromptText(text: "蠢狗死了", isError: true);
                sender.isEnabled = false;
                sender.backgroundColor = UIColor.lightGray;
            }
        }
        
        
    }
    
    private func showPromptText(text: String, isError: Bool) {
        
        promptLabel.textColor = isError ? UIColor.red : UIColor.green;
        promptLabel.text = text;
        promptLabel.isHidden = false;
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.0) {
            
            self.promptLabel.isHidden = true;
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
