# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) **and Cowork** when working with this project.
**Last updated:** 2026-05-20 — Ecosystem expanded: Podcast + TikTok added. See `Estrategia/ECOSSISTEMA-MASTER.md` for full channel map.

---

## MASTER CONTEXT — READ FIRST

**Project:** @motheroffthemap · Elle · Brazilian woman, 47, journalist, Hallandale Beach FL
**Mission:** "You don't need another course. You need a place to land."
**Audience:** Women 45–65 — burnout, identity shift, immigration, reinvention
**Languages:** Portuguese (production/approval) + American English (publishing)
**Phase:** Phase 2 (started ~April 24, 2026 — Day ~27 as of May 20)

### The Ecosystem (6 channels, 1 nucleus)

| Channel | Objective | Cadence | Status |
|---------|-----------|---------|--------|
| Instagram @motheroffthemap | Reach + emotional connection | 5 posts/day | Active · Phase 2 |
| Blog motheroffthemap.blog | SEO authority + depth | 1 article/Wednesday | Active · Phase 2 |
| Podcast "Mãe Fora do Mapa" | Deep trust + qualified conversion | 1 episode/week · 10 min | Planned · launching month 2 |
| TikTok @motheroffthemap | Reach + discovery | 1–2 videos/day | Planned · launching month 2–3 |
| Email MailerLite | Direct relationship + conversion | 1 email/Tuesday | Active · Phase 2 |
| Stan.store | Revenue | Product updates | Active |

**Full strategy:** `Estrategia/ECOSSISTEMA-MASTER.md`

### Product Funnel (Stan.store)

| # | Product | Price | Status | ManyChat keyword |
|---|---------|-------|--------|-----------------|
| 1 | 5-Min Mental Reset | FREE | Live | RESET |
| 2 | The Focus Prescription | $17 | Live | FOCUS |
| 3 | The Pause | $27 | In progress | PAUSE |
| 4 | The Balance Blueprint | $37 | Live | BALANCE |
| 5 | The Reinvention Roadmap | $67 | Live | ROADMAP |
| 6 | The Creator Blueprint | $97 | Publishing | CREATOR |
| 7 | Silver Mastery Protocol | $147 | In progress | SILVER |
| 8 | 1:1 Clarity Session | $297 | In progress | SESSION |

**Stan.store never linked directly in posts — ManyChat DM automation only.**

### Elle — Visual Identity
- Blonde wavy shoulder-length hair, soft highlights · Fair skin, blue-green eyes
- Minimal natural makeup — real skin, not filtered · Delicate gold pendant necklace
- Environments: white bathroom, home office with afternoon sun, balcony, kitchen
- Tools: Grok / ImageFX (static) · Higgsfield · HeyGen · Gemini / Veo 2 / Veo 3 (video/podcast avatar) · Google Labs
- **Never use:** ElevenLabs

### Phase Rules
- **Phase 1 (first 15 days of any new channel):** Zero product links, zero ManyChat keywords, every post ends with genuine question
- **Phase 2 (after day 15):** One product mention max/day, Slot 5 only, soft offer follows value — never leads

### Content Voice — Never Use
hustle · grind · boss babe · 10x · optimize · level up · fix yourself · "my loves" · performative vulnerability

### File Storage Convention
- Master strategy docs → `Estrategia/` (vault) + `_repo-sync/Estrategia/` (GitHub mirror)
- Daily Instagram → `Conteudo/instagram-YYYY-MM-DD-full-day.md`
- Weekly blog → `Blog/blog-YYYY-MM-DD.md`
- Weekly email → `Email/email-YYYY-MM-DD.md`
- Master reports → `Estrategia/master-report-YYYY-MM-DD.md`

---

## What This Repo Is

**Content source of truth** for `stan.store/motheroffthemap` — a bilingual (PT/EN) wellness digital products business for overwhelmed mothers 45+. Brand: Mãe Fora do Mapa. No programmatic deploy to Stan.store exists — every file is a human-readable, copy-paste-ready artifact.

Active development branch: `claude/setup-stan-store-account-NrGH2`

## Commands

```bash
node mother-off-the-map-launcher.js   # validate all 52 expected files are present + JSON is valid
npm run agent                          # run all daily AI automation tasks (requires OPENAI_API_KEY in .env)
npm run agent -- --task content        # generate today's Instagram content
npm run agent -- --task email          # draft email A/B variations
npm run agent -- --task metrics        # print metrics summary
python3 -m pip install -r agent/requirements.txt  # install Python deps
```

Run the launcher after any structural change to confirm 52/52 files pass.

## Architecture

### File pairs per product
Every product in `products/<id>/` has exactly two files:
- `config.json` — structured data: price, type, delivery method, funnel position, active/standby status
- `copy.md` — all UI prose in EN (primary) then PT under `## PORTUGUESE VERSION`

### Activation pattern
Products can be `active: true` or `active: false` (standby). The `stan-store/page-config.json` controls display order on the Stan.store page via `product_display_order`. Standby products go in `_standby_products`. To activate a product, update both files plus any upsell references, then commit and push.

### Key config relationships
- `stan-store/page-config.json` → controls Stan.store page layout + product order
- `stan-store/brand.json` → colors, fonts, voice pillars — referenced by all copy
- `agent/ai-agent-instructions.md` → use as system prompt when generating on-brand copy
- `products/cared-ai-companion/` → SaaS product **DUNA** at `https://say-do-trust.lovable.app` (Lovable/Supabase app, security cleared 04/04/2026, renamed from CARED to DUNA on 05/04/2026)

### Python agent (`agent/mother_off_the_map_agent.py`)
Class-based (`MotherOffTheMapAgent`). Reads `content/4-week-calendar.json` for the content plan, `stan-store/brand.json` for voice, and `agent/ai-agent-instructions.md` for the system prompt. Calls OpenAI. Requires `.env` with `OPENAI_API_KEY`.

### Stan.store is external SaaS
Changes to this repo do NOT auto-deploy to Stan.store. After updating copy or config files, the human must manually apply changes in the Stan.store dashboard. The repo is the source of truth; Stan.store is the destination.

## Bilingual Convention

Portuguese is the primary language for the DUNA product; English is primary for all other products. In `copy.md` files, English section comes first, Portuguese section follows under `## PORTUGUESE VERSION`. Both languages carry equal editorial weight — never treat PT as a secondary translation.

## DUNA Notes

The SaaS product (`products/cared-ai-companion/`) is a Lovable-built app named **DUNA** (React/TypeScript/Supabase/Stripe). Its Supabase project is managed **internally by Lovable** — do not attempt SQL migrations via the external Supabase dashboard. Apply DB changes via Lovable chat prompts. Security fixes reference files live in `docs/cared-security-fixes/`.
