## Restauranty-End-to-End-DevOps-Deployment
This project is a full-stack microservices-based web application deployed on Azure Kubernetes Service (AKS) using a GitHub Actions CI/CD pipeline and Terraform infrastructure as code.
# 📦 Architecture Overview

![Architecture](./architecture/project4.jpeg)

# The application consists of:

- Three Node.js backend microservices:

    - Auth: User authentication & JWT generation

    - Discounts: Campaign and coupon management

    - Items: Product catalog and order handling

# React frontend:

- Acts as a single-page application (SPA) interacting with backend microservices via /api/* routes

# MongoDB:

- Centralized NoSQL database for all microservices, exposed via port 27017

# Ingress Controller:

- Routes traffic from a single public IP/domain to appropriate services

- NGINX Ingress on port 80

# Monitoring & Logging:

- Prometheus + Grafana (monitoring namespace): Metrics scraping and visualization

- ELK Stack (Elasticsearch, Logstash, Kibana) (logging namespace): Centralized log collection and analysis

# 🚀 Deployment Flow
- Infrastructure Provisioning: Terraform provisions Azure Resource Group and AKS cluster.

# CI/CD Pipeline:

- GitHub Actions builds Docker images and pushes them to a container registry.

- Kubernetes manifests are applied to deploy services.

# Ingress Routing:

- All traffic enters through the NGINX Ingress Controller.

# Routes are defined:

- /api/auth/ → Auth Service

- /api/discounts/ → Discounts Service

- /api/items/ → Items Service

- / → React Frontend

# Monitoring & Logging:

- Prometheus scrapes metrics from pods.

- Grafana visualizes performance metrics.

- ELK stack collects logs from all services.

# 🔐 Security
- Ingress is the only public entrypoint.

- JWT authentication handled by the Auth service; other services validate tokens.

- Environment variables and secrets are stored securely in Kubernetes Secrets or .env (not committed).

- Network Policies restrict communication between pods where needed.

# 🔧 Environment Variables
- Each backend service requires:
- PORT=300x
- SECRET=YourJWTSecret
- MONGODB_URI=mongodb://<mongodb-host>:27017/<db>
- CLOUD_NAME=...
- CLOUD_API_KEY=...
- CLOUD_API_SECRET=...

# Frontend uses:
- REACT_APP_API_URL=http://<load-balancer-ip>

## Monitoring and logging

- it is best not to automate this part in the pipeline, it is not a process you want to run each time the pipeline runs. One time set up is enough. Therefore, manually apply manifests for the deployments and services.

- clone kube-prometheus repo to get the prometheus stack:
1. Set up custom manifest monitor+log folder containing following sub folders
    setup (namespace.yml and rbac.yml specific for AKS)
    monitoring (prometheus-config.yml and grafana,yml)
    logging (elasticsearch.yml, kibana.yml and logstash.yml)
2. Then RUN:
    - kubectl apply --server-side -f ./monitor+log/setup
    - kubectl apply -f ./monitor+log/monitoring
    - kubectl apply -f ./monitor+log/logging
3.  Prometheus collects and exposes metrics.
    - URL (via Ingress): http://<Ingress-IP or host>/
4. Grafana visualizes Prometheus data.
    - URL (via Ingress or LoadBalancer): http://<Ingress-IP or host>
    - Login Default:
    - User: admin
    - Pass: admin (you should change this)

    - Add Prometheus as a data source: URL: http://prometheus:9090 (internal Kubernetes service name)
    - Create Dashboards: Use templates or custom queries.
5. Elastcisearch access is internal: 
    - Kibana Web interface to visualize logs.
    - URL (via Ingress or LoadBalancer): http://<Ingress-IP or host>

 


