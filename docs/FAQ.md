# FAQ - Perguntas Frequentes

## Geral

### O que é Lineage 2?

Lineage 2 é um MMORPG (Massively Multiplayer Online Role-Playing Game) desenvolvido pela NCsoft, lançado em 2003.

### Este servidor é oficial?

Não. Este é um servidor privado para fins educacionais e não tem afiliação com a NCsoft.

### Posso usar este código comercialmente?

Revise a licença do projeto e as leis de propriedade intelectual aplicáveis. Este repositório é fornecido para fins educacionais.

## Instalação

### Quais são os requisitos mínimos?

- Java JDK 8+
- MySQL 5.7+ ou MariaDB 10.3+
- 2GB RAM (mínimo)
- Sistema operacional: Windows, Linux ou macOS

### Como faço para compilar o projeto?

```bash
# Com Maven
mvn clean install

# Com Gradle
gradle build
```

### O servidor não inicia. O que fazer?

1. Verifique se o Java está instalado: `java -version`
2. Confirme se o banco de dados está rodando
3. Verifique os logs em `logs/` para erros
4. Confirme se as configurações estão corretas

## Configuração

### Como alterar as rates do servidor?

Edite o arquivo `config/rates.properties` e ajuste os valores:

```properties
rate.xp=5.0      # 5x XP
rate.sp=5.0      # 5x SP
rate.dropAdena=2.0  # 2x Adena
```

### Como criar uma conta GM?

No banco de dados `l2server_login`, atualize a tabela de contas:

```sql
UPDATE accounts SET access_level=100 WHERE login='seu_usuario';
```

### Como mudar o IP do servidor?

Edite `config/server.properties`:

```properties
gameserver.hostname=seu.ip.ou.dominio
loginserver.hostname=seu.ip.ou.dominio
```

### Que portas preciso abrir no firewall?

- **7777**: Game Server
- **2106**: Login Server

## Database

### Como faço backup do banco de dados?

```bash
mysqldump -u root -p l2server > backup.sql
```

### Como restaurar um backup?

```bash
mysql -u root -p l2server < backup.sql
```

### Esqueci a senha do MySQL. E agora?

Reinicie o MySQL em modo seguro e redefina a senha. Consulte a documentação do MySQL.

## Performance

### Quantos jogadores o servidor suporta?

Depende do hardware:
- Hardware básico: 50-100 players
- Hardware médio: 100-500 players
- Hardware dedicado: 500+ players

### Como melhorar a performance?

1. Aumente a RAM disponível para a JVM
2. Use SSD para o banco de dados
3. Otimize as configurações do MySQL
4. Configure corretamente o garbage collector

### O servidor está lento. Como otimizar?

```bash
# Aumente a memória nos scripts
JAVA_OPTS="-Xms2048m -Xmx4096m -XX:+UseG1GC"
```

Otimize o MySQL:
```ini
innodb_buffer_pool_size = 2G
query_cache_size = 128M
```

## Desenvolvimento

### Onde adiciono novos NPCs?

Adicione no diretório `data/` os scripts e dados dos NPCs.

### Como crio uma nova quest?

Crie um script na pasta de quests seguindo os exemplos existentes.

### Como adiciono novos itens?

1. Adicione os dados do item no banco de dados
2. Atualize os arquivos de configuração de itens
3. Compile e reinicie o servidor

## Erros Comuns

### OutOfMemoryError

**Solução**: Aumente a memória alocada para a JVM:
```bash
JAVA_OPTS="-Xms2048m -Xmx4096m"
```

### Connection refused to database

**Solução**:
1. Verifique se o MySQL está rodando
2. Confirme usuário e senha em `config/database.properties`
3. Teste a conexão: `mysql -u root -p`

### Players não conseguem logar

**Solução**:
1. Verifique se ambos servidores (login e game) estão rodando
2. Confirme as configurações de IP/porta
3. Verifique se o firewall não está bloqueando

### ClassNotFoundException

**Solução**:
1. Recompile o projeto
2. Verifique se todas as dependências estão instaladas
3. Limpe e reconstrua: `mvn clean install`

## Rede

### Como hospedar um servidor público?

1. Configure o router para port forwarding (7777, 2106)
2. Use seu IP público ou domínio
3. Configure DNS se usar domínio
4. Teste conectividade externa

### O que é um servidor dedicado?

Um servidor dedicado é uma máquina exclusiva para hospedar o jogo, geralmente alugada de provedores de cloud.

### Recomendações de hosting?

- Para testes: Host local
- Para pequenos grupos: VPS básico
- Para servidor público: VPS ou dedicado com boa largura de banda

## Segurança

### Como proteger contra DDoS?

1. Use serviços anti-DDoS (CloudFlare, etc.)
2. Configure rate limiting
3. Use firewall robusto
4. Monitore tráfego de rede

### Como proteger senhas dos usuários?

Use hashing forte (bcrypt, Argon2) para senhas no banco de dados.

### Devo expor o banco de dados?

**Nunca** exponha o MySQL diretamente à internet. Mantenha apenas para acesso local.

## Suporte

### Onde reportar bugs?

Abra uma issue no GitHub: https://github.com/AbnerStelmastchuk/L2_Server/issues

### Como contribuir?

Veja o arquivo [CONTRIBUTING.md](../CONTRIBUTING.md) para diretrizes.

### Onde posso obter mais ajuda?

- Issues do GitHub
- Documentação do projeto
- Comunidades de L2 Server
