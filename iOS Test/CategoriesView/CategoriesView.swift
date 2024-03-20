//
//  CategoriesView.swift
//  iOS Test
//
//  Created by Rashif on 19/02/24.
//

import SwiftUI
import UIKit

struct HorizontalCollectionView: UIViewRepresentable {
    @Binding var currentCategoryIndex: Int
    let imageNames: [String]
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let spacing: CGFloat = 20
        let itemWidth = UIScreen.main.bounds.width - (spacing * 2) - 20
        layout.itemSize = CGSize(width: itemWidth, height: 150)
        layout.minimumLineSpacing = spacing
        layout.sectionInset = UIEdgeInsets(top: 0, left: spacing, bottom: 0, right: spacing)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = context.coordinator
        collectionView.dataSource = context.coordinator
        collectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return collectionView
    }
    
    func updateUIView(_ uiView: UICollectionView, context: Context) {
        uiView.reloadData()
    }
    
    class Coordinator: NSObject, UICollectionViewDelegate, UICollectionViewDataSource {
        var parent: HorizontalCollectionView
        
        init(_ parent: HorizontalCollectionView) {
            self.parent = parent
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return parent.imageNames.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ImageCollectionViewCell
            cell.configure(with: parent.imageNames[indexPath.row])
            return cell
        }
        
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            guard let collectionView = scrollView as? UICollectionView else { return }
            let visibleRect = CGRect(origin: scrollView.contentOffset, size: scrollView.bounds.size)
            let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
            guard let visibleIndexPath = collectionView.indexPathForItem(at: visiblePoint) else { return }
            
            parent.currentCategoryIndex = visibleIndexPath.row
            print("\(parent.imageNames[visibleIndexPath.row]) fully scrolled")
        }
        
    }
}

class ImageCollectionViewCell: UICollectionViewCell {
    private var imageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
        imageView.layer.cornerRadius = 10
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with imageName: String) {
        imageView.image = UIImage(named: imageName)
    }
}
