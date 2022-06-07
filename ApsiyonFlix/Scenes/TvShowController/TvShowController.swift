//
//  TvShowController.swift
//  ApsiyonFlix
//
//  Created by Arslan Kaan AYDIN on 6.06.2022.
//

import UIKit
import SnapKit
import Alamofire

//MARK: - Protocols
protocol TvShowOutput {
    func selectedTvShow(tvShowID: Int)
}

class TvShowController: UIViewController {
    //MARK: - UI Elements
    private let tableView: UITableView = {
        let tv = UITableView()
        tv.separatorStyle = .none
        tv.rowHeight = 200
        return tv
    }()
    
    private let switchButton: UIButton = {
        // Switch Button Configures
        let button = UIButton()
        button.backgroundColor = .clear
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitle("MOVIES", for: .normal)
        button.setTitleColor(Color.appWhite, for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        // Switch Button Dashed Line
        let rect = CGRect.init(origin: CGPoint.init(x: button.center.x, y: button.center.y), size: CGSize.init(width: 250 , height: 50))
        let layer = CAShapeLayer.init()
        let path = UIBezierPath(roundedRect: rect, cornerRadius: 12)
        layer.path = path.cgPath;
        layer.strokeColor = UIColor.lightGray.cgColor;
        layer.lineDashPattern = [3,3];
        layer.backgroundColor = UIColor.clear.cgColor;
        layer.fillColor = UIColor.clear.cgColor;
        button.layer.addSublayer(layer);
        return button
    }()
    //MARK: - Properties
    private lazy var tvShowResult = [TvShowResult]()
    private var viewModel: TvShowViewModelProtocol  = TvShowViewModel(service: Services())
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    //MARK: - Functions
    private func configure() {
        subviews()
        drawDesign()
        fetchData()
        makeTableView()
        makeSwitchButton()
    }
    
    private func drawDesign() {
        // View
        view.backgroundColor = Color.appBlack
        // View Model
        viewModel.delegate = self
        // Navigation Bar
        configureNavigationBar(largeTitleColor: Color.appWhite, backgoundColor: Color.appBlack, tintColor: Color.appWhite, title: "Tv Shows", preferredLargeTitle: false)
        self.navigationItem.setHidesBackButton(true, animated: true)
        // Table View
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TvShowTableCell.self, forCellReuseIdentifier: TvShowTableCell.Identifier.custom.rawValue)
    }
    
    private func subviews() {
        view.addSubview(tableView)
        view.addSubview(switchButton)
    }
    //MARK: - Fetch 100 Datas
    private func fetchData() {
        
        for i in 1...5 {
            viewModel.fetchPopularTvShows(page: i) { [weak self] tvShow in
                guard let tvShows = tvShow?.results else { return }
                self?.tvShowResult.append(contentsOf: tvShows)
                
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            } onError: { error in
                print(error)
            }
        }

    }
    //MARK: - Button Action
    @objc func buttonAction(sender: UIButton!) {
        sender.showAnimation {
            self.dismissDetail()
        }
    }
}
//MARK: - Table View Extension
extension TvShowController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tvShowResult.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: TvShowTableCell = tableView.dequeueReusableCell(withIdentifier: TvShowTableCell.Identifier.custom.rawValue) as? TvShowTableCell else {
            return UITableViewCell()
        }
        cell.saveTvShowModel(model: tvShowResult[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.delegate?.selectedTvShow(tvShowID: tvShowResult[indexPath.row].id ?? 0)
    }
}
//MARK: - Snapkit Extension
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

// MARK: - View Model Extension
extension TvShowController: TvShowOutput {
    func selectedTvShow(tvShowID: Int) {
        viewModel.getTvShowDetail(tvShowID: tvShowID) { tvShow in
            guard let tvShow = tvShow else { return }
            self.navigationController?.pushViewController(TvShowDetailController(detailResults: tvShow), animated: true)
        } onError: { error in
            print(error)
        }

    }

}
