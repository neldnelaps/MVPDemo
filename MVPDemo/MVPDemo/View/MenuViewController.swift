//
//  MenuViewController.swift
//  MVPDemo
//
//  Created by Natalia Pashkova on 14.04.2023.
//

import Foundation
import SnapKit
import UIKit

class MenuViewController: UIViewController {
    let tableView = UITableView()
    var menuPresenter: MenuPresenterProtocol?
    
    override func loadView() {
        let view = UIView()
        self.view = view
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        let mintView = UIView()
        mintView.backgroundColor = .systemMint
        mintView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(mintView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(tableView)
        
        
        let exampleButton = UIButton()
        exampleButton.setTitle("test", for: .normal)
        exampleButton.translatesAutoresizingMaskIntoConstraints = false
        exampleButton.addTarget(menuPresenter, action: #selector(menuPresenter?.buttonPressed), for: .touchUpInside)
        self.view.addSubview(exampleButton)
        
        mintView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(50)
        }

        tableView.snp.makeConstraints { make in
            make.top.equalTo(mintView.snp.bottom)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }

        exampleButton.snp.makeConstraints { make in
            make.centerX.equalTo(mintView.snp.centerX)
            make.centerY.equalTo(mintView.snp.centerY)
            make.height.equalTo(mintView.snp.height)
            make.width.equalTo(mintView.snp.width)
        }
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension MenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        menuPresenter?.showDetail(data: menuPresenter?.data[indexPath.row] ?? "")
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension MenuViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        menuPresenter?.data.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = menuPresenter?.data[indexPath.row]
        return cell
    }
}

extension MenuViewController {
    func set(presenter: MenuPresenterProtocol) {
        self.menuPresenter = presenter
    }
}
