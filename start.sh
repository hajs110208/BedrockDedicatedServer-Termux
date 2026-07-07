cd "$HOME"

if ! [ -f "$HOME/.config/bds" ]; then
    echo "No config file! Generating new config file."
    mkdir -p "$HOME/.config"
    
    read -p "Choose launch mode: screen, normal (Default / Recommended: screen): " MODE
    case "$MODE" in
        normal)
            echo "normal" > "$HOME/.config/bds"
            ;;
        screen|*)
            echo "screen" > "$HOME/.config/bds"
            ;;
    esac
fi

if grep -q "screen" "$HOME/.config/bds"; then
    cd server
    chmod +x bedrock_server 
    screen -d -S server -m box64 ./bedrock_server
    echo "Server started in background. Type screen -r server to access the server console."
elif grep -q "normal" "$HOME/.config/bds"; then
    cd server
    chmod +x bedrock_server
    box64 ./bedrock_server
fi
