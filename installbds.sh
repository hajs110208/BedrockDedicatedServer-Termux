curl -LO https://raw.githubusercontent.com/hajs110208/termux-box64/refs/heads/main/install.sh && chmod +x install.sh && ./install.sh
clear
sleep 2
echo installing unzip
pkg upgrade -y
pkg i unzip -y
sleep 2
echo downloading bds
wget -O server.zip https://www.minecraft.net/bedrockdedicatedserver/bin-linux/bedrock-server-1.26.2.1.zip
unzip server.zip -d server
chmod +x $HOME/server/bedrock_server
echo "done! now you can start the server by typing cd server && box64 ./bedrock_server"
