FROM python:3.10-rc-alpine3.13
COPY counter-service.py .
COPY requirements.txt .
VOLUME . .
RUN pip install -r requirements.txt
CMD ["python","counter-service.py"]
