# Ego Eimi - MVP Challenge: TeamBrain

Este repositório contém a entrega do desafio técnico da Ego Eimi. O projeto é um MVP funcional do produto **TeamBrain**: um motor de conhecimento corporativo com busca ACL-aware via RAG (retrieval augmented generation).

---

## 📁 Estrutura

```
.
├── .env
├── .env.example
├── docker-compose.yml
├── Makefile
└── apps/
    └── backend/   ← código principal do backend (submódulo Git)
```

> ⚠️ O diretório `apps/backend` é um repositório Git separado. Certifique-se de clonar com submódulos.

---

## 🚀 Como Rodar o Projeto

### 1. Clone com Submódulos

```bash
git clone --recurse-submodules <url-do-repo>
```

Ou, se já tiver clonado:

```bash
git submodule update --init --recursive
```

### 2. Configure o `.env`

Crie o arquivo:

```bash
cp .env.example .env
```

> Edite as variáveis conforme necessário.

---

### 3. Instale Dependências

```bash
bun install
npm i -g @nestjs/cli
```

---

### 4. Suba os serviços

```bash
docker compose up -d
```

---

### 5. Rode o Backend

```bash
cd apps/backend
bun run prepare:full-clean
bun run start
```

---

### 6. Executar Testes

```bash
cd apps/backend
bun test
```

---

## 🧪 Mock de Embedding

O serviço de embeddings está **mockado** nesta versão para facilitar testes locais e garantir previsibilidade sem necessidade de chave Groq.

---

## 📽️ Vídeo Demo

👉 [Insira aqui o link para o vídeo no Loom ou similar]

---

## ⏱️ Tempo Total

Aproximadamente **40 horas**, com distribuição estimada:

| Etapa                    | Tempo |
|--------------------------|-------|
| Infraestrutura e Docker  | 5h    |
| Backend principal        | 20h   |
| Testes                   | 5h    |
| Ajustes e refinamento    | 4h    |
| Documentação e setup     | 6h    |

---

## 📤 Submissão

Enviar email para `felipe@egoeimi.dev` com assunto:

**MVP Challenge - Flávio Henrique - TeamBrain**

Inclua no email:

- ✅ Link do repositório
- 🎥 Link do vídeo demo

---
