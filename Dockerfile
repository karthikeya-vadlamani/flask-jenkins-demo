# Base Python image
FROM python:3.11-slim

# Set working directory inside container
WORKDIR /app

# Copy requirements first (to leverage caching)
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy rest of the app files
COPY . .

# Expose app port
EXPOSE 5000

# Run the app
CMD ["python", "app.py"]
