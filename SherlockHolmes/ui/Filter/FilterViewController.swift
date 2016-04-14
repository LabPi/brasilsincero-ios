//
//  FilterViewController.swift
//  SherlockHolmes
//
//  Created by Daniely Botelho on 3/27/16.
//  Copyright © 2016 BrasilSincero. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

    @IBOutlet weak var filterView: UIView!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var region: UITextField!
    @IBOutlet weak var state: UITextField!

    var regions: NSArray! = ["Norte", "Nordeste", "Centro Oeste", "Sul", "Sudeste"]
    var states: NSArray! = ["Acre", "Alagoas", "Amapá", "Amazonas", "Bahia", "Ceará", "Distrito Federal", "Espírito Santo", "Goiás", "Maranhão", "Mato Grosso", "Mato Grosso do Sul", "Minas Gerais", "Pará", "Paraíba", "Paraná", "Pernambuco", "Piauí", "Rio de Janeiro", "Rio Grande do Norte", "Rio Grande do Sul", "Rondônia", "Roraima", "Santa Catarina", "São Paulo", "Sergipe", "Tocantins"]
    
    var currentArray: NSArray! = NSArray()
    var currentTextField: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filterView.alpha = 0
        
        let transition: CATransition! = CATransition()
        transition.duration = 0.5;
        transition.type = kCATransitionPush;
        transition.subtype = kCATransitionFromRight;
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        
        filterView.layer.addAnimation(transition, forKey: nil)
        filterView.alpha = 1.0
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        switch textField.tag {
        case 1:
            currentTextField = 1
            currentArray = regions
            pickerView.reloadAllComponents()
            pickerView.hidden = false
            break
        case 2:
            currentTextField = 2
            currentArray = states
            pickerView.reloadAllComponents()
            pickerView.hidden = false
            break
        default:
            pickerView.hidden = true
            break
        }
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currentArray.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currentArray[row] as? String
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch currentTextField {
        case 1:
            region.text = currentArray[row] as? String
            break
        default:
            state.text = currentArray[row] as? String
            break
        }
    }
    

    @IBAction func applyFilter(sender: AnyObject) {
        
        let transition: CATransition! = CATransition()
        transition.duration = 0.5;
        transition.type = kCATransitionPush;
        transition.subtype = kCATransitionFromLeft;
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        
        filterView.layer.addAnimation(transition, forKey: nil)
        self.view.alpha = 0
        self.view.removeFromSuperview()
    }
    
    @IBAction func closeFilterView() {
        let transition: CATransition! = CATransition()
        transition.duration = 0.5;
        transition.type = kCATransitionPush;
        transition.subtype = kCATransitionFromLeft;
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        
        filterView.layer.addAnimation(transition, forKey: nil)
        self.view.alpha = 0
        self.view.removeFromSuperview()
    }
}
