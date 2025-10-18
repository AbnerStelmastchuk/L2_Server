# Troubleshooting Guide

Este guia ajuda a resolver problemas comuns ao configurar e executar o servidor L2.

## Problemas de Instalação

### Java não encontrado

**Sintomas**:
```
'java' is not recognized as an internal or external command
```

**Solução**:
1. Instale o Java JDK
2. Configure a variável de ambiente JAVA_HOME
3. Adicione Java ao PATH

**Linux**:
```bash
sudo apt-get install openjdk-11-jdk
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
export PATH=$PATH:$JAVA_HOME/bin
```

**Windows**:
1. Baixe JDK do site Oracle/OpenJDK
2. Instale e configure JAVA_HOME nas variáveis de ambiente
3. Adicione `%JAVA_HOME%\bin` ao PATH

### Erro de compilação

**Sintomas**:
```
[ERROR] Failed to execute goal
```

**Solução**:
1. Limpe o cache do Maven/Gradle:
   ```bash
   mvn clean
   rm -rf ~/.m2/repository
   ```

2. Verifique a versão do Java:
   ```bash
   java -version
   javac -version
   ```

3. Atualize as dependências:
   ```bash
   mvn dependency:resolve
   ```

## Problemas de Banco de Dados

### Conexão recusada

**Sintomas**:
```
Communications link failure
Connection refused
```

**Solução**:
1. Verifique se o MySQL está rodando:
   ```bash
   # Linux
   sudo systemctl status mysql
   
   # Windows
   services.msc (procure MySQL)
   ```

2. Inicie o MySQL se necessário:
   ```bash
   # Linux
   sudo systemctl start mysql
   
   # Windows
   net start MySQL
   ```

3. Teste a conexão:
   ```bash
   mysql -u root -p -h localhost
   ```

### Acesso negado

**Sintomas**:
```
Access denied for user 'root'@'localhost'
```

**Solução**:
1. Verifique as credenciais em `config/database.properties`
2. Crie um novo usuário se necessário:
   ```sql
   CREATE USER 'l2user'@'localhost' IDENTIFIED BY 'senha_forte';
   GRANT ALL PRIVILEGES ON l2server.* TO 'l2user'@'localhost';
   GRANT ALL PRIVILEGES ON l2server_login.* TO 'l2user'@'localhost';
   FLUSH PRIVILEGES;
   ```

### Tabelas não existem

**Sintomas**:
```
Table 'l2server.characters' doesn't exist
```

**Solução**:
1. Importe os schemas:
   ```bash
   mysql -u root -p l2server < database/game_schema.sql
   mysql -u root -p l2server_login < database/login_schema.sql
   ```

2. Verifique se os bancos foram criados:
   ```sql
   SHOW DATABASES;
   USE l2server;
   SHOW TABLES;
   ```

## Problemas de Rede

### Players não conseguem conectar

**Sintomas**:
- Client exibe "Connection failed"
- Timeout ao conectar

**Diagnóstico**:
1. Verifique se os servidores estão rodando:
   ```bash
   ps aux | grep java
   ```

2. Teste as portas:
   ```bash
   # Linux/macOS
   netstat -an | grep 7777
   netstat -an | grep 2106
   
   # Windows
   netstat -an | findstr 7777
   netstat -an | findstr 2106
   ```

3. Teste conectividade:
   ```bash
   telnet localhost 7777
   telnet localhost 2106
   ```

**Solução**:
1. Configure o firewall:
   ```bash
   # Linux (iptables)
   sudo iptables -A INPUT -p tcp --dport 7777 -j ACCEPT
   sudo iptables -A INPUT -p tcp --dport 2106 -j ACCEPT
   
   # Linux (firewalld)
   sudo firewall-cmd --add-port=7777/tcp --permanent
   sudo firewall-cmd --add-port=2106/tcp --permanent
   sudo firewall-cmd --reload
   ```

2. Configure port forwarding no router (para servidor público)

3. Verifique IP/hostname em `config/server.properties`

### Lag ou alta latência

**Sintomas**:
- Players reportam lag
- Comandos demoram para executar
- Skills com delay

**Diagnóstico**:
```bash
# Verifique uso de CPU e memória
top
htop

# Verifique uso de disco
iostat
iotop
```

