Entendido. Irei gerar o README em português e em formato Markdown, com base nos arquivos fornecidos.

# CRUD Transportadora

Este repositório contém uma aplicação web para o gerenciamento de dados de uma empresa de transportes, incluindo clientes, funcionários, produtos e pedidos. A aplicação é desenvolvida em Java (Jakarta EE / Servlet API) para o backend, com JSP para as views, e utiliza um banco de dados MySQL para persistência dos dados. O framework Bootstrap é empregado para o estilo do frontend.

## Funcionalidades

* **Autenticação de Usuário:** Funcionalidade de login e logout para funcionários.
* **Gestão de Clientes:**
    * Adicionar novos clientes.
    * Atualizar informações de clientes existentes.
    * Excluir clientes.
    * Visualizar uma lista de todos os clientes.
* **Gestão de Funcionários:**
    * Adicionar novos funcionários.
    * Atualizar informações de funcionários existentes.
    * Excluir funcionários.
    * Visualizar uma lista de todos os funcionários.
* **Gestão de Produtos:**
    * Adicionar novos produtos.
    * Atualizar detalhes de produtos existentes.
    * Excluir produtos.
    * Visualizar uma lista de todos os produtos.
* **Gestão de Pedidos:**
    * Criar novos pedidos, associando-os a clientes e produtos.
    * Atualizar pedidos existentes.
    * Excluir pedidos.
    * Visualizar uma lista de todos os pedidos.
    * Filtrar pedidos por cliente.
    * Calcular o valor total dos pedidos.

## Tecnologias Utilizadas

* **Backend:**
    * Java 21
    * Jakarta Servlet API 6.0
    * Apache Tomcat v10.1.39 (Ambiente de execução)
* **Banco de Dados:**
    * MySQL (Implementações DAO: `MySQLClienteDAO.java`, `MySQLFuncionarioDAO.java`, `MySQLProdutoDAO.java`, `MySQLPedidoDAO.java`)
    * JDBC para conectividade com o banco de dados (`MySQLConnectionFactory.java`, `DBHandler.java`)
* **Frontend:**
    * JSP (JavaServer Pages) para conteúdo web dinâmico.
    * HTML, CSS (`bootstrap.min.css`, `bootstrap-icons.css`, `clientes.css`, `funcionarios.css`, `pedidos.css`, `produtos.css`, `form_cliente.css`, `form_funcionario.css`, `form_pedido.css`, `form_produto.css`, `index.css`, `login.css`)
    * JavaScript (`bootstrap.bundle.min.js`, `bootstrap.min.js`)
    * Bootstrap Icons
* **Segurança:**
    * Criptografia de senhas utilizando SHA-256 e codificação Base64 (`PasswordEncryptor.java`)
    * Filtro de login (`LoginFilter.java`) para restringir o acesso a usuários autenticados.

## Estrutura do Projeto (Arquivos e Diretórios Principais)

```
.
├── .settings/
│   └── org.eclipse.wst.common.project.facet.core.xml  (Facetas do projeto Eclipse)
├── build/
│   └── classes/                                    (Classes Java compiladas)
├── src/main/java/
│   ├── controller/
│   │   ├── ClientesController.java                 (Lida com requisições relacionadas a clientes)
│   │   ├── FuncionariosController.java             (Lida com requisições relacionadas a funcionários)
│   │   ├── LoginController.java                    (Lida com login/logout de usuários)
│   │   ├── PedidosController.java                  (Lida com requisições relacionadas a pedidos)
│   │   └── ProdutosController.java                 (Lida com requisições relacionadas a produtos)
│   ├── filters/
│   │   └── LoginFilter.java                        (Aplica filtro de login para páginas protegidas)
│   └── model/
│       ├── Cliente.java                            (Entidade Cliente)
│       ├── Funcionario.java                        (Entidade Funcionário)
│       ├── ModelException.java                     (Exceção customizada para a camada de modelo)
│       ├── Pedido.java                             (Entidade Pedido)
│       ├── Produto.java                            (Entidade Produto)
│       └── dao/
│           ├── ClienteDAO.java                     (Interface para acesso a dados de cliente)
│           ├── DAOFactory.java                     (Fábrica para DAOs)
│           ├── DBHandler.java                      (Classe utilitária para banco de dados)
│           ├── FuncionarioDAO.java                 (Interface para acesso a dados de funcionário)
│           ├── MySQLClienteDAO.java                (Implementação MySQL de ClienteDAO)
│           ├── MySQLConnectionFactory.java         (Gerencia conexões com o banco de dados MySQL)
│           ├── MySQLFuncionarioDAO.java            (Implementação MySQL de FuncionarioDAO)
│           ├── MySQLPedidoDAO.java                 (Implementação MySQL de PedidoDAO)
│           ├── MySQLProdutoDAO.java                (Implementação MySQL de ProdutoDAO)
│           ├── PedidoDAO.java                      (Interface para acesso a dados de pedido)
│           └── ProdutoDAO.java                     (Interface para acesso a dados de produto)
│       └── utils/
│           └── PasswordEncryptor.java              (Utilitário para hash de senhas)
└── src/main/webapp/
    ├── WEB-INF/
    │   └── web.xml                                 (Descritor de implantação)
    ├── css/                                        (Arquivos de folha de estilo)
    ├── js/                                         (Arquivos JavaScript)
    ├── (Arquivos JSP para as views, e.g., clientes.jsp, form_cliente.jsp, etc. - inferidos a partir dos controllers)
```

