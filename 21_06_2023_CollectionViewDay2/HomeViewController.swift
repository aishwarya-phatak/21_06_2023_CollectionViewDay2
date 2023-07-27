//
//  ViewController.swift
//  21_06_2023_CollectionViewDay2
//
//  Created by Vishal Jagtap on 27/07/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var studentCollectionView: UICollectionView!
    
    private let studentCollectionViewReuseIdentifier = "DetailsViewController"
    
    private let studentCollectionViewCellReuseIdentifier = "StudentCollectionViewCell"
    
    var students : [Student] = [
        Student(studentName: "Tanaji", studentCity: "Pune", courseName: "iOS"),
        Student(studentName: "Sahil", studentCity: "Baramati", courseName: "iOS"),
        Student(studentName: "Vaishnavi", studentCity: "Baramati", courseName: "iOS"),
        Student(studentName: "Vaibhav", studentCity: "Parbhani", courseName: "iOS")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerAnXIB()
        studentCollectionView.delegate = self
        studentCollectionView.dataSource = self
        view.backgroundColor = .orange
    }
    
    func registerAnXIB(){
        let uiNib = UINib(nibName: studentCollectionViewCellReuseIdentifier, bundle: nil)
        self.studentCollectionView.register(uiNib, forCellWithReuseIdentifier: studentCollectionViewCellReuseIdentifier)
    }
}

extension HomeViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        students.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let studentCollectionViewCell = self.studentCollectionView.dequeueReusableCell(withReuseIdentifier: studentCollectionViewCellReuseIdentifier, for: indexPath) as! StudentCollectionViewCell
        
        studentCollectionViewCell.studentNameLabel.text = students[indexPath.row].studentName
        studentCollectionViewCell.courseNameLabel.text = students[indexPath.row].courseName
        studentCollectionViewCell.cityLabel.text = students[indexPath.row].studentCity
        
        studentCollectionViewCell.backgroundColor = .magenta
        
        studentCollectionViewCell.cityLabel.backgroundColor = .lightGray
        studentCollectionViewCell.studentNameLabel.backgroundColor = .lightGray
        studentCollectionViewCell.courseNameLabel.backgroundColor = .lightGray
        
        return studentCollectionViewCell ?? UICollectionViewCell()
    }
}


extension HomeViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        print(studentCollectionView.bounds.width)
        let studentCellWidth = studentCollectionView.bounds.width/4
        let studentCellHeight = studentCellWidth * 1.5
        
        return CGSize(width: studentCellWidth,
                      height: studentCellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailsViewController = self.storyboard?.instantiateViewController(withIdentifier: studentCollectionViewReuseIdentifier) as! DetailsViewController
        
        print(indexPath.item)
        
        detailsViewController.container =
        Student(
            studentName: students[indexPath.item].studentName,
            studentCity: students[indexPath.item].studentCity,
            courseName: students[indexPath.item].courseName)
        
        navigationController?.pushViewController(detailsViewController, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        5.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
}
