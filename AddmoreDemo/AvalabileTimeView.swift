//
//  AvalabileTimeView.swift
//  Sports Reservation
//
//  Created by Jaswant Panwar on 6/7/17.
//  Copyright © 2017 Logictrix 's. All rights reserved.
//

import UIKit

protocol AvalabileTimeDelegate{
    func txtcheck(text: String!)
  //  func sendView(view: UIView)
   // func superView(view: UIView)
}

class AvalabileTimeView: UIView,UITextFieldDelegate {

    @IBOutlet weak var deletebnt: UIButton!
    @IBOutlet weak var toTimeTxt: UITextField!
    @IBOutlet weak var fromTimeTxt: UITextField!
    @IBOutlet weak var weekendTxt: UITextField!
    @IBOutlet weak var priceText: UITextField!
    var delegate:AvalabileTimeDelegate! = nil

    var view: UIView!
    
    var countstr = "getcount"
       override init(frame: CGRect) {
        // 1. setup any properties here
        
        // 2. call super.init(frame:)
        super.init(frame: frame)
        
        // 3. Setup view from .xib file
        xibSetup()
    }
   
    required init?(coder aDecoder: NSCoder) {
        // 1. setup any properties here
        
        // 2. call super.init(coder:)
        super.init(coder: aDecoder)
        
        // 3. Setup view from .xib file
        xibSetup()
    }
    
    func xibSetup() {
        view = loadViewFromNib()
        
        // use bounds not frame or it'll be offset
        view.frame = bounds
        
        // Make the view stretch with containing view
        view.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        // Adding custom subview on top of our view (over any custom drawing > see note below)
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView {
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "AvalabileTimeView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        toTimeTxt.delegate = self
        fromTimeTxt.delegate = self
        priceText.delegate = self
        weekendTxt.delegate = self
    
        return view
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        view.frame = bounds
    
    }
    
    @IBAction func deletebnt(_ sender: UIButton) {
        //let views = deletebnt.superview
        let view = self.superview
        _ = self.deletebnt.superview
        let index =  view?.subviews.index(of:self)!
        print(index!)

       
        delegate.txtcheck(text: countstr)
      //  delegate.sendView(view:views!)
       
        print("done tapped")
         self.view.removeFromSuperview()
      //  self.countstr = "getcount"
    
    }
    
    
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
