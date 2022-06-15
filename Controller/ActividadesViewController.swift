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
    
        let arrglosActividades = ActividadesManager.shared.activiadesArr
        let objActiviades: Activiades = arrglosActividades[indexPath.row]
        
//        let activiadesCell = tableView.dequeueReusableCell(withIdentifier: "CeldasActiviades", for: indexPath)
//        var listContentConfiguration = UIListContentConfiguration.cell()
//        listContentConfiguration.text = objActiviades.nombreActiviad
//
//        activiadesCell.contentConfiguration = listContentConfiguration
        
        let cell: ActividadesTableViewCell = actividadesTableView.dequeueReusableCell(withIdentifier: "CeldasActiviades", for: indexPath) as! ActividadesTableViewCell
        
        cell.ActividadesLabel.text = objActiviades.nombreActiviad
        let tipo = objActiviades.typeActividad
        
        
        
        return cell
    }

}
