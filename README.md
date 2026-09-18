# AWS CI/CD ML Project

An end-to-end Machine Learning project with a Flask web application, Docker containerization, GitHub-based source control, and AWS deployment.

The project demonstrates how to develop, package, containerize, and deploy a Machine Learning application using modern MLOps and CI/CD practices.

---

## 🚀 Project Overview

This project implements a complete Machine Learning workflow:

```text
Data
  ↓
Data Ingestion
  ↓
Data Transformation
  ↓
Model Training
  ↓
Model Evaluation
  ↓
Model Saving
  ↓
Flask Web Application
  ↓
Docker Container
  ↓
AWS EC2 Deployment
```

The trained ML model is integrated with a Flask application that provides predictions through a web interface.

---

## 🛠️ Technologies Used

### Programming & ML

* Python 3.10
* Pandas
* NumPy
* Scikit-learn
* CatBoost
* XGBoost
* Seaborn
* Matplotlib
* Dill

### Web Development

* Flask
* HTML
* CSS

### DevOps & Deployment

* Git
* GitHub
* Docker
* AWS EC2
* AWS CLI
* CI/CD

---

## 📁 Project Structure

```text
AWS-CI-CD-project/
│
├── app.py
├── requirements.txt
├── setup.py
├── Dockerfile
├── .dockerignore
├── .gitignore
├── LICENSE
│
├── src/
│   ├── components/
│   ├── pipeline/
│   ├── exception.py
│   ├── logger.py
│   └── utils.py
│
├── artifacts/
│   ├── model.pkl
│   └── preprocessor.pkl
│
├── templates/
│   └── index.html
│
└── notebook/
    └── ...
```

> `notebook/`, `LICENSE`, `.env`, virtual environments, Python cache files, and other unnecessary files can be excluded from the Docker build using `.dockerignore`.

---

# ⚙️ Local Setup

## 1. Clone the Repository

```bash
git clone https://github.com/bharat-02/AWS-CI-CD-project.git
```

Move into the project directory:

```bash
cd AWS-CI-CD-project
```

---

## 2. Create a Virtual Environment

### Windows

```bash
python -m venv venv
```

Activate it:

```bash
venv\Scripts\activate
```

### Linux / Ubuntu

```bash
python3 -m venv venv
```

Activate it:

```bash
source venv/bin/activate
```

---

## 3. Install Dependencies

```bash
pip install --upgrade pip
```

```bash
pip install -r requirements.txt
```

---

## 4. Run the Flask Application

The application runs on port **8080**.

```bash
python app.py
```

The Flask application should start on:

```text
http://127.0.0.1:8080
```

For access from another machine/server, the application is configured to listen on:

```text
0.0.0.0:8080
```

---

# 🐳 Docker Deployment

Docker is used to package the Flask application and its dependencies into a portable container.

## 1. Build Docker Image

From the project root:

```bash
docker build -t aws-ci-cd-ml-app .
```

---

## 2. Run Docker Container

```bash
docker run -d \
  --name aws-ci-cd-ml-app \
  -p 8080:8080 \
  aws-ci-cd-ml-app
```

Check the running container:

```bash
docker ps
```

---

## 3. View Container Logs

```bash
docker logs aws-ci-cd-ml-app
```

To follow the logs:

```bash
docker logs -f aws-ci-cd-ml-app
```

---

## 4. Test the Application

Open:

```text
http://localhost:8080
```

When deployed to an AWS EC2 instance:

```text
http://<EC2-PUBLIC-IP>:8080
```

---

# 🐳 Dockerfile

The application uses a Python 3.10 slim image.

The Docker image:

1. Creates the `/app` working directory.
2. Installs required Linux packages.
3. Installs Python dependencies.
4. Copies the application source code.
5. Exposes port `8080`.
6. Starts the Flask application.

The container starts the application using:

```dockerfile
CMD ["python", "app.py"]
```

---

# 🚫 Docker Ignore

The `.dockerignore` file prevents unnecessary files from being copied into the Docker image.

Example:

```text
.git
.gitignore
.env
*.env
__pycache__
*.pyc
*.pyo
.venv
venv
env
data
mentor-docs
notebook
LICENSE
```

This helps reduce the Docker build context and prevents sensitive files such as `.env` from being included in the image.

---

# ☁️ AWS EC2 Deployment

The application can be deployed on an AWS EC2 Ubuntu instance using Docker.

## 1. Connect to EC2

Using SSH:

```bash
ssh -i <your-key.pem> ubuntu@<EC2-PUBLIC-IP>
```

