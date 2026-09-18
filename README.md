# Student Exam Performance Predictor

### End-to-End Machine Learning Application | Flask | Docker | AWS EC2

An end-to-end Machine Learning application that predicts student mathematics performance using demographic and academic features. The project demonstrates the complete workflow from **data preprocessing and model training to Flask-based inference, Docker containerization, and AWS EC2 deployment**.

---

## 🌐 Live Application

### [🚀 Open Student Exam Performance Predictor](http://13.51.195.253:8080/)

> Deployed on AWS EC2 Ubuntu and running inside a Docker container.

---

## 📌 Overview

The **Student Exam Performance Predictor** is a web-based Machine Learning application designed to predict a student's mathematics score based on demographic and academic information.

### Input Features

* Gender
* Race/Ethnicity
* Parental Level of Education
* Lunch Type
* Test Preparation Course
* Reading Score
* Writing Score

### Output

The trained Machine Learning model predicts the student's:

**Mathematics Score**

---

## 🏗️ System Architecture

```text
                         ┌──────────────────┐
                         │     Dataset      │
                         └────────┬─────────┘
                                  │
                                  ▼
                         ┌──────────────────┐
                         │  Data Ingestion  │
                         └────────┬─────────┘
                                  │
                                  ▼
                       ┌─────────────────────┐
                       │ Data Transformation │
                       │                     │
                       │ • Imputation        │
                       │ • Scaling           │
                       │ • Encoding          │
                       └────────┬────────────┘
                                │
                                ▼
                       ┌─────────────────────┐
                       │ Model Training &    │
                       │ Evaluation          │
                       └────────┬────────────┘
                                │
                                ▼
                    ┌──────────────────────────┐
                    │    Serialized Models     │
                    │                          │
                    │       model.pkl          │
                    │    preprocessor.pkl      │
                    └────────────┬─────────────┘
                                 │
                                 ▼
                         ┌──────────────────┐
                         │   Flask Web App  │
                         │      app.py      │
                         └────────┬─────────┘
                                  │
                                  ▼
                         ┌──────────────────┐
                         │ Docker Container │
                         └────────┬─────────┘
                                  │
                                  ▼
                         ┌──────────────────┐
                         │     AWS EC2      │
                         │      Ubuntu      │
                         └────────┬─────────┘
                                  │
                                  ▼
                         ┌──────────────────┐
                         │    Web Browser   │
                         │    Port 8080     │
                         └──────────────────┘
```

---

## 🛠️ Technology Stack

### Programming & Machine Learning

<p align="left">
  <img src="https://skillicons.dev/icons?i=python" width="50" alt="Python"/>
  <img src="https://skillicons.dev/icons?i=numpy" width="50" alt="NumPy"/>
  <img src="https://skillicons.dev/icons?i=pandas" width="50" alt="Pandas"/>
  <img src="https://skillicons.dev/icons?i=sklearn" width="50" alt="Scikit-learn"/>
</p>

**Python · NumPy · Pandas · Scikit-learn · CatBoost · XGBoost**

### Web Development

<p align="left">
  <img src="https://skillicons.dev/icons?i=flask" width="50" alt="Flask"/>
  <img src="https://skillicons.dev/icons?i=html" width="50" alt="HTML"/>
  <img src="https://skillicons.dev/icons?i=bootstrap" width="50" alt="Bootstrap"/>
</p>

**Flask · HTML · Bootstrap · Jinja2**

### Data Visualization

<p align="left">
  <img src="https://skillicons.dev/icons?i=matplotlib" width="50" alt="Matplotlib"/>
</p>

**Matplotlib · Seaborn**

### Deployment & DevOps

<p align="left">
  <img src="https://skillicons.dev/icons?i=docker" width="50" alt="Docker"/>
  <img src="https://skillicons.dev/icons?i=aws" width="50" alt="AWS"/>
  <img src="https://skillicons.dev/icons?i=linux" width="50" alt="Linux"/>
</p>

**Docker · AWS EC2 · Ubuntu Linux**

### Development & Version Control

<p align="left">
  <img src="https://skillicons.dev/icons?i=git" width="50" alt="Git"/>
  <img src="https://skillicons.dev/icons?i=github" width="50" alt="GitHub"/>
  <img src="https://skillicons.dev/icons?i=vscode" width="50" alt="VS Code"/>
  <img src="https://skillicons.dev/icons?i=jupyter" width="50" alt="Jupyter"/>
</p>

**Git · GitHub · VS Code · Jupyter Notebook**

---

## 🔄 Machine Learning Workflow

