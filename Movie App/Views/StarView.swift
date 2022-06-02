//
//  StarView.swift
//  Movie App
//
//  Created by Eugene Kotovich on 02.06.2022.
//

import UIKit

public class StarsView: UIView {

  public var rating: Int = 0 {
    didSet {
      for i in 0..<5 {
        imageViews[i].tintColor = i < rating ? .orange : .gray
      }
    }
  }
  
  private let imageViews: [UIImageView]
  
  public init() {
    imageViews = (0..<5).map { _ in
      UIImageView(image: UIImage(named: "star"))
    }
    
    super.init(frame: .zero)
    
    directionalLayoutMargins = .zero
    
    let stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    
    for view in imageViews {
      stackView.addArrangedSubview(view)
    }
    
    addSubview(stackView)
    
    NSLayoutConstraint.activate([
      stackView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
      stackView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
      stackView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
      stackView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
    ])
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
