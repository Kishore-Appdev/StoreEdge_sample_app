//
//  Extensions.swift
//  StorEdgeApp
//
//  Created by admin on 03/08/23.
//

import Foundation
import UIKit
 
extension UIView {
    func applyRoundedCorners(radius:CGFloat){
        layer.cornerRadius=radius
        clipsToBounds=true
    }
    
    func addBottomBorderLineWithColor(color:UIColor, width:CGFloat)
    {
      
        let bottomBorderLine=CALayer()
        bottomBorderLine.backgroundColor=color.cgColor
        bottomBorderLine.frame=CGRect(x: 0, y: self.frame.size.height-width, width: self.frame.size.width, height: width)
        
        self.layer.addSublayer(bottomBorderLine)
        self.addObserver(self, forKeyPath: "bounds", options: .new, context: nil)
    }
    
    func addTopBorderLineWithColor(color:UIColor,width:CGFloat)
    {
        let topBorderLine=CALayer()
        topBorderLine.backgroundColor=color.cgColor
        topBorderLine.frame=CGRect(x: 0, y: 0, width: self.frame.size.width, height: 1)
        self.layer.addSublayer(topBorderLine)
    }
    
    override open func observeValue(forKeyPath keyPath: String?, of object: Any?, change:[NSKeyValueChangeKey: Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "bounds" { // Update the bottom border line
            if let sublayers = self.layer.sublayers {
                
                for layer in sublayers {
                    if layer.backgroundColor == UIColor.black.cgColor || layer.backgroundColor==UIColor.gray.cgColor || layer.backgroundColor==UIColor.red.cgColor || layer.backgroundColor==UIColor.white.cgColor {
                        
                        layer.frame = CGRect(x: 0, y: self.frame.size.height - layer.bounds.size.height, width: self.frame.size.width, height: layer.bounds.size.height)
                        
                    }
                    
                }
                
            }
            
        }
    }
    
}

import UIKit

 

extension UINavigationBar {
    func setCustomTitleAttributes(color: UIColor, font: UIFont) {
        let textAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: color,
            .font: font
        ]
        titleTextAttributes = textAttributes
        largeTitleTextAttributes = textAttributes
    }

 

    func setCustomTintColor(_ color: UIColor) {
        tintColor = color
    }

 

    func setCustomBarButtonAttributes(color: UIColor, font: UIFont) {
        let barButtonAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: color,
            .font: font
        ]
        UIBarButtonItem.appearance().setTitleTextAttributes(barButtonAttributes, for: .normal)
        UIBarButtonItem.appearance().setTitleTextAttributes(barButtonAttributes, for: .highlighted)
    }
}


 

extension UINavigationBar {
    func setDarkOrangeAppearance() {
     
        let fontSize: CGFloat = 23.0 // Set your desired font size here

 

        // Use .heavy font weight for the bold effect
        let titleFont = UIFont.systemFont(ofSize: fontSize, weight: .heavy)

 

        let textAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor(red: 0.8, green: 0.4, blue: 0.0, alpha: 1.0),
            .font: titleFont
        ]
        titleTextAttributes = textAttributes
        largeTitleTextAttributes = textAttributes

 

        tintColor = UIColor(ciColor: .red)

 

        // Use .heavy font weight for the bold effect
        let barButtonFont = UIFont.systemFont(ofSize: fontSize, weight: .heavy)
        let barButtonAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor(ciColor: .red),
            .font: barButtonFont
        ]
        UIBarButtonItem.appearance().setTitleTextAttributes(barButtonAttributes, for: .normal)
        UIBarButtonItem.appearance().setTitleTextAttributes(barButtonAttributes, for: .highlighted)
    }
}



extension String{
    func validateEmailId()->Bool {
        let emailRegEx="[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        return applyPredicateOnRegex(regexStr: emailRegEx)
    }
    
    func validatePassword(mini:Int = 8,max:Int = 8)->Bool{
        var passRegEx=""
        if mini>=max{
            passRegEx="^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z@\\d]{\(mini),}$"
        }else{
            passRegEx="^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{\(mini),\(max)}$"
            
        }
        return applyPredicateOnRegex(regexStr: passRegEx)
    }
    
    func applyPredicateOnRegex(regexStr:String) -> Bool{
        let trimmedString=self.trimmingCharacters(in: .whitespaces)
        let validateOtherString=NSPredicate(format:"SELF MATCHES %@" , regexStr)
        let isValidateOtherSting=validateOtherString.evaluate(with: trimmedString)
        return isValidateOtherSting
    }
}
