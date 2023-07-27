//
//  DetailsViewController.swift
//  21_06_2023_CollectionViewDay2
//
//  Created by Vishal Jagtap on 27/07/23.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var studentNameLabel: UILabel!
    @IBOutlet weak var courseNameLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    var container : Student?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindDataToLabels()
       
    }
    
    func bindDataToLabels(){
        studentNameLabel.text = container?.studentName
        courseNameLabel.text = container?.courseName
        cityLabel.text = container?.studentCity
    }
}
