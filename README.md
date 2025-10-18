# L2_Server - Lineage 2 Server

Este repositório contém o código-fonte e configurações para um servidor privado de Lineage 2.

## 📋 Índice

- [Sobre](#sobre)
- [Pré-requisitos](#pré-requisitos)
- [Estrutura do Projeto](#estrutura-do-projeto)
- [Instalação](#instalação)
- [Configuração](#configuração)
- [Execução](#execução)
- [Documentação](#documentação)
- [Contribuindo](#contribuindo)
- [Licença](#licença)

## 🎮 Sobre

Este é um servidor privado de Lineage 2, um MMORPG desenvolvido pela NCsoft. Este projeto permite hospedar e gerenciar seu próprio servidor do jogo.

## ⚙️ Pré-requisitos

Antes de começar, certifique-se de ter instalado:

- **Java JDK 8+** (recomendado: JDK 11 ou superior)
- **MySQL 5.7+** ou **MariaDB 10.3+**
- **Git** para controle de versão
- **Maven** ou **Gradle** para build (dependendo da implementação)
- Sistema operacional: Windows, Linux ou macOS

### Requisitos de Hardware

- **CPU**: Dual-core 2.0 GHz ou superior
- **RAM**: Mínimo 2GB (recomendado 4GB+)
- **Disco**: 5GB+ de espaço livre
- **Rede**: Conexão estável de internet

## 📁 Estrutura do Projeto

```
L2_Server/
├── config/              # Arquivos de configuração
├── data/                # Dados do jogo (spawns, NPCs, etc.)
├── database/            # Scripts SQL e schemas
├── docs/                # Documentação adicional
├── libs/                # Bibliotecas externas
├── scripts/             # Scripts de gerenciamento e deploy
├── src/                 # Código-fonte do servidor
│   ├── gameserver/      # Servidor do jogo
│   └── loginserver/     # Servidor de login
└── README.md
```

## 🚀 Instalação

### 1. Clone o Repositório

```bash
git clone https://github.com/AbnerStelmastchuk/L2_Server.git
cd L2_Server
```

### 2. Configure o Banco de Dados

```bash
# Crie o banco de dados
mysql -u root -p
CREATE DATABASE l2server;
CREATE DATABASE l2server_login;

# Importe os schemas
mysql -u root -p l2server < database/game_schema.sql
mysql -u root -p l2server_login < database/login_schema.sql
```

### 3. Configure as Credenciais

Edite os arquivos de configuração em `config/` com suas credenciais do banco de dados e outras configurações.

### 4. Compile o Projeto

```bash
# Se usar Maven
mvn clean install

# Se usar Gradle
gradle build
```

## ⚙️ Configuração

### Configuração Básica

1. **Database Config** (`config/database.properties`):
   - Configure host, porta, usuário e senha do MySQL
   
2. **Server Config** (`config/server.properties`):
   - Configure IP, porta e configurações do servidor
   
3. **Rates Config** (`config/rates.properties`):
   - Configure taxas de XP, SP, drop, etc.

Consulte a [documentação completa](docs/CONFIGURATION.md) para mais detalhes.

## ▶️ Execução

### Iniciar o Servidor de Login

```bash
# Linux/macOS
./scripts/start-login.sh

# Windows
scripts\start-login.bat
```

### Iniciar o Servidor do Jogo

```bash
# Linux/macOS
./scripts/start-game.sh

# Windows
scripts\start-game.bat
```

### Parar os Servidores

```bash
# Linux/macOS
./scripts/stop-servers.sh

# Windows
scripts\stop-servers.bat
```

## 📚 Documentação

- [Guia de Configuração Detalhada](docs/CONFIGURATION.md)
- [Guia de Desenvolvimento](docs/DEVELOPMENT.md)
- [FAQ - Perguntas Frequentes](docs/FAQ.md)
- [Troubleshooting](docs/TROUBLESHOOTING.md)

## 🤝 Contribuindo

Contribuições são bem-vindas! Por favor, leia o [CONTRIBUTING.md](CONTRIBUTING.md) para detalhes sobre nosso código de conduta e processo de submissão de pull requests.

## 📄 Licença

Este projeto está licenciado sob a Apache License 2.0 - veja o arquivo [LICENSE](LICENSE) para detalhes.

## ⚠️ Aviso Legal

Este é um projeto educacional. Lineage 2 é uma marca registrada da NCsoft. Este servidor não é afiliado, associado, autorizado, endossado por, ou de qualquer forma oficialmente conectado com a NCsoft.

## 📞 Suporte

Para reportar problemas ou sugestões:
- Abra uma [Issue](https://github.com/AbnerStelmastchuk/L2_Server/issues)
- Entre em contato através das discussões do projeto

---

**Desenvolvido com ❤️ para a comunidade de Lineage 2**