FROM python:2.7.14-slim

RUN apt-get update && apt-get install -y \
    build-essential

WORKDIR /app
ADD requirements.txt .
RUN pip install -r requirements.txt

# move relevant files
ADD app.py .
ADD todos_store.py .
ADD static/ ./static

# COPY config file
COPY appdynamics.cfg /appdynamics.cfg

# COPY startup script
COPY startup.sh /startup.sh
RUN chmod +x /startup.sh

#ENV FLASK_APP "app.py"
#CMD ["python", "app.py"]
ENTRYPOINT ["/startup.sh"]

