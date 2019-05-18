//
//  StartExercisesVC.swift
//  CatalogueOfExercises
//
//  Created by Antony Kolesynskyi on 5/2/19.
//  Copyright © 2019 Antony Kolesynskyi. All rights reserved.
//

import UIKit
import SCLAlertView


class StartExercisesVC: UIViewController {
    
    var restTime = UserDefaults.standard.integer(forKey: "restTime") == 0 ? 11 : UserDefaults.standard.integer(forKey: "restTime")
    var trainingTime = UserDefaults.standard.integer(forKey: "trainingTime") == 0 ? 30 : UserDefaults.standard.integer(forKey: "trainingTime")
    
    var currentExercisesIndex = 0
    var trainingTimer = Timer()
    var restTimer = Timer()
    var pauseButtunIsClicked = false
    var arrayOfExercises = dataArray.fullExercisesArray[pageType]
    var arrayOfColors = dataArray.fullArrayOfColors[pageType]
    
    @IBOutlet weak var exercisesTypeLabel: UILabel!
    @IBOutlet weak var trainingTimeLabel: UILabel!
    @IBOutlet weak var nextExercisesLabel: UILabel!
    @IBOutlet weak var statisticNumberLabel: UILabel!
    @IBOutlet weak var pauseButton: UIBarButtonItem!
    
    @IBAction func pauseButtonAction(_ sender: Any) {
        pauseFunc()
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        pauseFunc()
        backButtonAlert()
    }
    
    //цикл повторений
    func restFunc() {
        restTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(counterOfRest), userInfo: nil, repeats: true)
    }
    
    func pauseFunc() {
        
        if pauseButtunIsClicked == true {
            pauseButtunIsClicked = false
            pauseButton.title = String("Пауза")
            restFunc()
        } else {
            pauseButtunIsClicked = true
            pauseButton.title = String("Продолжить")
            trainingTimer.invalidate()
            restTimer.invalidate()
        }
    }
    
    //цикл повторений
    func startFunc() {
        trainingTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(counterOfTime), userInfo: nil, repeats: true)
    }
    
    @objc func counterOfRest() {
        exercisesTypeLabel.text = "Приготовься!"
        nextExercisesLabel.text = String("Следующее:\n \(arrayOfExercises[currentExercisesIndex])")
        restTime -= 1
        print("\(currentExercisesIndex) currentExercisesIndex")
        trainingTimeLabel.text = String(restTime)
        if restTime == 0 {
            restTime = 11
            restTimer.invalidate()
            trainingTimer.fire()
            startFunc()
            print("rest time end")
        }
    }
    
    @objc func counterOfTime() {
        print("4")
        exercisesTypeLabel.text = arrayOfExercises[currentExercisesIndex]
        nextExercisesLabel.text = String("Следующее:\n \(arrayOfExercises[currentExercisesIndex + 1])") 
        statisticNumberLabel.text = String("\(currentExercisesIndex + 1) из 12")
        trainingTimeLabel.text = String(trainingTime)

        view.backgroundColor = arrayOfColors[currentExercisesIndex]
        self.navigationController?.navigationBar.barTintColor = arrayOfColors[currentExercisesIndex]
        trainingTime -= 1

        if trainingTime < 0 {
            trainingTime = 30
            currentExercisesIndex += 1
            trainingTimer.invalidate()
            restTimer.fire()
            restFunc()
            if currentExercisesIndex == 12 {
                statisticNumberLabel.text = String("12 из 12")
                exercisesTypeLabel.text = String("Финиш")
                restTimer.invalidate()
                trainingTimer.invalidate()
                showResultsAlert()
                dismiss(animated: true, completion: nil)
            }
        }
    }
    
    func showAlert() {
        let appearance = SCLAlertView.SCLAppearance(
            showCloseButton: false // hide default button
        )
        let alert = SCLAlertView(appearance: appearance)
        alert.addButton("Да") {
            print("Start Trainig")
            self.restFunc()
        }
        alert.addButton("Нет") {
            self.navigationController?.popViewController(animated: true)
            print("dismiss")
        }
        alert.showWarning("Внимание!", subTitle: "Вы готовы к началу тренировки?", animationStyle: .bottomToTop)
    }
    
    func showResultsAlert() {
        
        let appearance = SCLAlertView.SCLAppearance(
            showCloseButton: false 
        )
        let alert = SCLAlertView(appearance: appearance)
        alert.addButton("OK") {
            self.navigationController?.popViewController(animated: true)
        }
        alert.showSuccess("Тренеровка окончена!", subTitle: "За 8 минут тренировки, вам удалось сжечь 236 Ккал енергии.")
    }
    
    func backButtonAlert() {
        let alert = SCLAlertView()
        alert.addButton("Уйти") {
            self.navigationController?.popViewController(animated: true)
        }
        
        alert.showWarning("Вы хотите уйти?", subTitle: "Тренировка еще не закончилась.", closeButtonTitle: "Продолжать")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        showAlert()
        nextExercisesLabel.textColor = UIColor.white
        exercisesTypeLabel.textColor = UIColor.white
        trainingTimeLabel.textColor = UIColor.white
        statisticNumberLabel.textColor = UIColor.white
        view.backgroundColor =      self.navigationController?.navigationBar.barTintColor

        pauseButton.title = String("Пауза")
        statisticNumberLabel.text = String("\(currentExercisesIndex + 1) из 12")
        print("\(pageType) page type")
        print("\(arrayOfColors) array of colors")

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        restTimer.invalidate()
        trainingTimer.invalidate()
    }
    
}
