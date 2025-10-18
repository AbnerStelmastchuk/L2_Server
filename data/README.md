# Game Data

Este diretório contém os dados do jogo que são carregados pelo servidor.

## Estrutura

```
data/
├── html/           # Arquivos HTML para NPCs e dialogs
├── scripts/        # Scripts Python/Jython para quests e AI
├── xml/            # Arquivos XML de configuração
│   ├── items/      # Definições de items
│   ├── npcs/       # Definições de NPCs
│   ├── skills/     # Definições de skills
│   ├── zones/      # Definições de zonas
│   └── spawns/     # Pontos de spawn
└── geodata/        # Dados geográficos do mundo
```

## HTML

Arquivos HTML para interfaces de NPC:

```html
<!-- data/html/merchant/30001.htm -->
<html>
<body>
Bem-vindo à minha loja!<br>
<a action="bypass -h npc_%objectId%_Buy">Comprar items</a><br>
<a action="bypass -h npc_%objectId%_Sell">Vender items</a><br>
</body>
</html>
```

## Scripts

Scripts para quests e AI:

```python
# data/scripts/quests/Q001_FirstQuest.py
from com.l2server.gameserver.model.quest import Quest
from com.l2server.gameserver.model.quest import QuestState

class Quest001(Quest):
    def __init__(self):
        Quest.__init__(self, 1, "First Quest", "Your first quest")
    
    def onTalk(self, npc, player):
        st = player.getQuestState("Q001_FirstQuest")
        if st is None:
            st = self.newQuestState(player)
        return "quest001_01.htm"
```

## XML

### Items

```xml
<!-- data/xml/items/weapon_0001.xml -->
<item id="1" type="Weapon" name="Sword of the Brave">
    <set name="icon" val="icon.weapon_sword_i00" />
    <set name="weapon_type" val="sword" />
    <set name="bodypart" val="rhand" />
    <set name="crystal_type" val="d" />
    <set name="weight" val="1350" />
    <set name="price" val="123000" />
    <set name="soulshots" val="1" />
    <set name="spiritshots" val="1" />
    
    <stats>
        <set name="pAtk" val="120" />
        <set name="mAtk" val="70" />
        <set name="atkSpd" val="379" />
    </stats>
</item>
```

### NPCs

```xml
<!-- data/xml/npcs/merchant_30001.xml -->
<npc id="30001" name="Merchant John" type="Merchant">
    <set name="level" val="70" />
    <set name="hp" val="2500" />
    <set name="mp" val="1000" />
    <set name="exp" val="0" />
    <set name="sp" val="0" />
    
    <ai>
        <set name="aggro" val="0" />
        <set name="clan" val="merchant" />
    </ai>
    
    <skills>
        <!-- Lista de skills do NPC -->
    </skills>
</npc>
```

### Skills

```xml
<!-- data/xml/skills/skill_0001.xml -->
<skill id="1" name="Power Strike" type="ACTIVE">
    <set name="power" val="50" />
    <set name="target" val="ONE" />
    <set name="skillType" val="PDAM" />
    <set name="operateType" val="OP_ACTIVE" />
    <set name="castRange" val="40" />
    <set name="effectRange" val="400" />
    
    <level val="1">
        <set name="mpConsume" val="15" />
        <set name="hpConsume" val="0" />
    </level>
</skill>
```

### Spawns

```xml
<!-- data/xml/spawns/zone_001.xml -->
<list>
    <spawn npc="20001" x="115616" y="-178176" z="-950" respawn="60">
        <territory>
            <add x="115000" y="-178000" />
            <add x="116000" y="-178000" />
            <add x="116000" y="-179000" />
            <add x="115000" y="-179000" />
        </territory>
    </spawn>
</list>
```

## Geodata

Dados geográficos para pathfinding e colisões:

- Arquivos binários que definem a altura do terreno
- Usado para movimento de personagens
- Detecção de linha de visão
- Sistema de colisão

**Formato**: Geralmente arquivos `.l2j` ou `.dat` específicos do servidor.

## Carregamento de Dados

Os dados são carregados na inicialização do servidor:

```java
// Exemplo de carregamento
DataLoader.loadItems();
DataLoader.loadNPCs();
DataLoader.loadSkills();
DataLoader.loadSpawns();
```

## Validação

Valide seus dados antes de subir:

```bash
# Verifique sintaxe XML
xmllint --noout data/xml/**/*.xml

# Verifique codificação
file -i data/**/*.xml
```

## Boas Práticas

1. **Use UTF-8** para todos os arquivos
2. **Valide XML** antes de commitar
3. **Documente scripts** com comentários
4. **Use IDs únicos** para items, NPCs, skills
5. **Teste mudanças** em servidor de desenvolvimento
6. **Backup** antes de grandes mudanças
7. **Organize** por categorias (items por tipo, npcs por região)

## Contribuindo

Ao adicionar novos dados:

1. Siga a estrutura existente
2. Use IDs sequenciais
3. Adicione comentários descritivos
4. Teste completamente
5. Documente itens especiais

Veja [CONTRIBUTING.md](../CONTRIBUTING.md) para mais informações.
