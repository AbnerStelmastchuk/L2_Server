# External Libraries

Este diretório contém bibliotecas externas (JARs) necessárias para o servidor.

## Gerenciamento de Dependências

### Método Preferido: Maven/Gradle

É recomendado usar Maven ou Gradle para gerenciar dependências automaticamente:

**Maven** (`pom.xml`):
```xml
<dependency>
    <groupId>mysql</groupId>
    <artifactId>mysql-connector-java</artifactId>
    <version>8.0.28</version>
</dependency>
```

**Gradle** (`build.gradle`):
```gradle
dependencies {
    implementation 'mysql:mysql-connector-java:8.0.28'
}
```

## Bibliotecas Comuns

Se você precisar adicionar JARs manualmente, aqui estão as bibliotecas comuns:

### Essenciais

- **MySQL Connector** (`mysql-connector-java-8.x.x.jar`)
  - Conexão com banco de dados MySQL/MariaDB
  - Download: https://dev.mysql.com/downloads/connector/j/

- **Logging** (`slf4j-api-x.x.x.jar`, `logback-classic-x.x.x.jar`)
  - Sistema de logging
  - Download: http://www.slf4j.org/download.html

### Utilitários

- **Apache Commons Lang** (`commons-lang3-x.x.x.jar`)
  - Utilitários para Java
  - Download: https://commons.apache.org/proper/commons-lang/

- **Apache Commons IO** (`commons-io-x.x.x.jar`)
  - Utilitários para I/O
  - Download: https://commons.apache.org/proper/commons-io/

### Opcional

- **Jython** (`jython-standalone-x.x.x.jar`)
  - Para scripts Python
  - Download: https://www.jython.org/download

- **C3P0** (`c3p0-x.x.x.jar`)
  - Connection pooling
  - Download: https://sourceforge.net/projects/c3p0/

## Instalação Manual

Se usar JARs manualmente:

1. **Baixe as bibliotecas** necessárias
2. **Coloque neste diretório** (`libs/`)
3. **Atualize o classpath** nos scripts de inicialização

```bash
# Linux/macOS
java -cp "libs/*:target/*" com.l2server.gameserver.GameServer

# Windows
java -cp "libs/*;target/*" com.l2server.gameserver.GameServer
```

## Estrutura

```
libs/
├── mysql-connector-java-8.0.28.jar
├── slf4j-api-1.7.36.jar
├── logback-classic-1.2.11.jar
├── logback-core-1.2.11.jar
├── commons-lang3-3.12.0.jar
└── README.md
```

## Verificação

Verifique se as bibliotecas estão carregadas:

```bash
# Liste JARs no diretório
ls -lh libs/*.jar

# Verifique conteúdo de um JAR
jar tf libs/mysql-connector-java-8.0.28.jar | head
```

## Licenças

Certifique-se de respeitar as licenças das bibliotecas utilizadas:

- MySQL Connector/J: GPL v2 com Universal FOSS Exception
- SLF4J: MIT License
- Logback: LGPL 2.1 / EPL 1.0
- Apache Commons: Apache License 2.0

## .gitignore

JARs não devem ser commitados no Git. O `.gitignore` já exclui `*.jar`:

```gitignore
# Package Files
*.jar
*.war
*.nar
*.ear
```

## Dependências com Maven

Se usar Maven, as dependências serão baixadas automaticamente para:
- `~/.m2/repository/` (cache local)
- `target/libs/` (após `mvn package`)

## Dependências com Gradle

Se usar Gradle, as dependências serão baixadas automaticamente para:
- `~/.gradle/caches/` (cache local)
- `build/libs/` (após `gradle build`)

## Troubleshooting

### ClassNotFoundException

Se você receber `ClassNotFoundException`, verifique:

1. O JAR está no diretório `libs/`?
2. O classpath inclui `libs/*`?
3. A versão do JAR é compatível com seu Java?

### NoClassDefFoundError

Pode indicar dependência transitiva faltando. Verifique documentação da biblioteca.

### Conflitos de Versão

Se houver conflitos, use apenas uma versão de cada biblioteca. Maven/Gradle gerenciam isso automaticamente.

## Atualização

Para atualizar bibliotecas:

1. **Com Maven/Gradle**: Atualize a versão no arquivo de build
2. **Manual**: Baixe nova versão e substitua o JAR antigo

Sempre teste após atualizar bibliotecas.

## Segurança

- Use apenas bibliotecas de fontes confiáveis
- Mantenha bibliotecas atualizadas para patches de segurança
- Verifique vulnerabilidades conhecidas: https://nvd.nist.gov/
