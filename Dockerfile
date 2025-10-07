FROM node:18-alpine
WORKDIR /app

RUN npm install -g newman newman-reporter-htmlextra

COPY collections/ ./collections/
COPY environments/ ./environments/
COPY data/ ./data/

RUN mkdir -p reports

CMD ["newman", "run", "collections/authentication-flow.json", \
     "-e", "environments/development.json", \
     "--reporters", "cli,htmlextra", \
     "--reporter-htmlextra-export", "reports/test-report.html"]