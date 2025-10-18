# Source Code

Este diretório contém o código-fonte do servidor L2.

## Estrutura

### gameserver/
Código do servidor principal do jogo (Game Server).

**Responsabilidades**:
- Gerenciamento de jogadores e personagens
- Sistema de combate e skills
- NPCs e monstros
- Quests e eventos
- Economia e marketplace
- Sistema de clãs e alianças
- Geodata e pathfinding

**Componentes principais**:
```
gameserver/
├── model/          # Classes de modelo de domínio
│   ├── actor/      # Players, NPCs, Monsters
│   ├── items/      # Sistema de items
│   ├── skills/     # Sistema de skills
│   └── world/      # Mundo do jogo
├── network/        # Comunicação de rede
│   ├── client/     # Pacotes do cliente
│   └── server/     # Pacotes do servidor
├── handler/        # Handlers de eventos e comandos
├── database/       # Acesso ao banco de dados
├── scripts/        # Scripts Python/Jython
├── ai/             # Inteligência artificial de NPCs
├── data/           # Carregamento de dados
└── GameServer.java # Classe principal
```

### loginserver/
Código do servidor de autenticação (Login Server).

**Responsabilidades**:
- Autenticação de contas
- Criação e gerenciamento de contas
- Lista de servidores disponíveis
- Transferência de sessão para Game Server

**Componentes principais**:
```
loginserver/
├── network/        # Comunicação de rede
├── database/       # Acesso ao banco de dados de login
├── crypt/          # Criptografia de senhas
└── LoginServer.java # Classe principal
```

## Build

### Maven
```bash
# Compilar tudo
mvn clean compile

# Compilar apenas gameserver
mvn clean compile -pl gameserver

# Compilar apenas loginserver
mvn clean compile -pl loginserver

# Criar JARs
mvn clean package
```

### Gradle
```bash
# Compilar tudo
gradle build

# Compilar apenas gameserver
gradle :gameserver:build

# Compilar apenas loginserver
gradle :loginserver:build
```

## Estrutura de Pacotes Recomendada

```
com.l2server
├── common/         # Classes compartilhadas
├── gameserver/     # Game server
└── loginserver/    # Login server
```

## Dependências

As dependências devem ser gerenciadas via Maven ou Gradle:

```xml
<!-- pom.xml exemplo -->
<dependencies>
    <dependency>
        <groupId>mysql</groupId>
        <artifactId>mysql-connector-java</artifactId>
        <version>8.0.28</version>
    </dependency>
    <!-- Adicione outras dependências -->
</dependencies>
```

## Testes

```
src/test/
├── gameserver/
│   ├── model/
│   ├── network/
│   └── handler/
└── loginserver/
    └── network/
```

Execute testes:
```bash
# Maven
mvn test

# Gradle
gradle test
```

## Desenvolvimento

Para adicionar novo código:

1. Siga a estrutura de pacotes existente
2. Mantenha separação de responsabilidades
3. Adicione testes para nova funcionalidade
4. Documente código público com Javadoc
5. Siga os padrões de código do projeto

Veja [DEVELOPMENT.md](../docs/DEVELOPMENT.md) para detalhes.
