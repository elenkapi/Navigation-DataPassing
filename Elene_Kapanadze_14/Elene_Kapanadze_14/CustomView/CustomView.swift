//
//  CustomView.swift
//  Elene_Kapanadze_14
//
//  Created by Ellen_Kapii on 10.07.22.
//

import UIKit

class CustomView: UIView {
    var yesAction: (() -> Void)!
    
    @IBAction func yes(_ sender: UIButton) {
        yesAction()
    }
    
    @IBAction func no(_ sender: UIButton) {
        removeFromSuperview()
    }
    
}
