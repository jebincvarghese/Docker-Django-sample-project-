FROM python:3.7.3-alpine
RUN mkdir /app
WORKDIR /app
COPY requirements.txt .
RUN apk add --no-cache curl make gcc libc-dev musl-dev tk-dev tcl-dev openssl-dev libffi-dev mysql-client mariadb-dev python3-dev jpeg-dev zlib-dev freetype-dev lcms2-dev tiff-dev openjpeg-dev
RUN pip install --upgrade pip 
RUN pip install -U setuptools
RUN pip install -r requirements.txt
COPY . .
RUN python /app/manage.py collectstatic --no-input 
RUN python /app/manage.py makemigrations 
RUN python /app/manage.py migrate

ENTRYPOINT ["python", "/app/manage.py", "runserver", "0.0.0.0:8082"]

