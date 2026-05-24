curl -LO https://raw.githubusercontent.com/hajs110208/termux-box64/refs/heads/main/install.sh && chmod +x install.sh && ./install.sh
clear
sleep 2
echo Installing required packages
pkg upgrade -y
pkg i unzip jq -y
sleep 2
echo downloading bds
bash <(curl -sL https://raw.githubusercontent.com/hajs110208/BedrockDedicatedServer-Termux/refs/heads/main/downloadbds.sh)
unzip server.zip -d server
chmod +x $HOME/server/bedrock_server
echo "Done! Now you can start the server by typing cd server && box64 ./bedrock_server"
