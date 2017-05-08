# Teste prático da Estante Virtual

Rode a aplicação em: https://guarded-meadow-23996.herokuapp.com/

### Mapa da aplicação:

### Considerações Gerais:
1. Escolheu-se Ruby on Rails pelo teste não limitar o uso de frameworks;
2. Usou-se o padrão de arquitetura MVC por não haver limitações quanto a isso enunciado do teste;
3. Todas as competições e resultados associados a elas podem ser vistos no formato mostrado no enunciado do teste pelos links [competitions.json](https://guarded-meadow-23996.herokuapp.com/competitions.json) e [results.json](https://guarded-meadow-23996.herokuapp.com/results.json);
4. Por simplicidade, não se criou cadastro de usuário com login e senha para cadastrar competições e resultados;
5. Há poucas diferenças entre as versões nos branches diego_marcilio e diego_marcílio_heroku. O primeiro foi criado com banco de dados em *MySQL* e a aplicação é rodada localmente com o comando **rails server**. O segundo usa o banco *POSTGRES* e é a versão que está integrada com o Heroku para ser rodada online;

### Considerações Quanto ao Teste:
1. Foram usados nomes em inglês para a criação das colunas nas tabelas dos bancos para que o Inflector gerasse nomes coerentes;
2. A finalização de uma competição de dardo pode ocorrer mesmo que nem todos os atletas tenham feito 3 lançamentos;
3. Enquanto uma competição não é encerrada, apenas seu título pode ser editado. Após seu encerramento, não se admite edição;
4. Admite-se que competições idênticas sejam cadastradas restando ao operador a liberdade de alterar o título sempre que a competição ainda estiver em curso;
5. Ao se apagar uma competição, apaga-se também todos os resultados a ela vinculados.