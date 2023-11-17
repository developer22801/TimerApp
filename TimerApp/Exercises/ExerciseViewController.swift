//
//  ExerciseViewController.swift
//  TimerApp
//
//  Created by Makar Grushka on 07.11.2023.
//

import UIKit

class ExerciseViewController: UIViewController{
    
    @IBOutlet weak var startExercises: UIButton!
    @IBOutlet weak var exercisesTableView: UITableView!
    
    var exercises: [Exercise]?
    
    @IBAction func startExerciseButtonTapped(_ sender: Any) {
        let startExerciseVC = StartExerciseViewController(nibName: "StartExerciseViewController", bundle: nil)
          
          startExerciseVC.exercises = exercises
          
          navigationController?.pushViewController(startExerciseVC, animated: true)
          print("Button tapped")
      }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        exercisesTableView.register(UINib(nibName: "ExerciseTableViewCell", bundle: nil), forCellReuseIdentifier: "ExerciseCell")
        
        startExercises.layer.cornerRadius = startExercises.frame.width / 2
        exercisesTableView.delegate = self
        exercisesTableView.dataSource = self
        //        exercisesTableView.isEditing = true
    }
}

extension ExerciseViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        exercises?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ExerciseCell") as? ExerciseTableViewCell {
            let item = exercises?[indexPath.row]
            cell.exerciseTime.text = String(item?.exerciseTime ?? 0) + "s"
            cell.restTime.text = String(item?.restTime ?? 0) + "s"
            cell.nameLabel.text = item?.name
            return cell
        }
        return UITableViewCell()
    }
}
