\# 🎮 Gaming Platform API Testing Framework



> API testing suite for gaming platform integrations, built with Postman and Newman CLI.


![API Tests](https://github.com/Golden-Sins/gaming-platform-api/actions/workflows/api-tests.yml/badge.svg)

\[!\[Postman](https://img.shields.io/badge/Postman-FF6C37?style=for-the-badge\&logo=postman\&logoColor=white)](https://www.postman.com/)

\[!\[Newman](https://img.shields.io/badge/Newman-FF6C37?style=for-the-badge\&logo=postman\&logoColor=white)](https://github.com/postmanlabs/newman)



\## 🎯 Project Overview



Comprehensive API testing framework demonstrating professional gaming integration testing skills, based on real-world experience from My previous job.



\*\*Key Features:\*\*

\- 70+ automated test scenarios

\- Data-driven testing with CSV files

\- Multi-environment support (dev, staging, prod)

\- Professional HTML reporting

\- Performance benchmarking

> Comprehensive automated API testing framework with CI/CD integration


## CI/CD Integration

This project includes comprehensive GitHub Actions workflows:

### Automated Testing Workflows

**Continuous Integration (`api-tests.yml`)**
- Runs on every push to main branch
- Executes all test collections
- Validates code changes don't break existing functionality

**Nightly Regression (`nightly-tests.yml`)**
- Scheduled daily at 2 AM UTC
- Full test suite execution
- Maintains test result history for 30 days

**Performance Benchmarks (`performance-tests.yml`)**
- Weekly performance validation
- Tracks API response times
- Identifies performance degradation

**Pull Request Tests (`pr-tests.yml`)**
- Validates all pull requests
- Runs smoke tests on proposed changes
- Provides automated feedback

### Viewing Test Results

1. Navigate to the "Actions" tab
2. Select a workflow run
3. Download test reports from artifacts
4. View detailed HTML reports

### Running Tests Locally
```bash
# Run all tests
npm run test:all

# Run specific collection
newman run collections/authentication-flow.json -e environments/development.json

\### Prerequisites

```bash

node --version  # v16+ required

npm --version   # v8+ required

