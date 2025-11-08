#!/bin/bash
# Script tự động update IP trong các file Replication

PUBLISHER_IP="100.71.73.74"

echo "=========================================="
echo "  UPDATE REPLICATION SCRIPTS"
echo "=========================================="
echo ""
echo "Publisher IP: $PUBLISHER_IP"
echo ""

# Backup files trước
echo "📦 Backing up original files..."
cp /home/tien/CSDLPT/replication/01_Setup_Distributor.sql /home/tien/CSDLPT/replication/01_Setup_Distributor.sql.backup
cp /home/tien/CSDLPT/replication/02_Create_Publication.sql /home/tien/CSDLPT/replication/02_Create_Publication.sql.backup 2>/dev/null
cp /home/tien/CSDLPT/replication/Subscriber_Setup.sql /home/tien/CSDLPT/replication/Subscriber_Setup.sql.backup 2>/dev/null

# Update 01_Setup_Distributor.sql
echo "📝 Updating 01_Setup_Distributor.sql..."
sed -i "s/100\.64\.0\.1/$PUBLISHER_IP/g" /home/tien/CSDLPT/replication/01_Setup_Distributor.sql
sed -i "s/100\.74\.240\.106/$PUBLISHER_IP/g" /home/tien/CSDLPT/replication/01_Setup_Distributor.sql

# Update 02_Create_Publication.sql if exists
if [ -f /home/tien/CSDLPT/replication/02_Create_Publication.sql ]; then
    echo "📝 Updating 02_Create_Publication.sql..."
    sed -i "s/100\.64\.0\.1/$PUBLISHER_IP/g" /home/tien/CSDLPT/replication/02_Create_Publication.sql
    sed -i "s/100\.74\.240\.106/$PUBLISHER_IP/g" /home/tien/CSDLPT/replication/02_Create_Publication.sql
fi

# Update Subscriber_Setup.sql if exists
if [ -f /home/tien/CSDLPT/replication/Subscriber_Setup.sql ]; then
    echo "📝 Updating Subscriber_Setup.sql..."
    sed -i "s/100\.64\.0\.1/$PUBLISHER_IP/g" /home/tien/CSDLPT/replication/Subscriber_Setup.sql
    sed -i "s/100\.74\.240\.106/$PUBLISHER_IP/g" /home/tien/CSDLPT/replication/Subscriber_Setup.sql
fi

echo ""
echo "✅ Updated all replication scripts!"
echo ""
echo "📋 Files updated:"
ls -lh /home/tien/CSDLPT/replication/*.sql | grep -v backup

echo ""
echo "=========================================="
echo "  READY FOR REPLICATION SETUP"
echo "=========================================="
