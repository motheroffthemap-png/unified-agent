# CLAUDE.md — unified-agent

## Navegação de contexto via grafo (Graphify)

Antes de varrer arquivos crus, consulte o grafo de conhecimento gerado pelo
Graphify. Ele indexa AST + markdown e devolve nós relevantes com fração do
custo de token.

```bash
# Construir/atualizar o grafo (sem custo de LLM, ~30s incremental)
graphify update .

# Consultar
graphify query "<pergunta sobre o código>"
graphify explain "<nome do símbolo>"
graphify path "A" "B"
```

Arquivos do grafo ficam em `graphify-out/`:
- `graph.json` — versionado, fonte de verdade
- `GRAPH_REPORT.md` — leia para god-nodes e estrutura de comunidades
- `graph.html` — visualização local
- `cache/`, `.graphify_root`, `.rebuild.lock` — ignorados pelo git

**Regra**: para perguntas sobre código/estrutura, rode `graphify query` antes de
abrir arquivos com Read. Só leia arquivo cru quando o usuário pedir
explicitamente ou o grafo apontar para o caminho exato.
