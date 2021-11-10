FROM alpine/git:v2.32.0 as clone

WORKDIR /nodecg

RUN git clone https://github.com/nodecg/nodecg.git -b v1.8.1 --depth 1 /nodecg

FROM node:16.9.1-alpine3.11

WORKDIR /nodecg

COPY --from=clone /nodecg/ /nodecg/
RUN npm i

# NodeCG web port
EXPOSE 9090

# Node.js inspect port
EXPOSE 9229

CMD [ "npm", "run", "start" ]
