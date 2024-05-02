FROM ubuntu

# build index.js 
COPY index.js /index.js

# install nodejs
RUN apt-get update
RUN apt-get install -y nodejs
RUN apt-get install -y npm

# run index.js
CMD ["node", "/index.js"]
