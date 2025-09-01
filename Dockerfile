FROM python:3.9-slim

RUN apt-get update && apt-get install -y hmmer

WORKDIR /home/simona/Bakalauras/PROGRAMOS_IR_TT/defense-finder

COPY requirements.txt .

# Install dependencies if required (this assumes there's a requirements.txt file)

RUN pip install -r requirements.txt

COPY . /app

# Copy the sekos.fasta file into the container
COPY sekos.fasta /app/sekos.fasta

# Run the defense-finder tool (replace with actual command if different)
CMD ["python", "defense_finder/__init__.py", "run", "--out-dir", "/app/results", "/app/sekos.fasta"]
