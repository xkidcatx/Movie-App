//
//  MovieCardController.swift
//  Movie App
//
//  Created by Eugene Kotovich on 02.06.2022.
//

import UIKit

class MovieCardController: UIViewController {
    
    private let closebutton: UIButton = {
        $0.setBackgroundImage(UIImage(named: "closeButton"), for: .normal)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        return $0
    }(UIButton())
    
    private let posterView: UIImageView = {
        $0.image = UIImage(named: "poster")
        $0.contentMode = .scaleAspectFill
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())
    
    private let movieTitle: UILabel = {
        $0.text = "Криминальное чтиво"
        $0.font = UIFont.boldSystemFont(ofSize: 30)
        $0.textAlignment = .center
        $0.textColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    private let yearLabel: UILabel = {
        $0.text = "1994 •"
        $0.font = UIFont.systemFont(ofSize: 18)
        $0.textColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    private let genreLabel: UILabel = {
        $0.text = "Триллер, Криминал •"
        $0.font = UIFont.systemFont(ofSize: 18)
        $0.textColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    private let longestLabel: UILabel = {
        $0.text = "2ч 34м"
        $0.font = UIFont.systemFont(ofSize: 18)
        $0.textColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    let starRating: StarsView = {
        return $0
    }(StarsView())
    
    private let rewievLabel: UILabel = {
        $0.text = "Двое бандитов Винсент Вега и Джулс Винфилд проводят время в философских беседах в перерыве между разборками и «решением проблем» с должниками своего криминального босса Марселласа Уоллеса. Параллельно разворачивается три истории. В первой из них Винсент присматривает за женой Марселласа Мией и спасает ее от передозировки наркотиков. Во второй рассказывается о Бутче Кулидже, боксере, нанятом Уоллесом, чтобы сдать бой, но обманувшим его."
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.numberOfLines = 0
        $0.textAlignment = .justified
        $0.textColor = .lightGray
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    private let castLabel: UILabel = {
        $0.text = "Актеры"
        $0.textColor = .white
        $0.font = .boldSystemFont(ofSize: 20)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    private let actorView = ActorView()
    
    private let watchNowButton: UIButton = {
        $0.setTitle("Cмотреть онлайн", for: .normal)
        $0.backgroundColor = .red
        $0.tintColor = .white
        $0.layer.cornerRadius = 15
        $0.titleLabel?.font = .boldSystemFont(ofSize: 20)
        $0.titleLabel?.textColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIButton(type: .system))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstraints()

    }
    
    func configure(model: MovieCard) {
        movieTitle.text = model.name
    }
    
    @objc func closeButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true)
    }

    var labelStack = UIStackView()
    
    private func setupViews() {
        view.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        
        view.addSubview(posterView)
        view.addSubview(closebutton)
        view.addSubview(movieTitle)
        view.addSubview(rewievLabel)
        labelStack = UIStackView(arrangedSubviews: [yearLabel, genreLabel, longestLabel],
                                 axis:.horizontal,
                                 spacing: 5)
        
        view.addSubview(labelStack)
        view.addSubview(castLabel)
        view.addSubview(actorView)
        view.addSubview(watchNowButton)
        
    }

    private func setConstraints() {
        
        NSLayoutConstraint.activate([
        posterView.topAnchor.constraint(equalTo: view.topAnchor),
        posterView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        posterView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        posterView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25)
        ])
        
        NSLayoutConstraint.activate([
            closebutton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            closebutton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            movieTitle.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -65),
            movieTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            labelStack.topAnchor.constraint(equalTo: movieTitle.bottomAnchor, constant: 0),
            labelStack.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            rewievLabel.topAnchor.constraint(equalTo: labelStack.bottomAnchor, constant: 10),
            rewievLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            rewievLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            castLabel.topAnchor.constraint(equalTo: rewievLabel.bottomAnchor, constant: 10),
            castLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            actorView.topAnchor.constraint(equalTo: castLabel.bottomAnchor, constant: 5),
            actorView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            actorView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            watchNowButton.heightAnchor.constraint(equalToConstant: 50),
            watchNowButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            watchNowButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            watchNowButton.topAnchor.constraint(equalTo: actorView.bottomAnchor, constant: 5),
            watchNowButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }
}
