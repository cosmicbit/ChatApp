//
//  LoadingView.swift
//  ChatApp
//
//  Created by Philips on 04/07/25.
//

import UIKit

class LoadingView: UIView {

   
    @IBOutlet var containerView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initSubViews()
    }
    
    func initSubViews() {
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: Bundle(for: type(of: self)))
        nib.instantiate(withOwner: self)
        containerView.frame = bounds
        containerView.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        addSubview(containerView)
    }
}
