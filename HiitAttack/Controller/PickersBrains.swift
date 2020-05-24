import UIKit

extension SetupViewController:UIPickerViewDataSource,UIPickerViewDelegate{
        
func numberOfComponents(in pickerView: UIPickerView) -> Int {
    switch pickerView.tag {
    case 0:
        return 4
    case 1 :
        return 4
    default:
        return 1
    }
}

func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    if pickerView.tag == 0 || pickerView.tag == 1 {
        switch component {
        case 0:
            return 1
        case 1:
            return timeArray.count
        case 2:
            return 1
        default:
            return timeArray.count
        }
    }
    return timeArray.count
}
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 0 || pickerView.tag == 1 {
            switch component {
            case 0:
                return "Min:"
            case 1:
                return "\(timeArray[row])"
            case 2:
                return "Sec:"
            default:
              return  "\(timeArray[row])"
            }
            
        }
        else {
            return "\(timeArray[row])"
        }
    
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 0:
            switch component {
            case 1:
                WorkoutTimes.workoutMinutes = row
            case 3:
                WorkoutTimes.workoutSeconds = row
            default:
                return
            }
        case 1:
            switch component {
            case 1:
                WorkoutTimes.restMinuts = row
            case 3:
                WorkoutTimes.restSecond = row
            default:
                return
            }
            
        default:
            WorkoutTimes.reps = row
        }
    }
    
}
    
    
    
    
    
