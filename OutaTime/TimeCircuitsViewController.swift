//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Lorenzo on 1/24/21.
//

import UIKit

class TimeCircuitsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        destinationTime.text = ""
        presentTime.text = dateFormatter.string(from: date)
        speed.text = "\(currentSpeed) MPH"
        lastTimeDeparted.text = "--- -- ----"
        
    }
    
    let date = Date()
    
    @IBOutlet weak var destinationTime: UILabel!
    @IBOutlet weak var presentTime: UILabel!
    @IBOutlet weak var lastTimeDeparted: UILabel!
    @IBOutlet weak var speed: UILabel!
    @IBOutlet weak var setDateButton: UIButton!
    @IBAction func travelBack(_ sender: Any) {
        startTimer()
    }
    private var timer: Timer?
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: updateSpeedLabel(timer:))
    }
    
   private func updateSpeedLabel(timer: Timer) {
        if currentSpeed < 88 {
            currentSpeed += 1
            print(currentSpeed)
            speed.text = "\(currentSpeed) MPH"
        } else {
            timer.invalidate()
            lastTimeDeparted.text = presentTime.text
            presentTime.text = destinationTime.text
            currentSpeed = 0
            let alert = UIAlertController(title: "Time Travel Successful", message: "Your new date is \(presentTime.text ?? "unknown")", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    func resetTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    
    
    private var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        formatter.timeZone = TimeZone.current
        return formatter
    }()
    
    var currentSpeed = 0
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ModalDestinationDatePickerSegue" {
            if let datePickerVC = segue.destination as? DatePickerViewController {
                datePickerVC.delegate = self
            }
        }
    }
    
}

extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(date: Date) {
        destinationTime.text = dateFormatter.string(from: date)
    }
}
