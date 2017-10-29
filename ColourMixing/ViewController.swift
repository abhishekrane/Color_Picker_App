//
//  ViewController.swift
//  ColourMixing
//
//  Created by Abhishek rane on 9/30/17.
//  Copyright © 2017 Abhishek rane. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueTextField: UITextField!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var colourButton: UIButton!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var myView: UIView!
    var redValue :Float = 0
    var blueValue :Float = 0
    var greenValue :Float = 0
    
    @IBAction func colourButtonClicked(_ sender: Any) {
    
    func redColour ()-> Float
  {
    if(redTextField.text!.isEmpty || !isStringInt(str: redTextField.text!))
    {
    let alertController = UIAlertController(title: "Warning", message: "Please enter a valid input.",preferredStyle: .alert)
    let Ok = UIAlertAction(title: "Ok", style: .default) { (_) in}
    alertController.addAction(Ok)
    self.present(alertController, animated: true, completion: nil)
    redTextField.text = "0";
    }
    else if(Float(redTextField.text!)! < 0){
        let alertController = UIAlertController(title: "Warning", message: "Please enter a valid input.",preferredStyle: .alert)
        let Ok = UIAlertAction(title: "Ok", style: .default) { (_) in}
        alertController.addAction(Ok)
        self.present(alertController, animated: true, completion: nil)
        redTextField.text = "0";
    }
    else if (Float(redTextField.text!)! > 100)
      {
     let alertController = UIAlertController(title: "Warning", message: "The input is out of range.",preferredStyle: .alert)
     let Ok = UIAlertAction(title: "Ok", style: .default) { (_) in}
     alertController.addAction(Ok)
     self.present(alertController, animated: true, completion: nil)
     redTextField.text = "100";
      }
 return Float (redTextField.text!)!
}
    
  
 func blueColour ()-> Float
{
   if(blueTextField.text!.isEmpty || !isStringInt(str: blueTextField.text!))
    {
     let alertController = UIAlertController(title: "Warning", message: "Please enter a valid input.",preferredStyle: .alert)
     let Ok = UIAlertAction(title: "Ok", style: .default) { (_) in}
     alertController.addAction(Ok)
     self.present(alertController, animated: true, completion: nil)
     blueTextField.text = "0";
    }
   else if(Float(blueTextField.text!)! < 0){
    let alertController = UIAlertController(title: "Warning", message: "Please enter a valid input.",preferredStyle: .alert)
    let Ok = UIAlertAction(title: "Ok", style: .default) { (_) in}
    alertController.addAction(Ok)
    self.present(alertController, animated: true, completion: nil)
    blueTextField.text = "0";
   }
     else if (Float(blueTextField.text!)! > 100)
    {
    let alertController = UIAlertController(title: "Warning", message: "The input is out of range.",preferredStyle: .alert)
    let Ok = UIAlertAction(title: "Ok", style: .default) { (_) in}
    alertController.addAction(Ok)
    self.present(alertController, animated: true, completion: nil)
    blueTextField.text = "100";
    }
return Float (blueTextField.text!)!
}
        

 func greenColour ()-> Float
 {
    if(greenTextField.text!.isEmpty || !isStringInt(str: greenTextField.text!) )
    {
    let alertController = UIAlertController(title: "Warning", message: "Please enter a valid input.",preferredStyle: .alert)
    let Ok = UIAlertAction(title: "Ok", style: .default) { (_) in}
    alertController.addAction(Ok)
    self.present(alertController, animated: true, completion: nil)
    greenTextField.text = "0";
    } else if(Float(greenTextField.text!)! < 0){
        let alertController = UIAlertController(title: "Warning", message: "Please enter a valid input.",preferredStyle: .alert)
        let Ok = UIAlertAction(title: "Ok", style: .default) { (_) in}
        alertController.addAction(Ok)
        self.present(alertController, animated: true, completion: nil)
        greenTextField.text = "0";
    }
     else if (Float(greenTextField.text!)! > 100)
     {
     let alertController = UIAlertController(title: "Warning", message: "The input is out of range.",preferredStyle: .alert)
     let Ok = UIAlertAction(title: "Ok", style: .default) { (_) in}
     alertController.addAction(Ok)
     self.present(alertController, animated: true, completion: nil)
     greenTextField.text = "100";
     }
return Float (greenTextField.text!)!
}
  
func isStringInt(str : String) -> Bool{
return Float(str) != nil
}

 redValue = redColour();
 blueValue = blueColour();
 greenValue = greenColour();
        
 redSlider.value = Float(redTextField.text!)!/100;
 greenSlider.value = Float(greenTextField.text!)!/100;
 blueSlider.value = Float(blueTextField.text!)!/100;

myView.backgroundColor = UIColor(displayP3Red: CGFloat(redValue/100.0), green: CGFloat(greenValue/100.0), blue: CGFloat(blueValue/100.0), alpha: CGFloat(1))
self.view.endEditing(true)
save()
    }
    
    @IBAction func sliderValue(_ sender: Any) {
        
        
        redTextField.text = String(Int(redSlider.value * 100));
        greenTextField.text = String(Int(greenSlider.value * 100));
        blueTextField.text = String(Int(blueSlider.value * 100));
        myView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue:
        CGFloat(blueSlider.value), alpha: CGFloat(1))
       
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myView.backgroundColor = UIColor.black
        self.redTextField.delegate = self
        self.greenTextField.delegate = self
        self.blueTextField.delegate = self
        redTextField.keyboardType = UIKeyboardType.numberPad
        greenTextField.keyboardType = .numberPad
        blueTextField.keyboardType = .numberPad
       
     }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        get()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func save(){
        let defaults = UserDefaults.standard
        defaults.setValue(redValue, forKey: "red")
        defaults.setValue(greenValue, forKey: "green")
        defaults.setValue(blueValue, forKey: "blue")
    }
    
    func get(){
        let defaults = UserDefaults.standard
        if let redcolor = defaults.string(forKey: "red"), let greencolor = defaults.string(forKey: "green"), let bluecolor = defaults.string(forKey: "blue"){
            redValue = Float(redcolor)!
            greenValue = Float(greencolor)!
            blueValue = Float(bluecolor)!
        }
        generateValuesOnLoad()
    }
    
    func generateValuesOnLoad(){
        myView.backgroundColor = UIColor(displayP3Red: CGFloat(redValue/100.0), green: CGFloat(greenValue/100.0), blue: CGFloat(blueValue/100.0), alpha: CGFloat(1))
        redTextField.text = String(redValue)
        blueTextField.text = String(blueValue)
        greenTextField.text = String(greenValue)
        
        redSlider.value = redValue/100
        greenSlider.value = greenValue/100
        blueSlider.value = blueValue/100
    }
}

extension ViewController : UITextFieldDelegate
{
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        

        redTextField.resignFirstResponder()
        greenTextField.resignFirstResponder()
        blueTextField.resignFirstResponder()

        
    }
}