---

## 2. Update Ubuntu

```bash
sudo apt update
sudo apt upgrade -y
```

---

## 3. Install Required Packages

```bash
sudo apt install -y ca-certificates curl git nano
```

Create the Docker keyring directory:

```bash
sudo install -m 0755 -d /etc/apt/keyrings
```

Download Docker's GPG key:

```bash
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg \
  -o /etc/apt/keyrings/docker.asc
```

---

## 4. Install Docker

After configuring the Docker repository, install Docker Engine and its related packages.

Verify Docker:

```bash
docker --version
```

Check Docker service:

```bash
sudo systemctl status docker
```

---

# 🔄 CI/CD Workflow

The project follows a basic CI/CD workflow:

```text
Developer
    ↓
GitHub Repository
    ↓
Code Change
    ↓
CI/CD Pipeline
    ↓
Build Docker Image
    ↓
Deploy Application
    ↓
AWS EC2
    ↓
Flask Application
```

Whenever changes are pushed to the repository, the CI/CD workflow can be used to automate application deployment.

---

# 🔐 Environment Variables

Sensitive configuration should **not** be stored directly in the source code.

Create a `.env` file when required:

```text
KEY=value
```

The `.env` file should remain outside Git and Docker images.

Make sure `.env` is included in:

```text
.dockerignore
```

and:

```text
.gitignore
```

---

# 🧪 Testing Docker Deployment

After starting the container:

```bash
docker ps
```

Check the application logs:

```bash
docker logs aws-ci-cd-ml-app
```

Test locally on the EC2 server:

```bash
curl http://localhost:8080
```

If the application works locally but cannot be accessed from the internet, check the AWS EC2 Security Group.

---

# 🔥 AWS Security Group

For external access to the Flask application, add an inbound rule for TCP port `8080`.

Example:

```text
Type: Custom TCP
Port: 8080
Source: 0.0.0.0/0
```

For production environments, restrict the source IP range where appropriate.

After configuring the Security Group, access the application using:

```text
http://<EC2-PUBLIC-IP>:8080
```

---

# 🧹 Useful Docker Commands

### List Docker images

```bash
docker images
```

### List running containers

```bash
docker ps
```

### List all containers

```bash
docker ps -a
```

### Stop container

```bash
docker stop aws-ci-cd-ml-app
```

### Start container

```bash
docker start aws-ci-cd-ml-app
```

### Remove container

```bash
docker rm aws-ci-cd-ml-app
```

### Remove image

```bash
docker rmi aws-ci-cd-ml-app
```

### Rebuild image

```bash
docker build --no-cache -t aws-ci-cd-ml-app .
```

---

# 📊 Machine Learning Workflow

The ML pipeline follows these major stages:

### 1. Data Ingestion

The dataset is loaded and divided into training and testing data.

### 2. Data Transformation

Data preprocessing is performed using techniques such as:

* Missing value handling
* Feature scaling
* Categorical feature encoding

### 3. Model Training

Multiple Machine Learning algorithms can be trained and evaluated.

Examples include:

* Linear Regression
* Decision Tree
* Random Forest
* K-Nearest Neighbors
* Gradient Boosting
* AdaBoost
* CatBoost
* XGBoost

### 4. Model Evaluation

The trained models are evaluated using appropriate regression metrics.

### 5. Model Serialization

The trained model and preprocessing objects are saved using `dill`.

### 6. Flask Integration

The saved model is loaded by the Flask application and used to generate predictions.

---

# 🎯 Project Goals

The main goals of this project are:

* Build an end-to-end Machine Learning pipeline.
* Create a Flask-based prediction application.
* Containerize the application using Docker.
* Deploy the application on AWS EC2.
* Implement GitHub-based version control.
* Establish a CI/CD-oriented deployment workflow.
* Practice real-world MLOps concepts.

---

# 🔮 Future Improvements

Possible improvements include:

* Automated model retraining
* Model monitoring
* Automated testing
* Docker image versioning
* AWS ECR integration
* AWS CodePipeline automation
* AWS CodeBuild integration
* HTTPS using a domain and reverse proxy
* Application monitoring and logging
* CloudWatch integration
* Production WSGI server such as Gunicorn

---

# 👨‍💻 Author

**Bharat Kumar**

GitHub:

https://github.com/bharat-02

Project Repository:

https://github.com/bharat-02/AWS-CI-CD-project

---

# 📜 License

This project is licensed under the terms specified in the `LICENSE` file.
