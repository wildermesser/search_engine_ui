FROM python:3.6
COPY requirements.txt .
RUN pip install -r requirements.txt
WORKDIR /ui
COPY ui .
ENV MONGO=mongodb
ENV MONGO_PORT=27017
ENV FLASK_APP=ui.py
CMD ["gunicorn", "ui:app", "-b 0.0.0.0"]
