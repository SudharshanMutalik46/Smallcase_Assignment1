FROM python:3.9

COPY ./app.py /app/

WORKDIR /app

RUN pip install flask

EXPOSE 8081

CMD ["python", "app.py"]
