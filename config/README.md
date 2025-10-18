# Configurações do Servidor

Este diretório contém os arquivos de configuração do servidor L2.

## Arquivos de Configuração

### Arquivos Principais

- **database.properties** - Configurações do banco de dados
- **server.properties** - Configurações gerais do servidor
- **rates.properties** - Taxas de XP, drop, etc.

### Configuração Inicial

1. Copie os arquivos `.example` removendo a extensão:
   ```bash
   cp database.properties.example database.properties
   cp server.properties.example server.properties
   cp rates.properties.example rates.properties
   ```

2. Edite cada arquivo com suas configurações específicas

3. **IMPORTANTE**: Os arquivos sem `.example` não devem ser commitados no Git pois contêm informações sensíveis

## Configurações Adicionais

Adicione aqui outros arquivos de configuração conforme necessário:
- Chat filters
- Geodata settings
- PvP/PK settings
- Event configurations
- Custom features
