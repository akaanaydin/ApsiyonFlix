//
//  TvShowController.swift
//  ApsiyonFlix
//
//  Created by Arslan Kaan AYDIN on 6.06.2022.
//

import UIKit
import SnapKit

class TvShowController: UIViewController {
    
    private let tableView: UITableView = {
        let tv = UITableView()
        tv.separatorStyle = .none
        tv.rowHeight = 200
        return tv
    }()
    
    private let switchButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitle("MOVIES", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        let rect = CGRect.init(origin: CGPoint.init(x: button.center.x, y: button.center.y), size: CGSize.init(width: 250 , height: 50))
        let layer = CAShapeLayer.init()
        let path = UIBezierPath(roundedRect: rect, cornerRadius: 12)
        layer.path = path.cgPath;
        layer.strokeColor = UIColor.red.cgColor;
        layer.lineDashPattern = [3,3];
        layer.backgroundColor = UIColor.clear.cgColor;
        layer.fillColor = UIColor.clear.cgColor;
        button.layer.addSublayer(layer);
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    
    
    private func configure() {
        subviews()
        drawDesign()
        makeTableView()
        makeSwitchButton()
    }
    
    private func drawDesign() {
        view.backgroundColor = .white
        
        configureNavigationBar(largeTitleColor: .black, backgoundColor: .white, tintColor: .black, title: "Tv Shows", preferredLargeTitle: false)
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TvShowTableCell.self, forCellReuseIdentifier: TvShowTableCell.Identifier.custom.rawValue)
        
    }
    
    private func subviews() {
        view.addSubview(tableView)
        view.addSubview(switchButton)
    }
    
    @objc func buttonAction(sender: UIButton!) {
        sender.showAnimation {
            self.dismissDetail()
        }
    }
}

extension TvShowController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: TvShowTableCell = tableView.dequeueReusableCell(withIdentifier: TvShowTableCell.Identifier.custom.rawValue) as? TvShowTableCell else {
            return UITableViewCell()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension TvShowController {
    private func makeTableView() {
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview().inset(110)
            make.centerX.equalToSuperview()
        }
    }
    
    private func makeSwitchButton() {
        switchButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(30)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(250)
        }
    }
    
}
