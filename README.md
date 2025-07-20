# 🧠 Ego Eimi - MVP Challenge: TeamBrain

Este repositório contém a entrega do desafio técnico da Ego Eimi. O projeto implementa um MVP funcional do **TeamBrain**, um motor de conhecimento corporativo com busca **ACL-aware** via **RAG (Retrieval-Augmented Generation)**.

---

## ❗ Aviso Importante

> 🛑 **A versão em produção no Fly.io/Supabase foi bloqueada por limitações de infraestrutura:**
> - O Fly.io não oferece **IPv6 outbound**, necessário para chamadas externas (ex: Groq API).
> - O Supabase **bloqueia conexões de IPs externos**, impedindo o uso sem workaround.

✅ **A versão local via Docker Compose replica exatamente o ambiente real** e está funcional para demonstração.

---

## 🧱 Arquitetura

```
.
├── .env                    ← Variáveis de ambiente da raiz/backend
├── docker-compose.yml      ← Sobe Postgres, Qdrant, Backend, Frontend
├── Makefile                ← Alias para comandos úteis
└── apps/
    ├── backend/            ← Backend NestJS + Qdrant + Groq (submódulo Git)
    └── frontend/           ← Frontend React + Tailwind + React Query
```

> ⚠️ `apps/backend` é um **submódulo Git**. Use `--recurse-submodules` ao clonar.
> ⚠️ `apps/frontend` é um **submódulo Git**. Use `--recurse-submodules` ao clonar.

---

## 🛠️ Setup: Rodando Localmente

### 1. Clone o projeto com submódulos

```bash
git clone --recurse-submodules https://github.com/seu-usuario/ego-eimi-project.git
cd ego-eimi-project
```

Se já tiver clonado:

```bash
git submodule update --init --recursive
```

---

### 2. Configure as variáveis de ambiente

Copie os arquivos de exemplo:

```bash
cp .env.example .env
cp apps/frontend/.env.docker apps/frontend/.env
```

Edite os arquivos `.env` com suas configurações locais (ou mantenha os valores padrão para rodar com Docker local).

---

### 3. Suba todos os serviços

```bash
make clean && make build
```

---

### 6. Testes

```bash
cd apps/backend
bun i && bun run prepare:full-clean
# para rodar os testes unitários
bun run test
# para rodar os testes e2e
bun run test:e2e
```

---

## ⚙️ Variáveis de Ambiente

### `.env` (raiz)
```env
JWT_SECRET=...
OPEN_API_KEY=...
QDRANT_URL=...
QDRANT_API_KEY=...
QDRANT_COLLECTION=document_chunks
DB_HOST=postgres
DB_PORT=5432
DB_USER=postgres
DB_PASS=postgres
DB_DATABASE=test
USE_EMBEDDING_MOCK=true
BACKEND_URL=http://backend:3000
FRONTEND_URL=http://frontend:4173
CLEAR_QDRANT_ON_BOOT=true
```

### `apps/backend/.env`
```env
JWT_SECRET=...
OPEN_API_KEY=...
QDRANT_URL=...
QDRANT_API_KEY=...
QDRANT_COLLECTION=document_chunks
DB_HOST=localhost
DB_PORT=5432
DB_USER=postgres
DB_PASS=postgres
DB_DATABASE=test
USE_EMBEDDING_MOCK=true
BACKEND_URL=http://localhost:3000
FRONTEND_URL=http://localhost:5173
CLEAR_QDRANT_ON_BOOT=true
```

### `apps/frontend/.env`
```env
VITE_API_URL=http://localhost:3000
```

### `apps/frontend/.env.docker`
```env
VITE_API_URL=http://backend:3000
```

---

## 📽️ Vídeo Demo

👉 [Insira aqui o link para o vídeo no Loom ou similar]

---

## ⚡ Stack Técnica

- **Backend**: NestJS, TypeORM, PostgreSQL, pgvector, Qdrant
- **Frontend**: React + Vite, TailwindCSS, React Query
- **LLM/Embedding**: Groq API (`nomic-embed-text-v1`) — com opção de mock
- **Infraestrutura**: Docker Compose
- **Testes**: `bun test` + mocks de embedding

---

## 🤖 Uso de IA (ClaudeCode / ChatGPT)

- Refatoração de services e testes
- Geração de tipos e validação com Zod
- Geração de documentação e estrutura de README
- Prompt sample usado: `"crie um backend NestJS com endpoints para documentos com ACL e integração com embeddings usando Qdrant"`

---

## 🧠 Trade-offs & Decisões

- Embedding mockado localmente para evitar custos e dependência externa
- Substituição de deploy por ambiente local controlado
- Foco em segurança, testes e cobertura funcional do ciclo RAG

---

## 🔐 Segurança & Privacidade

- JWT com segredo externo via `.env`
- Sem PII nos dados de exemplo
- Mock de embedding garante ausência de dependência externa
- Estrutura permite rate limiting e CORS caso desejado

---

## 📈 Performance

- Embeddings e indexação em batch com controle de retries
- Tempo médio de resposta: ~600ms (mockado)
- Busca via Qdrant + ACL com filtros dinâmicos

---

## 🛣️ Próximos Passos (Roadmap)

- Adicionar suporte a autenticação via OAuth
- Implementar interface de administração de documentos e permissões
- Suporte a múltiplos modelos LLM configuráveis via `.env`

---

## ⏱️ Time Log

| Etapa        | Tempo estimado |
|--------------|----------------|
| Backend      | 21h            |
| Frontend     | 2h             |
| Testes       | 6h             |
| Infra & Docker | 5h          |
| Docs & ajustes finais | 11h    |
| **Total**    | **45h**        |

---

## ✅ Checklist do Desafio

- [x] MVP funcional com ciclo completo RAG
- [x] ACL-aware search
- [x] Setup 1 comando (via Docker Compose + Makefile)
- [x] Testes cobrindo serviços principais
- [x] Documentação detalhada (esse README!)
- [x] Vídeo demonstrando fluxo

---

> Feito com dedicação, engenharia e uma coquinha gelada.
