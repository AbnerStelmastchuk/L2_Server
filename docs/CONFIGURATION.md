# Guia de Configuração Detalhada

Este documento fornece informações detalhadas sobre a configuração do servidor L2.

## Configuração do Banco de Dados

### database.properties

```properties
# Configurações do MySQL/MariaDB
game.db.url=jdbc:mysql://localhost:3306/l2server
game.db.user=seu_usuario
game.db.password=sua_senha
```

**Parâmetros Importantes:**
- `game.db.url`: URL de conexão JDBC
- `game.db.user`: Usuário do banco de dados
- `game.db.password`: Senha do banco de dados
- `db.pool.maxConnections`: Número máximo de conexões simultâneas

### Otimização do Banco de Dados

Para melhor performance, configure seu MySQL/MariaDB:

```ini
[mysqld]
max_connections = 200
innodb_buffer_pool_size = 1G
innodb_log_file_size = 256M
query_cache_size = 64M
```

## Configuração do Servidor

### server.properties

#### Configurações de Rede

```properties
gameserver.hostname=seu.dominio.com
gameserver.port=7777
loginserver.hostname=seu.dominio.com
loginserver.port=2106
```

**Notas:**
- Use `0.0.0.0` para aceitar conexões de qualquer IP
- Para servidor local, use `127.0.0.1`
- Para servidor público, use seu IP público ou domínio

#### Configurações de Segurança

```properties
client.maxPacketsPerSecond=100
client.maxUnknownPackets=5
```

Ajuste estes valores para prevenir floods e ataques DDoS.

#### Configurações de GM

```properties
gm.accessLevel=100
gm.nameColor=00FF00
gm.titleColor=00FFFF
```

Defina o nível de acesso e cores para Game Masters.

## Configuração de Rates

### rates.properties

#### Rates de Experiência

```properties
rate.xp=5.0          # 5x XP
rate.sp=5.0          # 5x SP
rate.partyXp=2.0     # Bonus de party
```

#### Rates de Drop

```properties
rate.dropAdena=2.0   # 2x Adena
rate.dropItems=2.0   # 2x Items
rate.dropSpoil=2.0   # 2x Spoil
```

#### Rates de Craft

```properties
rate.masterworkChance=5.0      # 5% chance de masterwork
rate.criticalCraftChance=5.0   # 5% chance de critical craft
```

## Configurações Avançadas

### JVM Options

Edite os scripts de inicialização para ajustar:

```bash
# Para servidores pequenos (< 50 players)
JAVA_OPTS="-Xms512m -Xmx1024m"

# Para servidores médios (50-200 players)
JAVA_OPTS="-Xms1024m -Xmx2048m"

# Para servidores grandes (200+ players)
JAVA_OPTS="-Xms2048m -Xmx4096m"
```

Adicione opções de GC:
```bash
-XX:+UseG1GC
-XX:MaxGCPauseMillis=200
-XX:+AggressiveOpts
```

### Geodata

Configure a localização dos arquivos geodata:

```properties
geodata.path=./geodata
geodata.load=True
```

### Logs

Configure níveis de log:

```properties
log.level=INFO
log.file=logs/server.log
log.console=True
```

## Firewall e Portas

Certifique-se de abrir as seguintes portas:

- **7777** - Game Server
- **2106** - Login Server
- **9014** - Telnet (opcional, apenas para admin)

### Linux (iptables)

```bash
sudo iptables -A INPUT -p tcp --dport 7777 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 2106 -j ACCEPT
```

### Windows Firewall

```powershell
New-NetFirewallRule -DisplayName "L2 Game Server" -Direction Inbound -LocalPort 7777 -Protocol TCP -Action Allow
New-NetFirewallRule -DisplayName "L2 Login Server" -Direction Inbound -LocalPort 2106 -Protocol TCP -Action Allow
```

## Troubleshooting

### Problemas Comuns

1. **Erro de conexão com banco de dados**
   - Verifique se o MySQL está rodando
   - Confirme usuário e senha
   - Verifique se o banco de dados foi criado

2. **OutOfMemoryError**
   - Aumente os valores de -Xmx nos scripts
   - Verifique memory leaks

3. **Players não conseguem conectar**
   - Verifique configurações de firewall
   - Confirme o IP/hostname correto
   - Teste conectividade de rede

## Próximos Passos

- [Guia de Desenvolvimento](DEVELOPMENT.md)
- [FAQ](FAQ.md)
- [Troubleshooting](TROUBLESHOOTING.md)
