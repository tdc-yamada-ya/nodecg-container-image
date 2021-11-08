FROM node:16.9.1-alpine3.11

WORKDIR /nodecg

RUN apk --no-cache add git=2.24.4-r0 && \
  git clone https://github.com/nodecg/nodecg.git -b v1.8.1 --depth 1 /nodecg

RUN npm i

# NodeCG web port
EXPOSE 9090

# Node.js inspect port
EXPOSE 9229

# NodeCG bundles (https://www.nodecg.dev/docs/creating-bundles)
VOLUME [ "/nodecg/bundles" ]

CMD [ "npm", "run", "start" ]
