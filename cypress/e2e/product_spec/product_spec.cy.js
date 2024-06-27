// cypress/integration/product_spec.js

describe('Cadastro de Produto', () => {
  beforeEach(() => {
    cy.visit('/cadastroProduto'); // Ajuste a URL conforme necessário
  });

  it('Cadastro de produto com dados válidos', () => {
    cy.get('#inputNome').type('Produto A');
    cy.get('#inputPreco').type('100.00');
    cy.get('#inputValidade').type('31/12/2021');
    cy.contains('Adicionar').click();
    cy.contains('Produto A').should('exist');
  });

  it('Cadastro de produto com preço menor que zero', () => {
    cy.get('#inputNome').type('Produto B');
    cy.get('#inputPreco').type('-10.00');
    cy.get('#inputValidade').type('31/12/2021');
    cy.contains('Adicionar').click();
    cy.contains('O preço não pode ser menor que zero').should('exist');
  });

  it('Cadastro de produto com validade após 31/12/2021', () => {
    cy.get('#inputNome').type('Produto C');
    cy.get('#inputPreco').type('50.00');
    cy.get('#inputValidade').type('01/01/2022');
    cy.contains('Adicionar').click();
    cy.contains('A validade só pode ser informada até 31/12/2021').should('exist');
  });

  it('Cadastro de produto sem nome', () => {
    cy.get('#inputPreco').type('25.00');
    cy.get('#inputValidade').type('30/11/2021');
    cy.contains('Adicionar').click();
    cy.contains('O nome do produto é obrigatório').should('exist');
  });

  it('Cadastro de produto com todos os campos em branco', () => {
    cy.contains('Adicionar').click();
    cy.contains('Todos os campos são obrigatórios').should('exist');
  });

  it('Cadastro de produto com nome duplicado', () => {
    // Primeiro cadastro para criar duplicidade
    cy.get('#inputNome').type('Produto D');
    cy.get('#inputPreco').type('30.00');
    cy.get('#inputValidade').type('31/12/2021');
    cy.contains('Adicionar').click();
    cy.contains('Produto D').should('exist');
    
    // Tentativa de cadastro duplicado
    cy.visit('/cadastro-produto');
    cy.get('#inputNome').type('Produto D');
    cy.get('#inputPreco').type('30.00');
    cy.get('#inputValidade').type('31/12/2021');
    cy.contains('Adicionar').click();
    cy.contains('Já existe um produto com esse nome').should('exist');
  });

  it('Cadastro de produto com preço zero', () => {
    cy.get('#inputNome').type('Produto E');
    cy.get('#inputPreco').type('0.00');
    cy.get('#inputValidade').type('30/11/2021');
    cy.contains('Adicionar').click();
    cy.contains('Produto E').should('exist');
  });

  it('Cadastro de produto com validade em formato incorreto', () => {
    cy.get('#inputNome').type('Produto F');
    cy.get('#inputPreco').type('20.00');
    cy.get('#inputValidade').type('31/13/2021');
    cy.contains('Adicionar').click();
    cy.contains('Formato de data inválido').should('exist');
  });

  it('Cadastro de produto com preço com mais de duas casas decimais', () => {
    cy.get('#inputNome').type('Produto G');
    cy.get('#inputPreco').type('10.123');
    cy.get('#inputValidade').type('31/12/2021');
    cy.contains('Adicionar').click();
    cy.contains('O preço deve ter no máximo duas casas decimais').should('exist');
  });

  it('Cadastro de produto com validade no limite permitido', () => {
    cy.get('#inputNome').type('Produto H');
    cy.get('#inputPreco').type('60.00');
    cy.get('#inputValidade').type('31/12/2021');
    cy.contains('Adicionar').click();
    cy.contains('Produto H').should('exist');
  });
});
