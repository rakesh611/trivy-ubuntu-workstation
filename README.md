# trivy-ubuntu-workstation
trivy-ubuntu-workstation/
│
├── README.md
├── pv.yml
├── Dockerfile
├── pvc.yaml
├── namespace.yml
├── deployment.yaml
├── service.yaml
└── reports/                 

# Trivy Ubuntu Workstation on Kubernetes
This project deploys a full-featured Ubuntu pod in Kubernetes with Trivy installed and automated updates. It is designed as a workstation to scan container images, code repositories, and Infrastructure-as-Code (IaC) files.
## Features- Ubuntu 22.04 base
- Trivy installed and auto-updated daily
- Pre-installed tools: vim, ssh, curl, git, python3, nodejs, npm
- Persistent storage for scan reports and logs
- Organized reports folder:
  - `/trivy-reports/images` - Container image scans
  - `/trivy-reports/iac` - IaC scans
  - `/trivy-reports/git` - Git repository scans
  - `/trivy-reports/logs` - Cron and update logs
- Optional Docker socket mount to scan local images

## Deployment Instructions

1. Apply the namespace

2. Apply the PersistentVolume:
3. Apply the Persistentvolumeclaim
4. Deploy the Trivy Ubuntu workstation pod:
5. (Optional) Apply the NodePort service for external access:
6. Access the pod:
7. Verify installed tools and Trivy:
trivy --version
vim --version
git --version
ssh -V
python3 --version
node -v
npm -v
Using Trivy

Scan container images:
trivy image nginx:latest -o /trivy-reports/images/nginx.json
Scan IaC files:
trivy fs /path/to/manifests -o /trivy-reports/iac/manifests.json
Scan Git repositories:
trivy repo https://github.com/you_repo
Check Trivy update logs:
cat /trivy-reports/logs/trivy-update.log
Extending the Pod

Install additional tools:
apt-get update && apt-get install -y <package-name>
