Final Architecture
                 Browser
                    │
          http://SERVER-IP:8080
                    │
                    ▼
            +----------------+
            |     Nginx      |
            | Reverse Proxy  |
            +----------------+
                    │
                    ▼
            +----------------+
            | Flask App      |
            | Port 5000      |
            +----------------+
                    │
                    ▼
            +----------------+
            | MariaDB        |
            +----------------+
                    │
                    ▼
             erp-db-data

Step -1 Folder Structure

company-erp/

├── app/
│   ├── app.py
│   ├── requirements.txt
│   └── Dockerfile
│
├── nginx/
│   └── nginx.conf
│
├── compose.yaml
├── .env
└── README.md

Step-2: Python Application
Step-3: requirements.txt
Flask==3.1.0
Step-4: Dockerfile
Step-5: Nginx Configuration
Step-6: .env
Step-7: compose.yaml
Step-8: Build & Start & Check & logs command
docker compose up -d --build
docker compose ps
docker compose logs
Step-12: Test Reverse Proxy
Browser

↓

Nginx

↓

Flask

↓

Response
Nginx সরাসরি HTML Serve করছে না।

সে Request Forward করছে Flask Container-এ।

এটাই Reverse Proxy।
Step-13: Verify Network
docker network ls
docker network inspect company-erp_default
Step-14: Verify Volume
docker volume ls
company-erp_erp-db-data

