#!/bin/bash

# FarmAura Auto Detect Server Startup Script
# ==========================================

echo "🌾 FarmAura Auto Detect Server"
echo "================================"
echo ""

# Check if virtual environment exists
if [ ! -d "venv" ]; then
    echo "❌ Virtual environment not found!"
    echo "Creating virtual environment..."
    python3 -m venv venv
    echo "✅ Virtual environment created"
    echo ""
fi

# Activate virtual environment
echo "🔧 Activating virtual environment..."
source venv/bin/activate

# Check if dependencies are installed
if ! python -c "import flask" 2>/dev/null; then
    echo "📦 Installing dependencies..."
    pip install -r requirements.txt
    echo "✅ Dependencies installed"
    echo ""
fi

# Check if .env file exists
if [ ! -f "../.env" ]; then
    echo "⚠️  Warning: .env file not found in parent directory"
    echo "Please ensure GEMINI_API_KEY is set"
    echo ""
fi

# Start the server
echo "🚀 Starting FarmAura Auto Detect API..."
echo "Server will be available at: http://localhost:5000"
echo ""
echo "Press Ctrl+C to stop the server"
echo "================================"
echo ""

# Set port to 5001 to avoid conflict with AirPlay Receiver (port 5000)
export PORT=5001

python app.py
