#!/bin/bash
# Script test kết nối tới các máy Windows Subscribers

echo "=========================================="
echo "  TEST CONNECTIONS TO SUBSCRIBERS"
echo "=========================================="
echo ""

# Danh sách IP từ tailscale status
PUBLISHER_IP="100.71.73.74"
SUBSCRIBER_IPS=(
    "100.74.133.70:desktop-171avqp"
    "100.100.210.39:msi"
)

echo "Publisher IP: $PUBLISHER_IP"
echo ""

# Test mỗi subscriber
for entry in "${SUBSCRIBER_IPS[@]}"; do
    IFS=':' read -r IP NAME <<< "$entry"
    echo "=========================================="
    echo "Testing: $NAME ($IP)"
    echo "=========================================="
    
    # Test 1: Ping
    echo "1. Ping test..."
    if ping -c 2 -W 2 "$IP" > /dev/null 2>&1; then
        echo "   ✅ Ping OK"
    else
        echo "   ❌ Ping FAILED"
        continue
    fi
    
    # Test 2: Port 1433
    echo "2. Port 1433 test..."
    if timeout 3 bash -c "cat < /dev/null > /dev/tcp/$IP/1433" 2>/dev/null; then
        echo "   ✅ Port 1433 OPEN"
    else
        echo "   ❌ Port 1433 CLOSED (họ chưa mở firewall)"
        continue
    fi
    
    # Test 3: SQL Connection
    echo "3. SQL Authentication test..."
    RESULT=$(sqlcmd -S "$IP" -U sa -P 'Tt12345@' -C -Q "SELECT @@SERVERNAME AS ServerName;" -h -1 -W 2>&1)
    
    if echo "$RESULT" | grep -q "Login failed\|Cannot open\|Could not open"; then
        echo "   ❌ SQL Login FAILED (họ chưa enable sa hoặc sai password)"
    elif echo "$RESULT" | grep -q "ServerName"; then
        SERVER_NAME=$(echo "$RESULT" | grep -v "^$" | tail -1 | xargs)
        echo "   ✅ SQL Connection OK - Server: $SERVER_NAME"
        
        # Test 4: Database
        echo "4. Database check..."
        DB_CHECK=$(sqlcmd -S "$IP" -U sa -P 'Tt12345@' -C -Q "SELECT name FROM sys.databases WHERE name IN ('QuanLyNhanSu', 'master');" -h -1 -W 2>&1 | grep -v "^$")
        if echo "$DB_CHECK" | grep -q "QuanLyNhanSu"; then
            echo "   ✅ Database QuanLyNhanSu EXISTS (đã restore rồi!)"
        else
            echo "   ⏳ Database QuanLyNhanSu NOT FOUND (chưa restore - OK, mai sẽ replicate)"
        fi
    else
        echo "   ❌ SQL Connection FAILED - Unknown error"
    fi
    
    echo ""
done

echo "=========================================="
echo "  TEST COMPLETED"
echo "=========================================="
echo ""
echo "📋 Next Steps:"
echo "- Nếu Port 1433 closed → Họ cần mở Windows Firewall"
echo "- Nếu SQL login failed → Họ cần enable sa login"
echo "- Nếu tất cả OK → Sẵn sàng cho Replication!"
