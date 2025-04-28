class GerenciadorDados {
    static let compartilhado = GerenciadorDados()
    
    var obras: [ObraDeArte] = [
        ObraDeArte(
            titulo: "Voo da Liberdade",
            artista: "Poty Lazzarotto",
            ano: 1970,
            estilo: "Modernismo / Arte Pública",
            imagemNome: "obra1",
            descricao: "Poty é um dos mais reconhecidos artistas de Curitiba, famoso por seus murais em espaços públicos. 'Voo da Liberdade' representa a busca humana por emancipação e liberdade. Poty trabalhou muito com temas históricos e sociais, sempre usando traços fortes e narrativas visuais."
        ),
        ObraDeArte(
            titulo: "Rituais",
            artista: "Rogério Dias",
            ano: 2018,
            estilo: "Contemporâneo / Expressionismo",
            imagemNome: "obra2",
            descricao: "Rogério é conhecido por misturar elementos urbanos e indígenas em suas obras. Em 'Rituais', ele explora a conexão espiritual do ser humano com a natureza, usando cores intensas e texturas orgânicas."
        ),
        ObraDeArte(
            titulo: "Cidade Inventada",
            artista: "André Mendes",
            ano: 2015,
            estilo: "Arte Contemporânea / Arte Urbana",
            imagemNome: "obra3",
            descricao: "André trabalha com pintura e instalações que misturam realidade e imaginação. 'Cidade Inventada' é uma série de painéis que reconstroem Curitiba de forma onírica e surreal, convidando o espectador a pensar sobre urbanização e memória."
        ),
    ]
}
