FROM python:3.10-slim-bookworm
WORKDIR /app
COPY . /app

RUN apt update -y && apt install awscli -y
RUN apt-get update && apt-get install ffmpeg libsm6 libxext6 unzip -y
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

CMD ["python", "app.py"]