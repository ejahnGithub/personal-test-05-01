FROM ubuntu

# build index.js 
COPY src/index.js ./
COPY package.json ./

# install nodejs
RUN apt-get update
RUN apt-get install -y nodejs
RUN apt-get install -y npm


# install nodejs packages
RUN npm install

# run index.js
CMD ["node", "index.js"]