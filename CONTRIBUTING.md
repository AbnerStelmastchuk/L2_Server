# Guia de Contribuição

Obrigado por considerar contribuir para o projeto L2_Server! Este documento fornece diretrizes para contribuições.

## 📋 Índice

- [Código de Conduta](#código-de-conduta)
- [Como Posso Contribuir?](#como-posso-contribuir)
- [Processo de Desenvolvimento](#processo-de-desenvolvimento)
- [Padrões de Código](#padrões-de-código)
- [Processo de Pull Request](#processo-de-pull-request)
- [Reportando Bugs](#reportando-bugs)
- [Sugerindo Melhorias](#sugerindo-melhorias)

## 📜 Código de Conduta

### Nosso Compromisso

Estamos comprometidos em fornecer um ambiente acolhedor e inspirador para todos, independente de:
- Idade
- Deficiência
- Etnia
- Identidade e expressão de gênero
- Nível de experiência
- Nacionalidade
- Aparência pessoal
- Raça
- Religião
- Identidade e orientação sexual

### Comportamento Esperado

- Use linguagem acolhedora e inclusiva
- Respeite diferentes pontos de vista e experiências
- Aceite críticas construtivas graciosamente
- Foque no que é melhor para a comunidade
- Mostre empatia com outros membros da comunidade

### Comportamento Inaceitável

- Uso de linguagem ou imagens sexualizadas
- Trolling, comentários insultuosos/depreciativos, e ataques pessoais ou políticos
- Assédio público ou privado
- Publicar informações privadas de outros sem permissão explícita
- Outras condutas que possam ser consideradas inapropriadas em ambiente profissional

## 🤝 Como Posso Contribuir?

### Reportando Bugs

Bugs são rastreados como [GitHub Issues](https://github.com/AbnerStelmastchuk/L2_Server/issues). Antes de criar uma issue:

1. **Verifique se já existe** - Procure nas issues existentes
2. **Use o template** - Se disponível, use o template de bug report
3. **Seja específico** - Forneça o máximo de detalhes possível

#### Template de Bug Report

```markdown
**Descrição do Bug**
Uma descrição clara do que é o bug.

**Passos para Reproduzir**
1. Vá para '...'
2. Click em '....'
3. Role até '....'
4. Veja o erro

**Comportamento Esperado**
Descrição clara do que deveria acontecer.

**Screenshots**
Se aplicável, adicione screenshots.

**Ambiente:**
 - OS: [e.g. Windows 10, Ubuntu 20.04]
 - Java Version: [e.g. OpenJDK 11]
 - MySQL Version: [e.g. 8.0]
 - Server Version: [e.g. commit hash]

**Contexto Adicional**
Qualquer outra informação relevante.
```

### Sugerindo Melhorias

Melhorias também são rastreadas como [GitHub Issues](https://github.com/AbnerStelmastchuk/L2_Server/issues).

#### Template de Feature Request

```markdown
**A feature está relacionada a um problema?**
Uma descrição clara do problema. Ex: Estou sempre frustrado quando [...]

**Solução Desejada**
Descrição clara do que você quer que aconteça.

**Alternativas Consideradas**
Descrição de soluções alternativas que você considerou.

**Contexto Adicional**
Qualquer contexto ou screenshots sobre a feature.
```

## 🔧 Processo de Desenvolvimento

### Setup do Ambiente

1. **Fork o repositório**
   ```bash
   # Click no botão "Fork" no GitHub
   ```

2. **Clone seu fork**
   ```bash
   git clone https://github.com/seu-usuario/L2_Server.git
   cd L2_Server
   ```

3. **Adicione o upstream**
   ```bash
   git remote add upstream https://github.com/AbnerStelmastchuk/L2_Server.git
   ```

4. **Configure o ambiente**
   ```bash
   # Instale dependências
   mvn clean install
   
   # Configure o banco de dados
   mysql -u root -p < database/game_schema.sql
   ```

### Workflow de Desenvolvimento

1. **Crie uma branch**
   ```bash
   git checkout -b feature/sua-feature
   # ou
   git checkout -b fix/seu-bugfix
   ```

2. **Faça suas mudanças**
   - Escreva código limpo e bem documentado
   - Siga os padrões do projeto
   - Adicione testes quando apropriado

3. **Commit suas mudanças**
   ```bash
   git add .
   git commit -m "Tipo: Descrição breve
   
   Descrição detalhada das mudanças se necessário.
   
   Fixes #123"
   ```

4. **Sincronize com upstream**
   ```bash
   git fetch upstream
   git rebase upstream/main
   ```

5. **Push para seu fork**
   ```bash
   git push origin feature/sua-feature
   ```

## 🎨 Padrões de Código

### Convenções de Nomenclatura

```java
// Classes: PascalCase
public class GameServer { }

// Interfaces: PascalCase com 'I' prefix (opcional)
public interface IPlayerService { }

// Métodos: camelCase
public void loadPlayer() { }

// Variáveis: camelCase
private int playerCount;

// Constantes: UPPER_SNAKE_CASE
public static final int MAX_PLAYERS = 100;

// Pacotes: lowercase
package com.l2server.gameserver;
```

### Formatação

- **Indentação**: 4 espaços (não tabs)
- **Linha máxima**: 120 caracteres
- **Encoding**: UTF-8

### Comentários

```java
/**
 * Javadoc para classes e métodos públicos.
 * 
 * @param player O jogador a ser processado
 * @return true se bem-sucedido
 */
public boolean processPlayer(Player player) {
    // Comentários inline para lógica complexa
    if (player.isOnline()) {
        return true;
    }
    return false;
}
```

### Boas Práticas

1. **DRY (Don't Repeat Yourself)** - Evite duplicação de código
2. **KISS (Keep It Simple, Stupid)** - Mantenha simples
3. **SOLID Principles** - Siga princípios SOLID
4. **Null Safety** - Sempre verifique null
5. **Exception Handling** - Trate exceções apropriadamente

### Testes

```java
import org.junit.Test;
import static org.junit.Assert.*;

public class PlayerServiceTest {
    @Test
    public void testPlayerCreation() {
        PlayerService service = new PlayerService();
        Player player = service.createPlayer("TestPlayer");
        
        assertNotNull(player);
        assertEquals("TestPlayer", player.getName());
    }
}
```

## 📝 Processo de Pull Request

### Antes de Submeter

- [ ] Código segue os padrões do projeto
- [ ] Testes passam localmente
- [ ] Commit messages seguem o padrão
- [ ] Documentação foi atualizada (se necessário)
- [ ] Nenhum warning ou erro foi introduzido

### Submissão

1. **Crie o Pull Request** no GitHub
2. **Preencha o template** (se disponível)
3. **Aguarde review** - Mantenedores irão revisar

### Template de Pull Request

```markdown
## Descrição
Descrição clara das mudanças e motivação.

## Tipo de Mudança
- [ ] Bug fix (mudança que corrige uma issue)
- [ ] Nova feature (mudança que adiciona funcionalidade)
- [ ] Breaking change (fix ou feature que causa mudança em funcionalidade existente)
- [ ] Documentação

## Como Foi Testado?
Descreva os testes realizados.

## Checklist:
- [ ] Meu código segue os padrões deste projeto
- [ ] Revisei meu próprio código
- [ ] Comentei áreas complexas
- [ ] Atualizei a documentação
- [ ] Minhas mudanças não geram novos warnings
- [ ] Adicionei testes que provam que meu fix funciona ou que minha feature funciona
- [ ] Testes novos e existentes passam localmente
```

### Review Process

1. **Automated Checks** - CI/CD irá executar testes
2. **Code Review** - Mantenedores irão revisar
3. **Feedback** - Endereçe comentários dos reviewers
4. **Merge** - Após aprovação, será merged

### Após o Merge

- Delete sua branch
- Sincronize seu fork com upstream
- Comemore! 🎉

## 🔍 Diretrizes Específicas

### Commits

Use o formato:

```
Tipo: Descrição breve (máx 50 caracteres)

Corpo detalhado do commit explicando o que e por que
(máx 72 caracteres por linha)

Fixes #123
Closes #456
```

**Tipos**:
- `feat`: Nova feature
- `fix`: Bug fix
- `docs`: Apenas documentação
- `style`: Formatação, falta de ponto-e-vírgula, etc
- `refactor`: Refatoração de código
- `test`: Adição de testes
- `chore`: Manutenção

### Branch Naming

```
feature/nome-da-feature
fix/nome-do-bug
docs/nome-da-doc
refactor/nome-da-refatoracao
```

## 📞 Comunicação

- **Issues**: Para bugs e features
- **Pull Requests**: Para contribuições de código
- **Discussions**: Para perguntas gerais

## 📚 Recursos

- [Como fazer um Pull Request](https://docs.github.com/pt/pull-requests)
- [Markdown Guide](https://www.markdownguide.org/)
- [Java Style Guide](https://google.github.io/styleguide/javaguide.html)

## 🙏 Reconhecimento

Todas as contribuições são valiosas e serão reconhecidas! Obrigado por ajudar a melhorar o projeto.

---

**Dúvidas?** Abra uma issue ou discussion!
