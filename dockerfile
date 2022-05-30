FROM python:3.10.4-alpine

RUN mkdir /home/bloggy
WORKDIR /home/bloggy

RUN pip install --upgrade pip 

COPY ./requirements.txt /home/bloggy
RUN pip install -r requirements.txt

COPY ./ /home/bloggy

EXPOSE 8000

ENTRYPOINT ["python","manage.py","runserver","0.0.0.0:8000"]