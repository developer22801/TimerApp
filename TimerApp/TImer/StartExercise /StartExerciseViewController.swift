//
//  StartExerciseViewController.swift
//  TimerApp
//
//  Created by Makar Grushka on 15.11.2023.
//

import UIKit

class StartExerciseViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    
    var exercises: [Exercise]?
    var currentExerciseIndex: Int = 0
    var isRestTime: Bool = false
    var timer: Timer?
    var timeRemaining: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()
        updateUI()
    }
    
    func startTimer() {
        timeRemaining = isRestTime ? exercises?[currentExerciseIndex].restTime ?? 0 : exercises?[currentExerciseIndex].exerciseTime ?? 0
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        timeRemaining -= 1
        updateUI()
        
        if timeRemaining == 0 {
            timer?.invalidate()
            showNextScreen()
        }
    }
    
    func updateUI() {
        timerLabel.text = "\(timeRemaining)s"
        titleLabel.text = isRestTime ? "Rest Time" : "Exercise: \(exercises?[currentExerciseIndex].name ?? "")"
        
        view.backgroundColor = isRestTime ? #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1) : #colorLiteral(red: 0.1882352941, green: 0.6901960784, blue: 0.7803921569, alpha: 1)
    }
    
    func showNextScreen() {
        if isRestTime {
            // Перехід до наступного етапу вправи
            currentExerciseIndex += 1
            
            if currentExerciseIndex < exercises?.count ?? 0 {
                // Встановлення часу для вправи та запуск таймеру
                isRestTime = false
                startTimer()
            } else {
                // Всі вправи завершені
                showCompletionScreen()
            }
        } else {
            // Перехід до відпочинку
            isRestTime = true
            startTimer()
        }
    }
    
    func showCompletionScreen() {
         
        let uiAlert = UIAlertController(title: "Congratulations", message: "You did it!!", preferredStyle: .alert)
        
        let okayAction = UIAlertAction(title: "okay", style: .default) { [weak self] (_) in
            self?.navigationController?.popToRootViewController(animated: true)
        }
        
        uiAlert.addAction(okayAction)
        
        present(uiAlert, animated: true, completion: nil)
    }
    
    deinit {
        timer?.invalidate()
    } 
}
