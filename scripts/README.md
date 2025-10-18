# Scripts de Gerenciamento do Servidor

Este diretório contém scripts para gerenciar o servidor L2.

## Scripts Disponíveis

### Linux/macOS

- **start-login.sh** - Inicia o servidor de login
- **start-game.sh** - Inicia o servidor do jogo
- **stop-servers.sh** - Para todos os servidores

### Windows

- **start-login.bat** - Inicia o servidor de login
- **start-game.bat** - Inicia o servidor do jogo

## Uso

### Linux/macOS

Primeiro, torne os scripts executáveis:
```bash
chmod +x scripts/*.sh
```

Então execute:
```bash
./scripts/start-login.sh
./scripts/start-game.sh
```

Para parar:
```bash
./scripts/stop-servers.sh
```

### Windows

Clique duas vezes no arquivo .bat ou execute via prompt de comando:
```cmd
scripts\start-login.bat
scripts\start-game.bat
```

## Personalização

Ajuste as seguintes configurações nos scripts conforme necessário:
- **JAVA_OPTS**: Opções da JVM (memória, GC, etc.)
- **Classpath**: Caminho para JARs e classes compiladas
- **Main Class**: Classe principal para cada servidor

## Notas

- Certifique-se de que o Java está instalado e disponível no PATH
- Compile o projeto antes de iniciar os servidores
- Os servidores devem ser iniciados na ordem: Login → Game
