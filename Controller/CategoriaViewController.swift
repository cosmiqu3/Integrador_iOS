//
//  CategoriaViewController.swift
//  Integrador_iOS
//
//  Created by training on 14-06-22.
//

import UIKit
import Alamofire
class CategoriaViewController: UIViewController {

    @IBOutlet weak var TituloLabel: UILabel!
    @IBOutlet weak var ParticipanteLabel: UILabel!
    @IBOutlet weak var PrecioLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        getActividadesCategoria(tipo: "education")

        // Do any additional setup after loading the view.
    }
    
    @IBAction func TryButton(_ sender: Any) {
        getActividadesCategoria(tipo: "education")
    }
    
    func getActividadesCategoria(tipo: String){
        let urlActividades = "http://www.boredapi.com/api/activity"
        let parametro = ["type": tipo]
        
        
        AF.request(urlActividades,
                   method: .get,
                   parameters: parametro).response { response in
            
            guard let data = response.data else {
                print("Servicio no arroja resultados")
                return
            }
            do{
                let result = try JSONDecoder().decode(ActividadesResponse.self, from: data)
                print(result)
                
                self.TituloLabel.text = result.activity
                self.ParticipanteLabel.text = String(result.participants)
                self.validaPrecios(precio: Double(result.price))

            } catch let error{
                print("Existe Error: \(error)")
                
            }
            
        }
        
    }
    
    func validaPrecios(precio: Double){
        
        switch precio{
        case 0.0:
            PrecioLabel.text = Precio.free.rawValue
        
        case 0.0...0.3:
            PrecioLabel.text = Precio.low.rawValue
            
        case 0.3...0.6:
            PrecioLabel.text = Precio.medium.rawValue
            
        default:
            PrecioLabel.text = Precio.high.rawValue
            
        }
        
        
//        if precio == 0.0 {
//
//            PrecioLabel.text = Precio.free.rawValue
//        } else if precio > 0.0 && precio <= 0.3 {
//
//            PrecioLabel.text = Precio.low.rawValue
//
//        } else if precio > 3.0 && precio <= 0.6 {
//
//            PrecioLabel.text = Precio.medium.rawValue
//
//        } else {
//            PrecioLabel.text = Precio.high.rawValue
//        }
        
        
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
