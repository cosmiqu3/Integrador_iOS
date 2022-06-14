//
//  ViewController.swift
//  Integrador_iOS
//
//  Created by training on 08-06-22.
//

import UIKit

class InicioViewController: UIViewController {

    @IBOutlet weak var participantesTextField: UITextField!
    @IBOutlet weak var requeridoLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        DesHabilitaStartButton()
    }

    @IBAction func StartOnTap(_ sender: Any) {
        DesHabilitaStartButton()
    }
    @IBAction func TyCOnTap(_ sender: Any) {}
    
    @IBAction func TerminosSwitch(_ sender: Any) {
        imprimirAlertaTerminos()
    }
    
    @IBAction func participantesChanged(_ sender: Any) {
        
       if let participantes = participantesTextField.text {
           
           if let mensajeError = ValidaParticipante(participantes){
               requeridoLabel.text = mensajeError
               requeridoLabel.isHidden = false
           }
           else {
               requeridoLabel.isHidden = true
           }
        }
        HabilitaStartButton()
    }
    
    func HabilitaStartButton(){
        if requeridoLabel.isHidden{
            startButton.isEnabled = true
        }else{
            startButton.isEnabled = false
        }
    }
    
    func ValidaParticipante (_ participantes: String) -> String?{
        let set = CharacterSet(charactersIn: participantes)
        if !CharacterSet.decimalDigits.isSuperset(of: set){
            return "Solo puede ingresar numeros"
        }
        return nil
    }
    
    func DesHabilitaStartButton()
    {
        startButton.isEnabled = false
        participantesTextField.isHidden = false
        
        participantesTextField.text = "Requerido"
        participantesTextField.text = ""
    }
    
    func imprimirAlertaTerminos(){
        let alert = UIAlertController(title: "Acepta terminos", message: "Usted debe hacertar los terminos", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Si", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))

        self.present(alert, animated: true)
    }
}

