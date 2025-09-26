FROM ubuntu:latest
LABEL authors="Siddharth"

ENTRYPOINT ["top", "-b"]

FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8000

CMD ["uvicorn","mlmodel:app", "--host","0.0.0.0", "--port","8000"]

