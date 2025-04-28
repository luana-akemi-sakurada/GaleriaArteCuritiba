import UIKit

class GaleriaViewController: UIViewController {
    
    private var collectionView: UICollectionView!
    private let obras = GerenciadorDados.compartilhado.obras
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Galeria de Arte Curitibana"
        configurarCollectionView()
    }
    
    private func configurarCollectionView() {
        // Configurar o layout da collection view
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        // Calcular o tamanho das células
        let dispositivo = UIDevice.current.userInterfaceIdiom
        let colunas: CGFloat = dispositivo == .pad ? 3 : 2
        
        let espacamento: CGFloat = 10
        let larguraTela = view.frame.width
        let larguraCelula = (larguraTela - espacamento * (colunas + 1)) / colunas
        
        layout.itemSize = CGSize(width: larguraCelula, height: larguraCelula * 1.5)
        layout.minimumLineSpacing = espacamento
        layout.minimumInteritemSpacing = espacamento
        layout.sectionInset = UIEdgeInsets(top: espacamento, left: espacamento, bottom: espacamento, right: espacamento)
        
        // Inicializar a collection view
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .systemBackground
        
        // Registrar a célula
        collectionView.register(ObraCollectionViewCell.self, forCellWithReuseIdentifier: "ObraCell")
        
        // Configurar dataSource e delegate
        collectionView.dataSource = self
        collectionView.delegate = self
        
        view.addSubview(collectionView)
    }
}

extension GaleriaViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return obras.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ObraCell", for: indexPath) as? ObraCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let obra = obras[indexPath.item]
        cell.configurar(com: obra)
        return cell
    }
}

extension GaleriaViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let obra = obras[indexPath.item]
        let detalhesVC = DetalhesObraViewController(obra: obra)
        navigationController?.pushViewController(detalhesVC, animated: true)
    }
}
