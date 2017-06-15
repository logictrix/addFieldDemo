//
//  ViewController.swift
//  AddmoreDemo
//
//  Created by Jaswant Panwar on 6/15/17.
//  Copyright © 2017 Logictrix. All rights reserved.
//

import UIKit

class ViewController: UIViewController,AvalabileTimeDelegate {
 @IBOutlet weak var addsubView: AvalabileTimeView!
    @IBOutlet weak var addSuperview: UIView!
    var space: CGFloat!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addMoreBnt(_ sender: UIButton) {
       
      for constraint in addSuperview.constraints {
            if constraint.firstAttribute == NSLayoutAttribute.height
            {
                constraint.constant +=  45
                space = constraint.constant
                
            }
        }
        
        
        let newView : AvalabileTimeView = AvalabileTimeView()
        
        //copiedView = AvalabileTimeView.copyView() as! UIView
        newView.frame = CGRect(x: self.addsubView.frame.origin.x, y: 70, width: addsubView.frame.size.width, height:addsubView.frame.size.height)
        newView.delegate = self as AvalabileTimeDelegate
        // copiedView.backgroundColor = UIColor.red
        addSuperview.addSubview(newView)
        // [addSuperview.subviews indexOfObject:newView]
        let index = addSuperview.subviews.index(of: newView)!
        print(index)
        
        newView.translatesAutoresizingMaskIntoConstraints = false
        let heightConstraint = newView.widthAnchor.constraint(equalToConstant:addsubView.frame.size.width )
        let widthConstaint = newView.heightAnchor.constraint(equalToConstant:31 )
        
        let topConstraint = newView.topAnchor.constraint(equalTo: addSuperview.topAnchor, constant: space - 31)
        NSLayoutConstraint.activate([heightConstraint,topConstraint,widthConstaint])
        
        // adddsubView.frame.size.height += 38
        
        // }
        
        //    addSuperview.translatesAutoresizingMaskIntoConstraints = false
        //        let heightConstraint = addSuperview.heightAnchor.constraint(equalToConstant: 95)
        //        NSLayoutConstraint.activate([heightConstraint])
        
        
      
        
    }
    func txtcheck(text: String!) {
        print(text)
        for constraint in addSuperview.constraints {
            if constraint.firstAttribute == NSLayoutAttribute.height
            {
                constraint.constant -=  45
                // space = constraint.constant
                
            }
        }
        
    }
    


}

