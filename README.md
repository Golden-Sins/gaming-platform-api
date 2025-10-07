
# 🎮 Gaming Platform API Testing Framework  

> A comprehensive API testing suite for gaming platform integrations, built with Postman and Newman CLI. Designed to ensure consistent, scalable, and reproducible testing across environments.  

![CI/CD Status](https://github.com/Golden-Sins/gaming-platform-api/actions/workflows/api-tests.yml/badge.svg)  
[![Postman](https://img.shields.io/badge/Postman-FF6C37?style=for-the-badge&logo=postman&logoColor=white)](https://www.postman.com/)  
[![Newman](https://img.shields.io/badge/Newman-FF6C37?style=for-the-badge&logo=postman&logoColor=white)](https://github.com/postmanlabs/newman)  


## 🎯 Project Overview  
This project is a production-ready API testing framework tailored for gaming platform integrations. Developed based on real-world experience (e.g., Yggdrasil Gaming integration challenges), it demonstrates expertise in API testing, CI/CD, and DevOps practices.  

**Key Features**:  
- ✨ 70+ automated test scenarios covering authentication, game management, and transaction processing  
- 📊 Data-driven testing with CSV files for scalable scenario management  
- 🌐 Multi-environment support (dev, staging, prod) with professional HTML reporting  
- ⚡ CI/CD pipeline ready (GitHub Actions) with performance benchmarking capabilities  


## 🛠️ Prerequisites  
To run tests locally or build the Docker image, ensure you have the following installed:  

| Tool               | Version Requirement          |  
|--------------------|------------------------------|  
| Node.js            | v16+ (LTS recommended)       |  
| npm                | v8+ (comes with Node.js)     |  
| Docker (Optional)  | v24.0.x+ (for containerization) |  


## 🚀 Installation & Setup  

### **Option 1: Local Setup (Without Docker)**  
1. **Clone the Repository**:  
   ```bash  
   git clone https://github.com/Golden-Sins/gaming-platform-api.git  
   cd gaming-platform-api  
   ```  

2. **Install Dependencies** (if required; Newman is typically global):  
   Newman (test runner) and the HTML reporter are installed globally via npm. If missing:  
   ```bash  
   npm install -g newman newman-reporter-htmlextra  
   ```  

### **Option 2: Docker Setup (Recommended)**  
1. **Build the Docker Image**:  
   ```bash  
   docker build -t gaming-api-tests .  
   ```  
   *First build may take 2-3 minutes; subsequent builds are faster.*  


## 🛠️ Running Tests  

### **Local Execution (Without Docker)**  
Run tests directly on your machine using Newman CLI:  

- **Run All Tests**:  
  ```bash  
  npm run test:all  
  ```  

- **Run Specific Test Collection** (e.g., authentication):  
  ```bash  
  newman run collections/authentication-flow.json -e environments/development.json  
  ```  

### **Docker Execution**  
Use the pre-built Docker image for consistent, environment-agnostic testing:  

- **Run All Tests in Container**:  
  ```bash  
  docker run gaming-api-tests  
  ```  

- **Run Specific Tests with Reports** (save reports locally):  
  ```bash  
  # Linux/macOS/Git Bash  
  docker run -v "$(pwd)/reports:/app/reports" gaming-api-tests  

  # Windows Command Prompt  
  docker run -v "%cd%/reports:/app/reports" gaming-api-tests  

  # PowerShell  
  docker run -v "${PWD}/reports:/app/reports" gaming-api-tests  
  ```  


## 🤖 CI/CD Integration  
This project includes automated testing via GitHub Actions, ensuring code changes and scheduled runs are validated rigorously.  

### **Workflows**  
| Workflow Name          | Trigger                  | Purpose                                                                 |  
|------------------------|--------------------------|-------------------------------------------------------------------------|  
| `api-tests.yml`         | Push to `main` branch    | Validate code changes with all test collections (Continuous Integration) |  
| `nightly-tests.yml`     | Daily at 2 AM UTC        | Run full regression suite to track long-term stability                 |  
| `performance-tests.yml` | Weekly (e.g., Sunday)    | Benchmark API response times and identify performance bottlenecks       |  
| `pr-tests.yml`          | New Pull Requests        | Run smoke tests on proposed changes to block broken PRs                |  

### **Viewing Test Results**  
1. Go to your GitHub repo → **Actions** tab.  
2. Select a workflow run (e.g., "Docker Container Tests").  
3. Under "Artifacts", download the `docker-test-reports-*` zip to access HTML/JSON reports.  


## 💻 Docker Support  
Containerization ensures tests run identically across local machines, CI/CD, and production servers.  

### **Key Docker Files**  
- `Dockerfile`: Defines the Docker image (Node.js 18 Alpine, installs Newman, copies test files).  
- `docker-compose.yml`: Orchestrates multi-container test sequences (auth → game → transaction).  
- `.dockerignore`: Excludes unnecessary files (e.g., `node_modules/`, `.git/`) to speed up builds.  

### **Advanced Docker Commands**  
- **Multi-Stage Builds**: Reduces image size by splitting build stages (see `Dockerfile` for optimization).  
- **Environment Variables**: Customize test runs without rebuilding (e.g., `docker run -e ENVIRONMENT=staging.json gaming-api-tests`).  


## 🌍 Project Structure  
```  
gaming-platform-api/  
├── .github/  
│   └── workflows/          # GitHub Actions definitions  
│       ├── api-tests.yml  
│       ├── docker-tests.yml  
│       ├── nightly-tests.yml  
│       ├── performance-tests.yml  
│       └── pr-tests.yml  
├── collections/            # Postman test collections (JSON files)  
│   ├── authentication-flow.json  
│   ├── game-management.json  
│   └── transaction-processing.json  
├── environments/           # Environment configs (dev, staging, prod)  
│   ├── development.json  
│   ├── staging.json  
│   └── production.json  
├── data/                   # CSV/JSON data for data-driven testing  
│   ├── authentication-data.csv  
│   ├── game-launch-data.csv  
│   └── transaction-data.csv  
├── reports/                # Auto-generated test reports (HTML/CLI)  
├── Dockerfile              # Docker image definition  
├── docker-compose.yml      # Multi-container orchestration  
├── .dockerignore           # Exclude files from Docker builds  
├── .gitignore              # Ignore Git-specific files  
├── LICENSE.txt             # Project license  
├── README.md               # This file  
└── scripts/                # Auxiliary scripts (batch/shell)  
    ├── generate-reports.bat  
    ├── performance-test.bat  
    └── run-full-suite.bat  
```  


## 🐛 Troubleshooting  
### **Common Issues & Solutions**  
| Issue                                  | Solution                                                                 |  
|----------------------------------------|--------------------------------------------------------------------------|  
| `newman not found` locally              | Install Newman globally: `npm install -g newman newman-reporter-htmlextra` |  
| Docker build fails (`invalid reference`) | Ensure `Dockerfile` has no leading characters (e.g., `>>> `, spaces) on `FROM` line |  
| Reports not saved locally               | Verify volume mount syntax matches your OS (see "Docker Execution" section) |  
| "Works on my machine" inconsistencies   | Use Docker containers for standardized environments                     |  


## 🤝 Contributors  
- **Valters Upenieks** ([LinkedIn](https://linkedin.com/in/valters-upenieks), [GitHub](https://github.com/Golden-Sins)) – Primary developer, responsible for framework design, test automation, and Docker integration.  


## 📜 License  
This project is licensed under the terms of the MIT License. See `LICENSE.txt` for details.  


## 🚀 Roadmap  
Future improvements include:  
- Advanced performance testing (load/stress with k6)  
- Mock server integration for isolated testing  
- Kubernetes orchestration for scalable CI/CD pipelines  
- ISTQB certification alignment for QA best practices  


---  
*Built with ❤️ for gaming platform integration excellence. Let’s make testing reliable and scalable!* 🚀