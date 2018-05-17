//
//  File.swift
//  WebViewDemo


import UIKit
import Cartography

class PersonView: UIView {
    
    let idLabel: UILabel = {
        let label = UILabel()
        label.text = "id:"
        
        return label
    }()
    
    let firstNameLabel: UILabel = {
        let label = UILabel()
        label.text = "First Name:"
        
        return label
    }()
    
    let lastNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Last Name:"
        
        return label
    }()
    
    let avatarImageView: UIImageView = {
        
        let imageView = UIImageView()
        
        return imageView
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .orange
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func alignViews(){
        
        addSubview(idLabel)
        addSubview(firstNameLabel)
        addSubview(lastNameLabel)
        addSubview(avatarImageView)
        
        let views = [idLabel, firstNameLabel, lastNameLabel, avatarImageView]
        
        constrain(views){ view in
            
            view[0].left == view[0].superview!.left + 10
            view[0].right == view[0].superview!.right - 10
            view[0].top == view[0].superview!.top + 10
            view[0].height == 30
            
            view[1].left == view[1].superview!.left + 10
            view[1].right == view[1].superview!.right - 10
            view[1].top == view[0].bottom + 10
            view[1].height == 30
            
            view[2].left == view[2].superview!.left + 10
            view[2].right == view[2].superview!.right - 10
            view[2].top == view[1].bottom + 10
            view[2].height == 30
            
            view[3].top == view[2].bottom + 10
            view[3].left == view[3].superview!.left + 10
            view[3].width == 100
            view[3].height == 100
            
        }
        
    }
    
    func loadView(){
        
        Webservice.shared.getPerson { (person) in
            if let person = person{
                
                self.idLabel.text = "id: \(person.id)"
                self.firstNameLabel.text = "First Name: \(person.first_name)"
                self.lastNameLabel.text = "Last Name: \(person.last_name)"
                self.avatarImageView.imageFromServerURL(urlString: person.avatarPath)
                
            }
        }
        
    }
}
