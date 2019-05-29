FROM python:3.7-alpine

EXPOSE 5000

WORKDIR /app

COPY requirements.txt /app

RUN pip install --no-cache-dir -r requirements.txt

COPY *.py /app/

CMD gunicorn main:app -b 0.0.0.0:5000
