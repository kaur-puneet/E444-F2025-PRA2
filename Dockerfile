# Use official Python image (compatible with Apple Silicon)
FROM python:3.12-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set work directory inside the container
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files into the container
COPY flasky/ /app/flasky/

# Expose port 5000
EXPOSE 5000

# Set the default command to run your Flask app
CMD ["flask", "--app", "flasky/hello.py", "run", "--host=0.0.0.0", "--port=5000"]
