echo 'Using configuration template:'
cat /usr/share/nginx/html/config.template.js
echo ''

cp /usr/share/nginx/html/config.template.js /usr/share/nginx/html/config.js

echo 'Configuration before updates:'
cat /usr/share/nginx/html/config.js
echo ''

echo "Replacing REACT_APP_DYNAMIC_NAME to '$REACT_APP_DYNAMIC_NAME'"
sed -i "s|{{REACT_APP_DYNAMIC_NAME}}|$REACT_APP_DYNAMIC_NAME|g" /usr/share/nginx/html/config.js

echo 'Using folowing configuration:'
cat /usr/share/nginx/html/config.js
echo ''

nginx -g 'daemon off;'