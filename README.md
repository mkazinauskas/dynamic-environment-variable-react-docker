# dynamic-environment-variable-react-docker
Example how to use dynamic environment variable in react docker application. With this example, you don't need to rebuild docker image, if you want to change environment variables.

# How to start this example
* Run `docker-compose build`
* Run `docker-compose up`
* Access application via browser `http://localhost:3000`

# How this is implemented
This is created via `npx create react app`. `public/index.html` contains line `<script src="/config.js"></script>` in `<head>` tag. This will load prepared `/config.js` file when launched in browser. This contains generated file from `public/config.template.js`. Every time on container startup, shell script from `docker/run.sh` is executed, this code regenerates `/config.js` file from passed variables in `docker-compose` env part.

In application folder, you can see `src/AppConfig.js` file, which contains resolver script to find, which `window.env.REACT_APP_DYNAMIC_NAME` or `process.env.REACT_APP_DYNAMIC_NAME` variable is set. By default `public/config.js` file contains undefined environment variables, so starting without docker container, it will take defined variable from `.env` file. 

`src/App.js` file contains line with dynamically resolved variable `{DYNAMIC_NAME}`.
