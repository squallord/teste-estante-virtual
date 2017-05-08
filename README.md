# Teste prático da Estante Virtual

Rode a aplicação [**aqui**](https://guarded-meadow-23996.herokuapp.com/) ou se preferir siga os passos abaixo para rodá-la localmente.

### Passos para Rodar a Aplicação **Localmente**:
#### Instalação de Pacotes e Configurações Gerais:
1. Abra o terminal e execute os comandos:
	- sudo gem install bundler;
	- sudo apt-get install libmysqlclient-dev;
	- sudo gem install mysql2.
2. Na pasta da aplicação abra uma linha de comando e execute os comandos:
	- bundle install (caso seja necessário).
3. Na pasta config no arquivo *database.yml*:
	- substitua o caminho do socket pelo socket correspondente na conexão local de seu sistema.

#### Setup do MySQL:
1. Abra o terminal e execute os comandos:
	- mysql -u root -p
2. No terminal mysql execute os comandos:
	- use tev_development
	- grant all privileges on tev_development.* to 'tevadmin'@'localhost' identified by 'password'

#### Criação do Banco e Execução da Aplicação:
1. Abra uma linha de comando na pasta da aplicação e execute os comandos:
	- rake db:migrate
	- rails serve (para rodar o servidor localmente)
2. No navegador de internet:
	- acesse a aplicação pela porta que o servidor tiver aberto (ex: localhost:3000)

---

### Instruções de Uso da Aplicação:
1. No menu de navegação:
	- Competições -> página inicial do site na qual mostram-se todas as competições;
	- Resultados -> exibe uma página com resultados de todas as competições.
2. Na lista de competições:
	- Mostrar -> exibe uma página com todos os resultados para a competição correspondente. Ao final desta página, é possível inserir um novo resultado caso a competição ainda não tenha sido encerrada;
	- Editar -> exibe uma página com um formulário em que permite-se que o usuário altere apenas o nome da competição;
	- Finalizar -> exibe uma página com um formulário que permite ao usuário finalizar a competição correspondente inserindo-se a data e horário em que a competição se encerra (não será pertmitido adicionar ou remover resultados associados a esta competição bem como alterar seu título após ter sido finalizada);
	- Ranking -> exibe o ranking da competição correspondente;
	- Apagar -> deleta do banco a competição correspondente bem como todos os resultados associados a ela.
3. Na lista de resultados:
	- Mostrar -> exibe o resultado numa página à parte e permite que o usuário o edite, caso a competição não tenha encerrado;
	- Editar -> exibe um formulário para que o usuário possa editar o resultado, caso a competição a qual ele pertence não tenha encerrado;
	- Apagar -> deleta o resultado do banco de dados de resultados.

### Considerações Gerais:
1. Escolheu-se Ruby on Rails pelo teste não limitar o uso de frameworks;
2. Usou-se o padrão de arquitetura MVC por não haver limitações quanto a isso enunciado do teste;
3. Todas as competições e resultados associados a elas podem ser vistos no formato mostrado no enunciado do teste pelos links [competitions.json](https://guarded-meadow-23996.herokuapp.com/competitions.json) e [results.json](https://guarded-meadow-23996.herokuapp.com/results.json);
4. Por simplicidade, não se criou cadastro de usuário com login e senha para cadastrar competições e resultados;
5. Há poucas diferenças entre as versões nos branches diego_marcilio e diego_marcílio_heroku. O primeiro foi criado com banco de dados em **MySQL** e a aplicação é rodada localmente com o comando **rails server**. O segundo usa o banco **POSTGRES** e é a versão que está integrada com o Heroku para ser rodada online;

### Considerações Quanto ao Teste:
1. Foram usados nomes em inglês para a criação das colunas nas tabelas dos bancos para que o Inflector gerasse nomes coerentes;
2. A finalização de uma competição de dardo pode ocorrer mesmo que nem todos os atletas tenham feito 3 lançamentos;
3. Enquanto uma competição não é encerrada, apenas seu título pode ser editado. Após seu encerramento, não se admite edição;
4. Admite-se que competições idênticas sejam cadastradas restando ao operador a liberdade de alterar o título sempre que a competição ainda estiver em curso;
5. Ao se apagar uma competição, apaga-se também todos os resultados a ela vinculados.