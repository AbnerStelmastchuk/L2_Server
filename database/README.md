# Database Schemas

Este diretório contém os scripts SQL para criar e manter o banco de dados do servidor.

## Estrutura

- **game_schema.sql** - Schema do banco de dados do jogo
- **login_schema.sql** - Schema do banco de dados de login
- **updates/** - Scripts de atualização incrementais

## Instalação

### 1. Criar os Bancos de Dados

```sql
CREATE DATABASE l2server CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE DATABASE l2server_login CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

### 2. Importar os Schemas

```bash
# Importar schema do game server
mysql -u root -p l2server < game_schema.sql

# Importar schema do login server
mysql -u root -p l2server_login < login_schema.sql
```

### 3. Aplicar Atualizações

```bash
# Aplicar updates na ordem numérica
mysql -u root -p l2server < updates/001_update_description.sql
mysql -u root -p l2server < updates/002_update_description.sql
```

## Backup

Recomenda-se fazer backup regular dos bancos de dados:

```bash
# Backup do game database
mysqldump -u root -p l2server > backup_game_$(date +%Y%m%d).sql

# Backup do login database
mysqldump -u root -p l2server_login > backup_login_$(date +%Y%m%d).sql
```

## Segurança

- Use senhas fortes para os usuários do banco de dados
- Não compartilhe credenciais do banco de dados
- Mantenha backups regulares
- Configure permissões adequadas para os usuários