### 1. Data Ingestion

The dataset is loaded and divided into training and testing datasets.

### 2. Data Transformation

Separate preprocessing pipelines are applied to numerical and categorical features.

**Numerical Pipeline**

```text
Missing Values
      ↓
Median Imputation
      ↓
Standard Scaling
```

**Categorical Pipeline**

```text
Missing Values
      ↓
Categorical Encoding
      ↓
One-Hot Encoding
```

### 3. Model Training

Multiple regression algorithms are evaluated:

* Linear Regression
* Decision Tree
* Random Forest
* K-Nearest Neighbors
* AdaBoost
* Gradient Boosting
* CatBoost
* XGBoost

### 4. Model Serialization

The trained model and preprocessing pipeline are stored for inference:

```text
artifacts/
├── model.pkl
└── preprocessor.pkl
```

### 5. Prediction

The Flask application loads the serialized model and generates a mathematics score prediction from user input.

---

## 📂 Project Structure

```text
AWS-CI-CD-project/
│
├── artifacts/
│   ├── model.pkl
│   └── preprocessor.pkl
│
├── notebook/
│
├── src/
│   ├── components/
│   │   ├── data_ingestion.py
│   │   ├── data_transformation.py
│   │   └── model_trainer.py
│   │
│   ├── pipeline/
│   │
│   ├── exception.py
│   ├── logger.py
│   └── utils.py
│
├── templates/
│   ├── index.html
│   └── home.html
│
├── app.py
├── Dockerfile
├── requirements.txt
├── setup.py
├── .gitignore
├── LICENSE
└── README.md
```

---

## 🐳 Docker Deployment

### Build Docker Image

```bash
docker build -t fde-project-2:latest .
```

### Run Container

```bash
docker run -d \
  --name fde-project-2 \
  --restart unless-stopped \
  --env-file /home/ubuntu/.env \
  -p 8080:8080 \
  fde-project-2:latest
```

### Check Container

```bash
docker ps
```

### View Logs

```bash
docker logs --tail 100 fde-project-2
```

---

## ☁️ AWS EC2 Deployment

The application is deployed on an AWS EC2 Ubuntu server using Docker.

### Deployment Configuration

| Component        | Configuration |
| ---------------- | ------------- |
| Cloud Provider   | AWS           |
| Compute Service  | EC2           |
| Operating System | Ubuntu        |
| Application      | Flask         |
| Containerization | Docker        |
| Application Port | `8080`        |

### Verify Deployment

Run on the EC2 instance:

```bash
curl http://localhost:8080/
```

Expected response:

```text
HTTP/1.1 200 OK
```

### Public Endpoint

```text
http://13.51.195.253:8080/
```

> The current public IP belongs to the EC2 instance and may change if the instance is stopped and restarted. For a permanent URL, an Elastic IP or domain name should be used.

---

## 🔗 Application Endpoints

| Endpoint       | Description                         |
| -------------- | ----------------------------------- |
| `/`            | Application landing page            |
| `/predictdata` | Student performance prediction page |

---

## 🔐 Security

Sensitive credentials and configuration values are kept outside the Git repository.

The EC2 deployment uses:

```text
/home/ubuntu/.env
```

The following types of information should never be committed to GitHub:

* AWS credentials
* API keys
* Passwords
* Secret tokens
* Private configuration

The `.env` file is excluded using `.gitignore`.

---

## 📈 Key Features

* End-to-end Machine Learning pipeline
* Automated data preprocessing
* Multiple regression model evaluation
* Serialized model and preprocessing pipeline
* Flask-based prediction interface
* Docker containerization
* AWS EC2 deployment
* Linux server deployment
* Git and GitHub version control

---

## 🔮 Future Improvements

* Automated CI/CD pipeline
* Unit and integration testing
* Model monitoring
* Structured application logging
* HTTPS configuration
* Custom domain
* AWS Elastic IP
* Production-grade reverse proxy
* Improved frontend design
* Input validation and error handling

---

## 👨‍💻 Author

### Bharat Kumar

**Machine Learning Developer | Python | AI**

<p align="left">
  <a href="https://github.com/bharat-02">
    <img src="https://skillicons.dev/icons?i=github" width="45" alt="GitHub"/>
  </a>
</p>

**GitHub:** [bharat-02](https://github.com/bharat-02)

**Project Repository:** [AWS-CI-CD-project](https://github.com/bharat-02/AWS-CI-CD-project)

---

## 📄 License

This project is licensed under the **MIT License**. See the `LICENSE` file for details.
