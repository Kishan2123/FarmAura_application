#!/bin/bash

# FarmAura Auto Detect Server Startup Script
# ==========================================

PORT=5001

echo "🌾 FarmAura Auto Detect Server"
echo "================================"
echo ""

# Function to handle errors
handle_error() {
    echo "❌ Error: $1"
    exit 1
}

# Check for Python
if ! command -v python3 &> /dev/null; then
    handle_error "Python 3 is not installed or not in PATH."
fi

# Check if virtual environment exists
if [ ! -d "venv" ]; then
    echo "❌ Virtual environment not found!"
    echo "Creating virtual environment..."
    python3 -m venv venv || handle_error "Failed to create virtual environment."
    echo "✅ Virtual environment created"
    echo ""
fi

# Activate virtual environment
echo "🔧 Activating virtual environment..."
source venv/bin/activate || handle_error "Failed to activate virtual environment."

# Check if dependencies are installed
if ! python -c "import flask" 2>/dev/null; then
    echo "📦 Installing dependencies..."
    pip install -r requirements.txt || handle_error "Failed to install dependencies."
    echo "✅ Dependencies installed"
    echo ""
fi

# Check if .env file exists
if [ ! -f "../.env" ]; then
    echo "⚠️  Warning: .env file not found in parent directory"
    echo "Please ensure GEMINI_API_KEY is set"
    echo ""
fi

# Check if port is in use
if lsof -i :$PORT >/dev/null; then
    PID=$(lsof -ti :$PORT)
    echo "⚠️  Port $PORT is already in use by process $PID."
    echo "🔄 Killing process $PID to free up port $PORT..."
    kill -9 $PID 2>/dev/null
    sleep 1
    
    # Double check
    if lsof -ti :$PORT >/dev/null; then
        handle_error "Failed to free port $PORT. Please manually kill the process."
    else
        echo "✅ Port $PORT freed."
    fi
    echo ""
fi

# Start the server
echo "🚀 Starting FarmAura Auto Detect API..."
echo "Server will be available at: http://localhost:$PORT"
echo ""
echo "Press Ctrl+C to stop the server"
echo "================================"
echo ""

export PORT=$PORT
python app.py