**Solução**:
1. Aumente memória da JVM:
   ```bash
   JAVA_OPTS="-Xms2048m -Xmx4096m"
   ```

2. Otimize garbage collector:
   ```bash
   -XX:+UseG1GC -XX:MaxGCPauseMillis=200
   ```

3. Otimize o MySQL:
   ```ini
   [mysqld]
   innodb_buffer_pool_size = 2G
   innodb_flush_log_at_trx_commit = 2
   ```

## Problemas de Performance

### OutOfMemoryError

**Sintomas**:
```
java.lang.OutOfMemoryError: Java heap space
```

**Solução**:
1. Aumente heap size:
   ```bash
   # Nos scripts de start
   JAVA_OPTS="-Xms2048m -Xmx4096m"
   ```

2. Analise memory leaks:
   ```bash
   # Habilite dump on OOM
   -XX:+HeapDumpOnOutOfMemoryError
   -XX:HeapDumpPath=/path/to/dumps
   ```

3. Use profiler (JProfiler, VisualVM)

### High CPU usage

**Sintomas**:
- Processo Java usa 100% CPU
- Servidor lento

**Diagnóstico**:
```bash
# Encontre threads problemáticas
jstack <pid> > threads.txt

# Profile CPU
jconsole
visualvm
```

**Solução**:
1. Otimize loops e operações custosas
2. Use ThreadPools adequadamente
3. Revise queries SQL lentas
4. Cache dados frequentemente acessados

### Database locks

**Sintomas**:
- Queries lentas
- Timeouts de conexão
- Deadlocks no log

**Diagnóstico**:
```sql
-- Verifique processos
SHOW PROCESSLIST;

-- Verifique locks
SHOW ENGINE INNODB STATUS;
```

**Solução**:
1. Otimize queries:
   ```sql
   -- Adicione índices
   CREATE INDEX idx_charId ON characters(charId);
   ```

2. Use transações apropriadamente
3. Evite long-running queries
4. Configure timeouts:
   ```properties
   db.pool.maxIdleTime=300
   ```

## Problemas de Logs

### Logs não são gerados

**Sintomas**:
- Diretório `logs/` vazio
- Sem output de debug

**Solução**:
1. Verifique permissões do diretório:
   ```bash
   mkdir -p logs
   chmod 755 logs
   ```

2. Configure logging corretamente
3. Verifique `log4j.properties` ou configuração equivalente

### Logs muito grandes

**Sintomas**:
- Arquivo de log com gigabytes
- Disco cheio

**Solução**:
1. Configure log rotation:
   ```xml
   <RollingFile name="RollingFile" fileName="logs/server.log"
                filePattern="logs/server-%d{yyyy-MM-dd}.log">
       <PatternLayout pattern="%d{HH:mm:ss.SSS} [%t] %-5level %logger{36} - %msg%n"/>
       <Policies>
           <TimeBasedTriggeringPolicy />
           <SizeBasedTriggeringPolicy size="100MB"/>
       </Policies>
   </RollingFile>
   ```

2. Ajuste nível de log:
   ```properties
   log.level=INFO  # Não use DEBUG em produção
   ```

## Comandos Úteis

### Verificar status do servidor

```bash
# Processos Java rodando
ps aux | grep java

# Portas em uso
netstat -tulpn | grep java

# Verificar logs em tempo real
tail -f logs/server.log
```

### Reiniciar servidor

```bash
# Parar
./scripts/stop-servers.sh

# Esperar alguns segundos
sleep 5

# Iniciar
./scripts/start-login.sh
./scripts/start-game.sh
```

### Backup rápido

```bash
# Database
mysqldump -u root -p l2server > backup_$(date +%Y%m%d).sql

# Arquivos
tar -czf backup_files_$(date +%Y%m%d).tar.gz config/ data/
```

## Obtendo Ajuda

Se o problema persistir:

1. **Colete informações**:
   - Versão do Java: `java -version`
   - Versão do MySQL: `mysql --version`
   - Sistema operacional: `uname -a` (Linux) ou `ver` (Windows)
   - Logs relevantes

2. **Procure ajuda**:
   - Issues do GitHub
   - Log completo do erro
   - Passos para reproduzir o problema

3. **Crie uma issue**:
   - Descreva o problema claramente
   - Inclua versões e configurações
   - Anexe logs relevantes
   - Explique o que já tentou
