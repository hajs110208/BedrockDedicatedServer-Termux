
JSON="https://net-secondary.web.minecraft-services.net/api/v1.0/download/links"
echo "Available Options:"
echo "1) Latest"
echo "2) Latest Preview"
echo "3) Custom Release"
echo "4) Custom Preview"
read -p "Select an option (default: 1) : " CHOICE

LINK=""
VERSION_TYPE="Latest"

case "$CHOICE" in
    2)
        echo -e "\nSelected: Latest Preview"
        LINK=$(curl -sf "$JSON" | jq -r '.result.links[] | select(.downloadType == "serverBedrockPreviewLinux") | .downloadUrl')
        VERSION_TYPE="Latest Preview"
        ;;
    3)
        echo ""
        read -p "Enter custom release version (e.g., 1.26.21.1): " CUSTOM_VER
        if [ -n "$CUSTOM_VER" ]; then
            LINK="https://www.minecraft.net/bedrockdedicatedserver/bin-linux/bedrock-server-${CUSTOM_VER}.zip"
            VERSION_TYPE="Custom Release ($CUSTOM_VER)"
        fi
        ;;
    4)
        echo ""
        read -p "Enter custom preview version string (e.g., 1.26.30.30): " CUSTOM_VER
        if [ -n "$CUSTOM_VER" ]; then
            LINK="https://www.minecraft.net/bedrockdedicatedserver/bin-linux-preview/bedrock-server-${CUSTOM_VER}.zip"
            VERSION_TYPE="Custom Preview ($CUSTOM_VER)"
        fi
        ;;
    1|*)
        # Default option: Latest Stable from API
        echo -e "\nSelected: Latest"
        LINK=$(curl -sf "$JSON" | jq -r '.result.links[] | select(.downloadType == "serverBedrockLinux") | .downloadUrl')
        VERSION_TYPE="Latest"
        ;;
esac

if [ -z "$LINK" ] || [ "$LINK" = "null" ]; then
    echo "An error occured"
fi

if [ -n "$LINK" ] && [ "$LINK" != "null" ]; then
    echo "Version: $VERSION_TYPE"
    echo "Link: $LINK"
    wget --show-progress -O server.zip "$LINK"
else
    echo "An error occurred while downloading."
    exit 1
fi