## Configuração e Instalação

1.  **Pré-requisitos:**
    * Java Development Kit (JDK) 21 ou superior.
    * Apache Tomcat 10.1.39 ou contêiner de servlet compatível.
    * Servidor de Banco de Dados MySQL.
    * Maven ou Gradle (para gerenciamento de dependências, se não estiver usando uma IDE como Eclipse com recursos integrados).

2.  **Configuração do Banco de Dados:**
    * Crie um banco de dados MySQL chamado `transportadora`.
    * Execute scripts SQL para criar as tabelas necessárias (por exemplo, `cliente`, `funcionario`, `produto`, `pedido`). (Os scripts SQL não foram fornecidos nos arquivos, mas são necessários com base nas implementações DAO).
    * Atualize `src/main/java/model/dao/MySQLConnectionFactory.java` com seu nome de usuário e senha do MySQL, caso sejam diferentes de `root` e `""`, respectivamente.

3.  **Construção e Implantação:**
    * **Usando Maven/Gradle:** Se o projeto estiver configurado com Maven ou Gradle, construa o arquivo WAR usando os comandos apropriados (`mvn package` ou `gradle build`).
    * **Usando Eclipse (ou IDE similar):** Importe o projeto como um Dynamic Web Project. Certifique-se de que o servidor Apache Tomcat e o Java 21 estejam configurados nos ambientes de tempo de execução da sua IDE e nas facetas do projeto. Exporte o projeto como um arquivo WAR ou implante-o diretamente no Tomcat.
    * Coloque o arquivo `.war` gerado no diretório `webapps` do Tomcat.

4.  **Acesso à Aplicação:**
    * Inicie o servidor Apache Tomcat.
    * Abra seu navegador e navegue para `http://localhost:8080/CrudTransportadora/` (ou o caminho de contexto configurado).
    * A aplicação inclui um `LoginFilter` que redireciona usuários não autenticados para `login.jsp`.

## Uso

1.  **Login:** Acesse a aplicação através da página de login (por exemplo, `http://localhost:8080/CrudTransportadora/login.jsp`). Use credenciais de funcionário válidas (que você configuraria em sua tabela `funcionario` do MySQL).
2.  **Navegação:** Após o login bem-sucedido, você será redirecionado para a página principal da aplicação, onde poderá navegar pelos diferentes módulos (Clientes, Funcionários, Produtos, Pedidos) usando a barra lateral.
3.  **Operações CRUD:** Dentro de cada módulo, você pode realizar operações de Criar, Ler, Atualizar e Excluir.
    * **Clientes:** `/clientes`, `/cliente/save`, `/cliente/update`, `/cliente/delete`
    * **Funcionários:** `/funcionarios`, `/funcionario/save`, `/funcionario/update`, `/funcionario/delete`
    * **Produtos:** `/produtos`, `/produto/save`, `/produto/update`, `/produto/delete`
    * **Pedidos:** `/pedidos`, `/pedido/save`, `/pedido/update`, `/pedido/delete`

## Problemas Conhecidos/Limitações

* **Tratamento de Erros:** Embora `ModelException` seja usada para problemas relacionados ao banco de dados, mensagens de erro mais amigáveis ao usuário e um tratamento de erros mais robusto podem ser necessários para um ambiente de produção.
* **Validação de Entrada:** Algumas validações de entrada estão presentes (por exemplo, formato de data em `PedidosController`), mas uma validação abrangente tanto no lado do servidor quanto no lado do cliente pode ser benéfica.
* **Segurança:** A criptografia de senhas é implementada, mas considere medidas de segurança adicionais, como gerenciamento seguro de sessões, proteção contra injeção de SQL (PreparedStatement ajuda, mas a segurança geral da aplicação é importante) e prevenção de cross-site scripting (XSS).
* **Escalabilidade:** Para aplicações de alto tráfego, considere pooling de conexões e outras otimizações de desempenho.

## Contribuição

Contribuições são bem-vindas! Sinta-se à vontade para abrir issues ou enviar pull requests.

## Licença

(Nenhuma informação de licença foi fornecida nos arquivos. Você pode querer adicionar uma, por exemplo, MIT, Apache 2.0, etc.)

## Contato

(Nenhuma informação de contato foi fornecida. Você pode querer adicionar seus detalhes de contato aqui.)
