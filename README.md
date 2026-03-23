# 🎮 Gaming Platform API Testing Framework

> Production-grade API testing framework for gaming platform integrations — built with real-world experience resolving 100+ integration issues monthly at Yggdrasil Gaming.

[![CI/CD Status](https://github.com/Golden-Sins/gaming-platform-api/actions/workflows/api-tests.yml/badge.svg)](https://github.com/Golden-Sins/gaming-platform-api/actions/workflows/api-tests.yml)
[![Postman](https://img.shields.io/badge/Postman-FF6C37?style=for-the-badge&logo=postman&logoColor=white)](https://www.postman.com/)
[![Newman](https://img.shields.io/badge/Newman-FF6C37?style=for-the-badge&logo=postman&logoColor=white)](https://github.com/postmanlabs/newman)
[![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)](https://www.docker.com/)
[![GitHub Actions](https://img.shields.io/badge/GitHub_Actions-2088FF?style=for-the-badge&logo=github-actions&logoColor=white)](https://github.com/features/actions)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

---

## 📋 Overview

This framework provides a comprehensive, automated API testing suite for gaming platform integrations. It was built to reflect the exact testing challenges encountered in production B2B gaming environments — where authentication flows, transaction processing, and game management APIs must behave consistently across multiple partner integrations and environments.

**What this solves:** Manual API testing doesn't scale. Integration partners break things silently. This framework makes failures loud, fast, and reproducible.

---

## ✨ Key Features

| Feature | Details |
|---|---|
| **70+ automated test scenarios** | Covering authentication, game management, and transaction processing |
| **Data-driven testing** | CSV-based inputs for scalable scenario coverage without changing test logic |
| **Multi-environment support** | Separate configs for `dev`, `staging`, and `prod` |
| **CI/CD pipeline** | GitHub Actions runs the full suite on every push |
| **Docker containerised** | Reproducible runs anywhere — no environment mismatch |
| **HTML reporting** | Professional test reports generated after every run |
| **Performance benchmarking** | Response time assertions against configurable thresholds |

---

## 🏗️ Project Structure

```
gaming-platform-api/
├── .github/
│   └── workflows/          # GitHub Actions CI/CD pipeline
├── collections/            # Postman collections (70+ test scenarios)
├── data/                   # CSV files for data-driven testing
├── environments/           # dev / staging / prod environment configs
├── docs/                   # API documentation
├── scripts/                # Newman run scripts
├── Dockerfile              # Container definition
├── docker-compose.yml      # Local orchestration
└── README.md
```

---

## 🧪 Test Coverage

### Authentication
- OAuth2 token acquisition and validation
- JWT signature and expiry checks
- Invalid credential handling (401 / 403 scenarios)
- Token refresh flows

### Game Management
- Game launch URL generation
- Session initialisation and termination
- Game state validation
- Error response conformance

### Transaction Processing
- Bet placement and settlement flows
- Balance inquiry and update validation
- Idempotency key enforcement
- Currency and rounding edge cases

---

## 🚀 Quick Start

### Option 1: Local (without Docker)

```bash
# Clone the repo
git clone https://github.com/Golden-Sins/gaming-platform-api.git
cd gaming-platform-api

# Install Newman and reporter
npm install -g newman newman-reporter-htmlextra

# Run against dev environment
newman run collections/gaming-platform.json \
  -e environments/dev.json \
  -d data/test-data.csv \
  --reporters cli,htmlextra \
  --reporter-htmlextra-export docs/report.html
```

### Option 2: Docker

```bash
# Build and run
docker-compose up --build

# Reports are saved to ./docs/report.html
```

---

## ⚙️ CI/CD Pipeline

Every push to `main` triggers the GitHub Actions workflow which:

1. Spins up a clean Node.js environment
2. Installs Newman and dependencies
3. Runs the full test collection against the staging environment
4. Generates an HTML report
5. Fails the build if any test assertion fails or response times exceed thresholds

To view the latest run: [Actions tab →](https://github.com/Golden-Sins/gaming-platform-api/actions)

---

## 🌐 Environments

| Environment | Purpose |
|---|---|
| `dev` | Local development and feature testing |
| `staging` | Pre-release integration validation |
| `prod` | Smoke tests against live endpoints |

Environment files store base URLs, API keys, and environment-specific variables. **Never commit real credentials** — use GitHub Secrets for CI/CD.

---

## 📊 Reports

After each Newman run, an HTML report is generated at `docs/report.html`. It includes:

- Pass/fail status per test
- Response time per request
- Request/response bodies for failed assertions
- Overall summary with timing stats

---

## 🛠️ Prerequisites

| Tool | Version |
|---|---|
| Node.js | v16+ |
| npm | v8+ |
| Docker *(optional)* | v24.0+ |

---

## 💡 Background & Motivation

This project was built from direct experience as an **Integration Support Engineer at Yggdrasil Gaming**, where I resolved 100+ complex API integration issues monthly across international B2B gaming partners. The most common failures — auth mismatches, transaction processing errors, environment-specific bugs — were exactly the kinds of things a well-structured testing framework catches before they reach production.

Rather than keeping that knowledge internal, this framework externalises it into a reusable, runnable test suite that any gaming platform integration team could adopt.

---

## 🔗 Related Projects

- [Integration Failure Playground](https://github.com/Golden-Sins) — Node.js/Express sandbox simulating real-world API failure patterns (401/403, 429, 409, 500) with structured error envelopes and Newman-validated test suites.

---

## 📄 License

MIT — see [LICENSE.txt](LICENSE.txt)

---

## 👤 Author

**Valters Upenieks** — Integration & QA Engineer  
📧 valtersupenieks35@gmail.com  
📍 Tenerife, Spain (Open to Remote)  
🔗 [LinkedIn](https://www.linkedin.com/in/valters-upenieks-a15890284/) · [GitHub](https://github.com/Golden-Sins)
