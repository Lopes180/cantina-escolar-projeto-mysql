# Cantina Escolar

## Nome e objetivo

O **Cantina Escolar** é um sistema desktop, com interface gráfica, para **gerenciar os produtos do cardápio** de uma cantina escolar. Por meio dele é possível **cadastrar, listar, atualizar e excluir produtos**, com os dados armazenados em um banco MySQL.

## Integrantes

- Felipe
- Kauã

## Tecnologias utilizadas

- **Python 3**
- **MySQL** (usado pelo MySQL Workbench para criar e consultar o banco)
- **CustomTkinter** — interface gráfica
- **mysql-connector-python** — conexão entre o Python e o MySQL
- **python-dotenv** — leitura das configurações do arquivo `.env`

## Organização do projeto

```
cantina-escolar-projeto-mysql/
├── main.py            # Ponto de entrada: inicia o sistema
├── requirements.txt   # Dependências do projeto
├── .gitignore         # Arquivos que não vão para o GitHub (.env, venv, etc.)
├── README.md          # Este manual
├── database/          # banco.sql (criação do banco e das tabelas) e conexao.py (conexão com o MySQL)
├── models/            # Classes que representam os dados (ex.: Produto)
├── repositories/      # Acesso ao banco de dados (comandos SQL)
├── controllers/       # Validação e coordenação entre a interface e o banco
└── views/             # Telas feitas com CustomTkinter
```

## Arquitetura

O projeto separa as responsabilidades em camadas (MVC + Repository):

- **Model**: representa os dados (por exemplo, um produto com nome, preço e categoria).
- **Repository**: concentra o SQL. Somente essa camada conversa diretamente com o MySQL.
- **Controller**: valida os dados digitados e coordena o fluxo entre a View e o Repository.
- **View**: exibe a interface e recebe as ações do usuário. Não contém SQL.

Fluxo: `View → Controller → Repository → MySQL`, usando o `Model` para representar os dados.

## Instalação

1. Baixe o projeto e entre na pasta principal:

   ```bash
   git clone -b feature/interface-produtos --single-branch https://github.com/Lopes180/cantina-escolar-projeto-mysql.git
   cd cantina-escolar-projeto-mysql
   ```

2. (Recomendado) Crie e ative um ambiente virtual:

   ```bash
   python -m venv venv

   # Windows
   venv\Scripts\activate

   # Linux/macOS
   source venv/bin/activate
   ```

3. Instale as dependências:

   ```bash
   pip install -r requirements.txt
   ```

## Banco de dados

1. Abra o **MySQL Workbench** e conecte-se ao seu servidor MySQL local.
2. Abra o arquivo `database/banco.sql` (menu *File > Open SQL Script*).
3. Execute o script (ícone do raio). Ele cria o banco `cantina_escolar_v2`, as tabelas (`turma`, `estudante`, `categoria`, `agente_cantina`, `item_cardapio`, `forma_pagamento`, `pedido` e `item_pedido`) e insere os dados iniciais.

> **Atenção:** o script contém `DROP TABLE IF EXISTS` para cada tabela. Ao executá-lo, as tabelas do banco `cantina_escolar_v2` são recriadas e **os dados que já existiam nelas são apagados**. Se você já cadastrou dados que quer manter, faça um backup antes ou use outro servidor/banco de teste.

## Configuração da conexão (.env)

Cada pessoa deve criar **localmente** um arquivo chamado `.env` na pasta principal do projeto, com as configurações do seu MySQL. Use exatamente os nomes de variáveis abaixo, e preencha todas elas (se alguma faltar, o sistema não consegue conectar ao banco):

```env
DB_HOST=localhost
DB_PORT=3306
DB_USER=seu_usuario
DB_PASSWORD=sua_senha
DB_NAME=cantina_escolar_v2
```

> **Importante:** o `.env` fica apenas no seu computador. Ele está no `.gitignore` e **nunca deve ser enviado ao GitHub**. Não coloque a senha real do MySQL no README nem no código.

## Como executar

Com as dependências instaladas, o banco criado e o `.env` configurado, execute na pasta principal:

```bash
python main.py
```

## Créditos e ferramentas

- Foi usada a ferramenta de IA Claude como apoio na elaboração desta documentação (README.md) e na revisão do script `database/banco.sql`. O conteúdo foi revisado pela equipe.
- Bibliotecas de terceiros: CustomTkinter, mysql-connector-python e python-dotenv.
