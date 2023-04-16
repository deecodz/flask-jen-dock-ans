# From Base Image 
FROM python:3-alpine3.15

# Create working directory
WORKDIR /app

# Copy Data into dir
COPY requirements.txt . /app

# Install pip
RUN pip install -r requirements.txt

# Copy flask app file
COPY main.py . /app 

# Adding port 
EXPOSE 5000

# Adding a command to run python file
CMD python ./main.py 
