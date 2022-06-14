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

        // Do any additional setup after loading the view.
    }
    
    @IBAction func TryButton(_ sender: Any) {
        
    }
    
    func getActividadesCategoria(){
        let urlActividades = "http://www.boredapi.com/api/activity/"
        AF.request(urlActividades).response { response in
            
            guard let data = response.data else {
                print("Servicio no arroja resultados")
                return
            }
            do{
                let result = try JSONDecoder().decode(ActividadesResponse.self, from: data)
                print(result)
                
                self.TituloLabel.text = result.activity
                self.ParticipanteLabel.text = String(result.participants)
               
            } catch let error{
                print("Existe Error: \(error)")
                
            }
            
        }
        
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
