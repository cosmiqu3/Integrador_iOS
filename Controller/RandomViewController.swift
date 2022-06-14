//
//  SugerenciaViewController.swift
//  Integrador_iOS
//
//  Created by training on 13-06-22.
//

import UIKit
import Alamofire

class RandomViewController: UIViewController {

    @IBOutlet weak var TituloLabel: UILabel!
    @IBOutlet weak var ParticipanteLabel: UILabel!
    @IBOutlet weak var PrecioLabel: UILabel!
    @IBOutlet weak var CategoriaLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getActividadesRandom()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func TryButton(_ sender: Any) {
        getActividadesRandom()
    }
    
    func getActividadesRandom(){
        let urlActividades = "http://www.boredapi.com/api/activity/"
        AF.request(urlActividades).response { [self] response in
            
            guard let data = response.data else {
                print("Servicio no arroja resultados")
                return
            }
            do{
                let result = try JSONDecoder().decode(ActividadesResponse.self, from: data)
                print(result)
                
                TituloLabel.text = result.activity
                ParticipanteLabel.text = String(result.participants)
                CategoriaLabel.text = result.type
                
                
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