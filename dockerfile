FROM python:3.10.4-alpine

RUN mkdir /home/unwritten
WORKDIR /home/unwritten

RUN pip install --upgrade pip 

COPY ./requirements.txt /home/unwritten
RUN pip install -r requirements.txt

COPY ./ /home/unwritten

RUN python manage.py migrate

EXPOSE 8000

ENTRYPOINT ["python","manage.py","runserver","0.0.0.0:8000"]