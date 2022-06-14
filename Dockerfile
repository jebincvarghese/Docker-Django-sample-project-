FROM python:3.7.3-alpine

RUN mkdir /app
WORKDIR /app
COPY requirements.txt .
RUN pip install  pip
RUN pip install -U setuptools
RUN pip install -r requirements.txt

COPY . .

RUN python /app/manage.py collectstatic --no-input 
RUN python /app/manage.py makemigrations 
RUN python /app/manage.py migrate

EXPOSE 80

ENTRYPOINT ["python", "/app/manage.py", "runserver", "0.0.0.0:80"]
