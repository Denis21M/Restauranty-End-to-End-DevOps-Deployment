This project is a full-stack microservices-based web application deployed on Azure Kubernetes Service (AKS) using a GitHub Actions CI/CD pipeline and Terraform infrastructure as code.

![Architecture](Reastauranty-app/project4.jpeg)

- 📦 Architecture Overview
The application consists of:

Three Node.js backend microservices:

Auth: User authentication & JWT generation

Discounts: Campaign and coupon management

Items: Product catalog and order handling

- React frontend:

Acts as a single-page application (SPA) interacting with backend microservices via /api/* routes

- MongoDB:

Centralized NoSQL database for all microservices, exposed via port 27017

- Ingress Controller:

Routes traffic from a single public IP/domain to appropriate services

NGINX Ingress on port 80

- Monitoring & Logging:

Prometheus + Grafana (monitoring namespace): Metrics scraping and visualization

ELK Stack (Elasticsearch, Logstash, Kibana) (logging namespace): Centralized log collection and analysis

- 🗂️ Project Structure
.
├── backend/
│   ├── auth/        # Auth microservice (port 3001)
│   ├── discounts/   # Discounts microservice (port 3002)
│   └── items/       # Items microservice (port 3003)
├── client/          # React frontend (port 3000)
├── k8s/             # Kubernetes manifests
├── Terraform-files  # Infrastructure provisioning  
└── .github/workflows # CI/CD pipeline definition

- 🚀 Deployment Flow
Infrastructure Provisioning:

Terraform provisions Azure Resource Group and AKS cluster.

- CI/CD Pipeline:

GitHub Actions builds Docker images and pushes them to a container registry.

Kubernetes manifests are applied to deploy services.

- Ingress Routing:

All traffic enters through the NGINX Ingress Controller.

- Routes are defined:

/api/auth/ → Auth Service

/api/discounts/ → Discounts Service

/api/items/ → Items Service

/ → React Frontend

- Monitoring & Logging:

Prometheus scrapes metrics from pods.

Grafana visualizes performance metrics.

ELK stack collects logs from all services.

- 🔐 Security
Ingress is the only public entrypoint.

JWT authentication handled by the Auth service; other services validate tokens.

Environment variables and secrets are stored securely in Kubernetes Secrets or .env (not committed).

Network Policies restrict communication between pods where needed.

- 🔧 Environment Variables
Each backend service requires:
PORT=300x
SECRET=YourJWTSecret
MONGODB_URI=mongodb://<mongodb-host>:27017/<db>
CLOUD_NAME=...
CLOUD_API_KEY=...
CLOUD_API_SECRET=...

- Frontend uses:
REACT_APP_API_URL=http://<load-balancer-ip>
