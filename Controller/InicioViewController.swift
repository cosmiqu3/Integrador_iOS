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
    
    @IBOutlet weak var terminosSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        DesHabilitaStartButton()
    }

    @IBAction func StartOnTap(_ sender: Any) {
        
        DesHabilitaStartButton()
        switchChange(sender)
       
        
    }
    @IBAction func TyCOnTap(_ sender: Any) {}
    
    @IBAction func TerminosSwitch(_ sender: Any) {
        
        HabilitaStartButton()
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
        if requeridoLabel.isHidden {
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
        
        let menorQue = Int(participantes) ?? 0
        if menorQue == 0 {
            return "NO puede estar vacio o ser menor que 0"
        }
        return nil
    }
    
    @IBAction func switchChange(_ sender: Any) {
        if terminosSwitch.isOn{
            participantesChanged(sender)
            
        }else{
            
            imprimirAlertaTerminos()
            DesHabilitaStartButton()
            
        }
    }
    
    func DesHabilitaStartButton()
    {
        startButton.isEnabled = false
        participantesTextField.isHidden = false
        
        requeridoLabel.text = "Valor Obligatorio"
        requeridoLabel.isHidden = true
        
        
    }
    
    
    
    func imprimirAlertaTerminos(){
        let alert = UIAlertController(title: "Terminos y Condiciones", message: "Para continuar usted debe haceptar Terminos y Condiciones", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        

        self.present(alert, animated: true)
    }
}

