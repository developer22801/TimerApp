//
//  ViewController.swift
//  TimerApp
//
//  Created by Makar Grushka on 07.11.2023.
//

import UIKit

class CreateExercisesViewController: UIViewController {
    
    private var exercises: [Exercise] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func startExercise(){
        guard let exerciseVC = storyboard?.instantiateViewController(withIdentifier:  "startExercise") as? ExerciseViewController else {return}
        exerciseVC.exercises = exercises
        
        if let navigationController = navigationController {
            navigationController.pushViewController(exerciseVC, animated: true)
        }
    }
    
    // MARK: Action for buttons
    
    @IBAction func startNewSet(_ sender: Any) {
        startExercise()
    }
    
    @IBAction func createNewSetButtonTapped(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Create New Exercise Set", message: nil, preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.placeholder = "Exercise name"
        }
        alertController.addTextField { (textField) in
            textField.placeholder = "Time for Exercise"
            textField.keyboardType = .numberPad
        }
        alertController.addTextField { (textField) in
            textField.placeholder = "Time for a rest"
            textField.keyboardType = .numberPad
        }
        
        let addAction = UIAlertAction(title: "Add", style: .default) { [weak self] (_) in
            guard let exerciseName = alertController.textFields?[0].text,
                  let exerciseTime = alertController.textFields?[1].text,
                  let restTime = alertController.textFields?[2].text else { return }
            
            if let exerciseTime = Int(exerciseTime), let restTime = Int(restTime) {
                let exercise = Exercise(name: exerciseName, exerciseTime: exerciseTime, restTime: restTime)
                self?.exercises.append(exercise)
                
               
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(addAction)
        alertController.addAction(cancelAction)
        
        
        present(alertController, animated: true, completion: nil)
       
    }
    
    
}
