Funcionalidade: Cadastro de Produto

Cenário: Cadastro de produto com dados válidos
    Dado que estou na tela de cadastro de produto
    Quando eu informo o nome do produto "Produto A"
    E eu informo o preço "100.00"
    E eu informo a validade "31/12/2021"
    E eu clico no botão "Salvar"
    Então o produto deve ser cadastrado com sucesso
    E deve aparecer na listagem de produtos

Cenário: Cadastro de produto com preço menor que zero
    Dado que estou na tela de cadastro de produto
    Quando eu informo o nome do produto "Produto B"
    E eu informo o preço "-10.00"
    E eu informo a validade "31/12/2021"
    E eu clico no botão "Salvar"
    Então deve exibir uma mensagem de erro "O preço não pode ser menor que zero"
    E o produto não deve ser cadastrado
    E o produto não deve aparecer na listagem de produtos

Cenário: Cadastro de produto com validade após 31/12/2021
    Dado que estou na tela de cadastro de produto
    Quando eu informo o nome do produto "Produto C"
    E eu informo o preço "50.00"
    E eu informo a validade "01/01/2022"
    E eu clico no botão "Salvar"
    Então deve exibir uma mensagem de erro "A validade só pode ser informada até 31/12/2021"
    E o produto não deve ser cadastrado
    E o produto não deve aparecer na listagem de produtos

Cenário: Cadastro de produto sem nome
    Dado que estou na tela de cadastro de produto
    Quando eu deixo o campo nome do produto em branco
    E eu informo o preço "25.00"
    E eu informo a validade "30/11/2021"
    E eu clico no botão "Salvar"
    Então deve exibir uma mensagem de erro "O nome do produto é obrigatório"
    E o produto não deve ser cadastrado
    E o produto não deve aparecer na listagem de produtos

Cenário: Cadastro de produto com todos os campos em branco
    Dado que estou na tela de cadastro de produto
    Quando eu deixo todos os campos em branco
    E eu clico no botão "Salvar"
    Então deve exibir uma mensagem de erro "Todos os campos são obrigatórios"
    E o produto não deve ser cadastrado
    E o produto não deve aparecer na listagem de produtos

Funcionalidade: Cadastro de Produto

Cenário: Cadastro de produto com nome duplicado
    Dado que já existe um produto cadastrado com o nome "Produto D"
    E estou na tela de cadastro de produto
    Quando eu informo o nome do produto "Produto D"
    E eu informo o preço "30.00"
    E eu informo a validade "31/12/2021"
    E eu clico no botão "Salvar"
    Então deve exibir uma mensagem de erro "Já existe um produto com esse nome"
    E o produto não deve ser cadastrado
    E o produto não deve aparecer na listagem de produtos

Cenário: Cadastro de produto com preço zero
    Dado que estou na tela de cadastro de produto
    Quando eu informo o nome do produto "Produto E"
    E eu informo o preço "0.00"
    E eu informo a validade "30/11/2021"
    E eu clico no botão "Salvar"
    Então o produto deve ser cadastrado com sucesso
    E deve aparecer na listagem de produtos

Cenário: Cadastro de produto com validade em formato incorreto
    Dado que estou na tela de cadastro de produto
    Quando eu informo o nome do produto "Produto F"
    E eu informo o preço "20.00"
    E eu informo a validade "31/13/2021"
    E eu clico no botão "Salvar"
    Então deve exibir uma mensagem de erro "Formato de data inválido"
    E o produto não deve ser cadastrado
    E o produto não deve aparecer na listagem de produtos

Cenário: Cadastro de produto com preço com mais de duas casas decimais
    Dado que estou na tela de cadastro de produto
    Quando eu informo o nome do produto "Produto G"
    E eu informo o preço "10.123"
    E eu informo a validade "31/12/2021"
    E eu clico no botão "Salvar"
    Então deve exibir uma mensagem de erro "O preço deve ter no máximo duas casas decimais"
    E o produto não deve ser cadastrado
    E o produto não deve aparecer na listagem de produtos

Cenário: Cadastro de produto com validade no limite permitido
    Dado que estou na tela de cadastro de produto
    Quando eu informo o nome do produto "Produto H"
    E eu informo o preço "60.00"
    E eu informo a validade "31/12/2021"
    E eu clico no botão "Salvar"
    Então o produto deve ser cadastrado com sucesso
    E deve aparecer na listagem de produtos
