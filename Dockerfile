# Use the official Python image as a base
FROM python:3

# Set the working directory
WORKDIR /data

# Install required dependencies
RUN apt-get update && apt-get install -y python3-distutils

# Install Django
RUN pip install django==3.2

# Copy the current directory contents into the container
COPY . .

# Run migrations (this step requires Django and its dependencies to be installed)
RUN python manage.py migrate

# Expose the port that Django will run on
EXPOSE 8000

# Command to run the Django development server
CMD ["python","manage.py","runserver", "0.0.0.0:8000"]

