# MANUS 1.6 — Configuração do Agente

## Informações Gerais
- **Versão:** Manus 1.6
- **Plataforma:** manus.im (from Meta)
- **Knowledge recalled:** 3 itens armazenados
- **Projetos ativos:** Mother Off the Map - Reels, Gabai's Decor

## Conectores Confirmados
| Conector | Status | Uso Principal |
|----------|--------|--------------|
| Vercel | ✅ Ativo | Deploy e monitoramento dos 17 projetos |
| GitHub | ✅ Ativo | Repos, commits, PRs, gestão de código |
| Instagram | ✅ Ativo | Publicação e analytics de posts |
| +15 outros | Disponíveis | A explorar e documentar |

## Capacidades do Manus
1. **Vercel live:** Vê status em tempo real de todos os projetos
2. **Deploy automático:** Pode disparar deploys via conector
3. **GitHub:** Pode criar/editar repos, fazer commits, PRs
4. **Instagram:** Pode publicar conteúdo diretamente
5. **Cloud computers:** Computadores na nuvem para tarefas pesadas

## Tasks Recentes (via sidebar Manus)
- Testing Vercel Connector and Explo... *(AI)*
- Como Testar e Usar o Conector Git... *(AI)* 
- Como abrir arquivos de motherofft... *(AI)*
- Exemplos para Demonstrar a Habili... *(AI)*
- Testing Instagram Connector and E... *(AI)*

## Como Usar Manus em Conjunto com Claude

### Divisão de Tarefas
| Tarefa | Usar |
|--------|------|
| Gerar script/copy/roteiro | Claude |
| Fazer deploy no Vercel | Manus |
| Commit no GitHub | Manus |
| Publicar no Instagram | Manus |
| Criar tarefas agendadas | Claude |
| Relatórios analíticos | Claude |
| Monitorar projetos Vercel | Manus |
| Geração de prompts visuais | Claude |

### Fluxo Combinado Recomendado
```
1. Claude gera o conteúdo (script, copy, landing page code)
2. Manus faz o commit no GitHub
3. Vercel detecta o commit → deploy automático
4. Manus confirma o deploy via conector
5. Claude registra no relatório diário
```
