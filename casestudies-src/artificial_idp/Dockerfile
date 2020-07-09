FROM python:3.6
ENV MONGO_HOST mongo

COPY . /app
WORKDIR /app
RUN pip install -r requirements.txt
CMD "python main.py --init && python main.py --ssl --port 443"
