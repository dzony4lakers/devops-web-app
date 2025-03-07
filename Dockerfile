# Use an official Python 3.10 runtime as the base image
FROM python:3.10-slim

# Set the working directory inside the container
WORKDIR /devops-project

# Copy the requirements file into the container
COPY requirements.txt .

# Install the dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY . .

# Expose the port the app runs on
EXPOSE 5000

# Define the command to run the application
CMD ["python", "app.py"]
