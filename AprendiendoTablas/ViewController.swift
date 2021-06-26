//
//  ViewController.swift
//  AprendiendoTablas
//
//  Created by Field Employee on 6/25/21.
//

import UIKit

class ViewController: UIViewController {
    //MARK: Referencia de la tabla
    
    @IBOutlet weak var tableView: UITableView!
    
    //
    private var dataSource = [
    "@Froy",
    "@Eve",
    "@Naelia"
    ]
    
    //MARK: REFERENCIAS AL XIB
    
    
    /*
    1. Implementar Data Source
     */
     
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //Siempre poner
        tableView.dataSource = self
        // registro viejo
        //tableView.register(UITableViewCell.self, forCellReuseIdentifier: "mi_celda")
        // registrar el Xib
        tableView.register(UINib(nibName: "TweertTableViewCell", bundle: nil), forCellReuseIdentifier: "TweertTableViewCell")
        //Para interactuar implementar el delegate
        
        tableView.delegate = self
    }


}

//MARK: UITableViewDataDelegate
extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
        print("La celda \(indexPath.row) fue seleccionada")
    }
}


//MARK: UITableViewDataSource
extension ViewController: UITableViewDataSource{
    // 1. Numero de filas que tendra la tabla
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //le digo que tendra 20 filas
        return dataSource.count
    }
    
    //2. Metodo para saber que celda debe mostrarse
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //le indico la celda
        //let cell = tableView.dequeueReusableCell(withIdentifier: "mi_celda", for:indexPath )
        let cell = tableView.dequeueReusableCell(withIdentifier: "TweertTableViewCell", for:indexPath )
        //casteamos la celda
        if let newCell = cell as? TweertTableViewCell{
            newCell.setupCell(username: dataSource[indexPath.row], message: "soy un Tweet")
        }
        //lo mismo que arriba en menos codigo
        //(newCell as? TweertTableViewCell)?.setupCell(username: "@usuario\(indexPath.row)", message: "soy un Tweet")
        
        //cell.textLabel?.text = "Soy la celda # \(indexPath.row)"
        
        return cell
    }
    
}

