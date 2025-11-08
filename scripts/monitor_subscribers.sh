#!/bin/bash
# Auto monitor and test subscribers every 30 seconds

echo "=========================================="
echo "  AUTO MONITORING SUBSCRIBERS"
echo "  Press Ctrl+C to stop"
echo "=========================================="
echo ""

while true; do
    clear
    echo "🔄 Testing at: $(date '+%H:%M:%S')"
    echo "=========================================="
    
    /home/tien/CSDLPT/scripts/test_connections.sh
    
    echo ""
    echo "⏳ Next test in 30 seconds..."
    echo "   Press Ctrl+C to stop monitoring"
    
    sleep 30
done
