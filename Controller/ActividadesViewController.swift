//
//  ActividadesViewController.swift
//  Integrador_iOS
//
//  Created by training on 09-06-22.
//

import UIKit

class ActividadesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    

    
    @IBOutlet weak var actividadesTableView: UITableView!
    //    let actividadesTableView: UITableView = {
//        let tableView = UITableView()
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        return tableView
//    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        actividadesTableView.dataSource = self //la fuente de datos la controlo yo
        
//        actividadesTableView.register(UITableViewCell.self, forCellReuseIdentifier: "CeldasActiviades")
        // Do any additional setup after loading the view.
        actividadesTableView.delegate  = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        actividadesTableView.reloadData()
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ActividadesManager.shared.activiadesArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let arreglosActividades = ActividadesManager.shared.activiadesArr
        let objActiviades: Activiades = arreglosActividades[indexPath.row]
        
//        let activiadesCell = tableView.dequeueReusableCell(withIdentifier: "CeldasActiviades", for: indexPath)
//        var listContentConfiguration = UIListContentConfiguration.cell()
//        listContentConfiguration.text = objActiviades.nombreActiviad
//
//        activiadesCell.contentConfiguration = listContentConfiguration
        
        let cell: ActividadesTableViewCell = actividadesTableView.dequeueReusableCell(withIdentifier: "CeldasActiviades", for: indexPath) as! ActividadesTableViewCell
        
        cell.ActividadesLabel.text = objActiviades.nombreActiviad
//        print(objActiviades.typeActividad)
//        let tipo = objActiviades.typeActividad
    
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let arreglosActividades = ActividadesManager.shared.activiadesArr
        let objActiviades: Activiades = arreglosActividades[indexPath.row]
        
        performSegue(withIdentifier: "segueActividad", sender: objActiviades.typeActividad)
        printContent(objActiviades.typeActividad)
    }
    
    
//    override func performSegue(withIdentifier identifier: String, sender: Any?) {
//        if identifier == "segueActividad"{
//            if let controller = segue.destination as? CategoriaViewController{
//
//                controller.tipo = "recreational"//sender as! String
//
//            }
//        }
//    }
    
 
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "segueActividad"{
//            if let controller = segue.destination as? CategoriaViewController{
//
//                controller.tipo = sender as! String
//
//            }
//        }
//    }

}
