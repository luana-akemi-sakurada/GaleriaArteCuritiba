import UIKit

class ObraCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI Elements
    private let imagemView = UIImageView()
    private let tituloLabel = UILabel()
    private let artistaLabel = UILabel()
    
    // MARK: - Inicialização
    override init(frame: CGRect) {
        super.init(frame: frame)
        configurarUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) não foi implementado")
    }
    
    // MARK: - Configuração da UI
    private func configurarUI() {
        // Configurar contentView
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 8
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOffset = CGSize(width: 0, height: 2)
        contentView.layer.shadowRadius = 4
        contentView.layer.shadowOpacity = 0.2
        
        // Configurar imagemView
        imagemView.contentMode = .scaleAspectFill
        imagemView.clipsToBounds = true
        imagemView.layer.cornerRadius = 8
        imagemView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        // Configurar tituloLabel
        tituloLabel.font = UIFont.boldSystemFont(ofSize: 16)
        tituloLabel.textColor = .black
        tituloLabel.numberOfLines = 2
        
        // Configurar artistaLabel
        artistaLabel.font = UIFont.systemFont(ofSize: 14)
        artistaLabel.textColor = .darkGray
        
        // Adicionar subviews
        contentView.addSubview(imagemView)
        contentView.addSubview(tituloLabel)
        contentView.addSubview(artistaLabel)
        
        // Configurar constraints
        imagemView.translatesAutoresizingMaskIntoConstraints = false
        tituloLabel.translatesAutoresizingMaskIntoConstraints = false
        artistaLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imagemView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imagemView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imagemView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imagemView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.7),
            
            tituloLabel.topAnchor.constraint(equalTo: imagemView.bottomAnchor, constant: 8),
            tituloLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            tituloLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            
            artistaLabel.topAnchor.constraint(equalTo: tituloLabel.bottomAnchor, constant: 4),
            artistaLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            artistaLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            artistaLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
    // MARK: - Configuração da célula
    func configurar(com obra: ObraDeArte) {
        imagemView.image = UIImage(named: obra.imagemNome)
        tituloLabel.text = obra.titulo
        artistaLabel.text = obra.artista
    }
}
