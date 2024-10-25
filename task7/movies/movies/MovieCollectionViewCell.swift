//
//  MovieCollectionViewCell.swift
//  movies
//
//  Created by Алан Абзалханулы on 25.10.2024.
//
import UIKit
class MovieCollectionViewCell: UICollectionViewCell {
    // MARK: - Properties
    static let identifier = "MovieCollectionViewCell"
    private var imageLoadTask: URLSessionDataTask?
    // MARK: - UI Elements
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .systemGray6
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .label
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let yearLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .secondaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let genreLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .secondaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Methods
    private func setupUI() {
        contentView.backgroundColor = .systemBackground
        contentView.layer.cornerRadius = 12
        contentView.layer.masksToBounds = true
        
        [posterImageView, titleLabel, yearLabel, genreLabel].forEach {
            contentView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            posterImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            posterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            posterImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            posterImageView.heightAnchor.constraint(equalToConstant: 200),
            
            titleLabel.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            
            yearLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            yearLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            
            genreLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            genreLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)
        ])
    }
    
    // MARK: - Configuration
    func configure(with movie: Movie) {
        titleLabel.text = movie.title
        yearLabel.text = String(movie.year)
        genreLabel.text = movie.genre
        
        // Отменяем предыдущую загрузку если она есть
        imageLoadTask?.cancel()
        
        // Показываем placeholder пока грузится изображение
        posterImageView.image = nil
        posterImageView.backgroundColor = .systemGray6
        
        // Загружаем изображение
        ImageLoader.shared.loadImage(from: movie.posterImage) { [weak self] image in
            self?.posterImageView.backgroundColor = image == nil ? .systemGray6 : .clear
            self?.posterImageView.image = image
        }
    }
    
    // MARK: - Reuse
    override func prepareForReuse() {
            super.prepareForReuse()
            imageLoadTask?.cancel()
            posterImageView.image = nil
            posterImageView.backgroundColor = .systemGray6
            titleLabel.text = nil
            yearLabel.text = nil
            genreLabel.text = nil
        }
}
