//
//  SWIFTVIPERView.swift
//  架构模式学习
//
//  Created by mo2323 on 2018/11/19.
//  Copyright © 2018年 com.developer.meanmouse. All rights reserved.
//

import UIKit

class SWIFTVIPERView: UIView {

    /** @brief 名称 */
    var nameLabel: UILabel!
    /** @brief 防御力 */
    var defensesLabel: UILabel!
    /** @brief 攻击力 */
    var aggressivityLabel: UILabel!
    /** @brief 血量 */
    var bloodVolumeLabel: UILabel!
    var attackButton:UIButton!
    weak var promptLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initSubViews();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setAnimal(animal: SWIFTVIPERAnimal) {
        
        nameLabel.text = animal.name;
        bloodVolumeLabel.text = "血量：\(animal.bloodVolume)";
        defensesLabel.text = "防御：\(animal.defenses)";
        aggressivityLabel.text = "攻击：\(animal.aggressivity)";
    }
    
    private func initSubViews() {
        
        let detailView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.size.width / 3.0, height: 150));
        detailView.backgroundColor = UIColor.lightGray;
        detailView.center = self.center;
        self.addSubview(detailView);
        
        nameLabel = UILabel(frame: CGRect(x: 0, y: 20, width: detailView.frame.size.width, height: 20));
        nameLabel.textColor = UIColor.red;
        nameLabel.textAlignment = NSTextAlignment.center;
        detailView.addSubview(nameLabel);
        
        bloodVolumeLabel = UILabel(frame: CGRect(x: 10, y: nameLabel.frame.maxY + 10, width: self.frame.size.width - 10, height: 20));
        bloodVolumeLabel.textColor = UIColor.red;
        detailView.addSubview(bloodVolumeLabel);
        
        aggressivityLabel = UILabel(frame: CGRect(x: 10, y: bloodVolumeLabel.frame.maxY + 10, width: self.frame.size.width - 10, height: 20));
        aggressivityLabel.textColor = UIColor.red;
        detailView.addSubview(aggressivityLabel);
        
        defensesLabel = UILabel(frame: CGRect(x: 10, y: aggressivityLabel.frame.maxY + 10, width: self.frame.size.width - 10, height: 20));
        defensesLabel.textColor = UIColor.red;
        detailView.addSubview(defensesLabel);
        
        let promptLabel = UILabel(frame: CGRect(x: 30, y: detailView.frame.origin.y - 50, width: self.frame.size.width - 60, height: 20));
        promptLabel.backgroundColor = UIColor.clear;
        promptLabel.textAlignment = NSTextAlignment.center;
        promptLabel.numberOfLines = 0;
        promptLabel.isHidden = true;
        self.promptLabel = promptLabel;
        self.addSubview(promptLabel);
        
        attackButton = UIButton(type: UIButton.ButtonType.custom);
        attackButton.frame = CGRect(x: ( self.frame.size.width - 120 ) / 2.0, y: detailView.frame.maxY + 30, width: 120, height: 35);
        attackButton.setTitleColor(UIColor.white, for: UIControl.State.normal);
        attackButton.backgroundColor = UIColor.red;
        self.addSubview(attackButton);
    }

}
