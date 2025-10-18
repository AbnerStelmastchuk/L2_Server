# Guia de Desenvolvimento

Este documento fornece informações para desenvolvedores que desejam contribuir ou modificar o servidor.

## Ambiente de Desenvolvimento

### Ferramentas Recomendadas

- **IDE**: IntelliJ IDEA ou Eclipse
- **Build**: Maven ou Gradle
- **Controle de Versão**: Git
- **Database GUI**: MySQL Workbench ou DBeaver
- **Java**: OpenJDK 11 ou superior

### Configuração do IDE

#### IntelliJ IDEA

1. Abra o projeto: `File > Open > selecione o diretório`
2. Configure o JDK: `File > Project Structure > Project SDK`
3. Importe as dependências Maven/Gradle automaticamente
4. Configure o runner para as classes principais

#### Eclipse

1. Importe como projeto Maven/Gradle
2. Configure o JDK no Build Path
3. Adicione as configurações de execução

## Estrutura do Código

```
src/
├── gameserver/
│   ├── model/          # Classes de modelo (Player, Item, etc.)
│   ├── network/        # Pacotes de rede
│   ├── handler/        # Handlers de eventos
│   ├── scripts/        # Scripts do jogo
│   └── GameServer.java # Classe principal
└── loginserver/
    ├── network/        # Pacotes de login
    ├── database/       # Acesso ao DB de login
    └── LoginServer.java # Classe principal
```

## Padrões de Código

### Convenções de Nomenclatura

- **Classes**: PascalCase (ex: `GameServer`, `PlayerInstance`)
- **Métodos**: camelCase (ex: `getPlayer()`, `setLevel()`)
- **Constantes**: UPPER_CASE (ex: `MAX_PLAYERS`, `DEFAULT_PORT`)
- **Pacotes**: lowercase (ex: `com.l2server.gameserver`)

### Formatação

- Indentação: 4 espaços (não tabs)
- Chaves: Estilo K&R
- Linha máxima: 120 caracteres

### Exemplo

```java
public class PlayerInstance {
    private static final int MAX_LEVEL = 85;
    private String name;
    private int level;
    
    public PlayerInstance(String name) {
        this.name = name;
        this.level = 1;
    }
    
    public void setLevel(int level) {
        if (level > MAX_LEVEL) {
            level = MAX_LEVEL;
        }
        this.level = level;
    }
}
```

## Build e Compilação

### Maven

```bash
# Compilar
mvn clean compile

# Compilar e testar
mvn clean test

# Criar pacote
mvn clean package

# Instalar localmente
mvn clean install
```

### Gradle

```bash
# Compilar
gradle build

# Testar
gradle test

# Criar JAR
gradle jar

# Limpar e construir
gradle clean build
```

## Testes

### Estrutura de Testes

```
src/test/
├── gameserver/
│   ├── model/
│   └── handler/
└── loginserver/
```

### Exemplo de Teste

```java
import org.junit.Test;
import static org.junit.Assert.*;

public class PlayerInstanceTest {
    @Test
    public void testPlayerCreation() {
        PlayerInstance player = new PlayerInstance("TestPlayer");
        assertEquals("TestPlayer", player.getName());
        assertEquals(1, player.getLevel());
    }
    
    @Test
    public void testLevelLimit() {
        PlayerInstance player = new PlayerInstance("TestPlayer");
        player.setLevel(100);
        assertEquals(85, player.getLevel());
    }
}
```

## Debug

### Log de Debug

```java
import java.util.logging.Logger;

private static final Logger LOGGER = Logger.getLogger(ClassName.class.getName());

LOGGER.info("Player connected: " + playerName);
LOGGER.warning("Invalid packet received");
LOGGER.severe("Critical error: " + e.getMessage());
```

### Debug Remoto

Configure seu IDE para debug remoto:

```bash
java -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005 -jar gameserver.jar
```

No IDE, conecte ao localhost:5005

## Pacotes de Rede

### Estrutura de Pacote

```java
public class RequestPacket extends L2GameClientPacket {
    private int _objectId;
    
    @Override
    protected void readImpl() {
        _objectId = readD();
    }
    
    @Override
    protected void runImpl() {
        // Lógica do pacote
    }
}
```

### Enviando Pacotes

```java
player.sendPacket(new SystemMessage("Bem-vindo ao servidor!"));
```

## Database

### Acesso ao Banco

```java
try (Connection con = DatabaseFactory.getInstance().getConnection();
     PreparedStatement ps = con.prepareStatement("SELECT * FROM characters WHERE charId=?")) {
    ps.setInt(1, objectId);
    try (ResultSet rs = ps.executeQuery()) {
        if (rs.next()) {
            // Processar resultado
        }
    }
} catch (SQLException e) {
    LOGGER.severe("Database error: " + e.getMessage());
}
```

## Scripts

### Scripts Python (Jython)

```python
from com.l2server.gameserver.model.quest import Quest

class CustomQuest(Quest):
    def __init__(self, questId, name, descr):
        Quest.__init__(self, questId, name, descr)
        
    def onTalk(self, npc, player):
        return "quest_dialog.htm"
```

## Performance

### Boas Práticas

1. Use connection pooling para database
2. Cache dados frequentemente acessados
3. Evite operações bloqueantes na thread principal
4. Use ThreadPools para operações assíncronas

### Profiling

Use ferramentas como:
- JProfiler
- YourKit
- VisualVM

## Contribuindo

Veja [CONTRIBUTING.md](../CONTRIBUTING.md) para diretrizes de contribuição.

## Recursos Adicionais

- [Documentação da API Java](https://docs.oracle.com/en/java/)
- [MySQL Documentation](https://dev.mysql.com/doc/)
- [Maven Guide](https://maven.apache.org/guides/)
