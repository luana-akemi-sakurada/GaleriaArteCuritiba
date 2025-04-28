import UIKit

class DetalhesObraViewController: UIViewController {
    
    private let obra: ObraDeArte
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let imagemView = UIImageView()
    private let tituloLabel = UILabel()
    private let artistaLabel = UILabel()
    private let anoLabel = UILabel()
    private let estiloLabel = UILabel()
    private let descricaoLabel = UILabel()
    private let compartilharButton = UIButton(type: .system)
    
    init(obra: ObraDeArte) {
        self.obra = obra
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) não foi implementado")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = obra.titulo
        
        configurarUI()
        preencherDados()
    }

    private func configurarUI() {
        // Configurar scrollView
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        // Configurar imagemView
        imagemView.contentMode = .scaleAspectFit
        imagemView.clipsToBounds = true
        imagemView.translatesAutoresizingMaskIntoConstraints = false
        
        // Configurar labels
        configurarLabel(tituloLabel, fontSize: 24, weight: .bold)
        configurarLabel(artistaLabel, fontSize: 20, weight: .medium)
        configurarLabel(anoLabel, fontSize: 16)
        configurarLabel(estiloLabel, fontSize: 16)
        configurarLabel(descricaoLabel, fontSize: 16)
        descricaoLabel.numberOfLines = 0
        
        // Configurar botão de compartilhar
        compartilharButton.setTitle("Compartilhar", for: .normal)
        compartilharButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        compartilharButton.backgroundColor = .systemBlue
        compartilharButton.setTitleColor(.white, for: .normal)
        compartilharButton.layer.cornerRadius = 8
        compartilharButton.translatesAutoresizingMaskIntoConstraints = false
        compartilharButton.addTarget(self, action: #selector(compartilharTapped), for: .touchUpInside)
        
        // Adicionar subviews
        contentView.addSubview(imagemView)
        contentView.addSubview(tituloLabel)
        contentView.addSubview(artistaLabel)
        contentView.addSubview(anoLabel)
        contentView.addSubview(estiloLabel)
        contentView.addSubview(descricaoLabel)
        contentView.addSubview(compartilharButton)
        
        // Configurar constraints
        NSLayoutConstraint.activate([
            imagemView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            imagemView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            imagemView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            imagemView.heightAnchor.constraint(equalTo: imagemView.widthAnchor, multiplier: 0.8),
            
            tituloLabel.topAnchor.constraint(equalTo: imagemView.bottomAnchor, constant: 16),
            tituloLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            tituloLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            artistaLabel.topAnchor.constraint(equalTo: tituloLabel.bottomAnchor, constant: 8),
            artistaLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            artistaLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            anoLabel.topAnchor.constraint(equalTo: artistaLabel.bottomAnchor, constant: 16),
            anoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            anoLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            estiloLabel.topAnchor.constraint(equalTo: anoLabel.bottomAnchor, constant: 8),
            estiloLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            estiloLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            descricaoLabel.topAnchor.constraint(equalTo: estiloLabel.bottomAnchor, constant: 16),
            descricaoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descricaoLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            compartilharButton.topAnchor.constraint(equalTo: descricaoLabel.bottomAnchor, constant: 24),
            compartilharButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            compartilharButton.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.8),
            compartilharButton.heightAnchor.constraint(equalToConstant: 44),
            compartilharButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -24)
        ])
    }
    
    private func configurarLabel(_ label: UILabel, fontSize: CGFloat, weight: UIFont.Weight = .regular) {
        label.font = UIFont.systemFont(ofSize: fontSize, weight: weight)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func preencherDados() {
        imagemView.image = UIImage(named: obra.imagemNome)
        tituloLabel.text = obra.titulo
        artistaLabel.text = obra.artista
        anoLabel.text = "Ano: \(obra.ano)"
        estiloLabel.text = "Estilo: \(obra.estilo)"
        descricaoLabel.text = obra.descricao
    }
    
    @objc private func compartilharTapped() {
        let textoCompartilhamento = "Conheça '\(obra.titulo)' de \(obra.artista). Venha descobrir mais artistas curitibanos!"
        
        let activityViewController = UIActivityViewController(
            activityItems: [textoCompartilhamento],
            applicationActivities: nil
        )
        
        // Para iPad
        if let popoverController = activityViewController.popoverPresentationController {
            popoverController.sourceView = compartilharButton
            popoverController.sourceRect = compartilharButton.bounds
        }
        
        present(activityViewController, animated: true)
    }
}
