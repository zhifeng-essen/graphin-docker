FROM node:latest
ADD Graphin-1.4.0-graphin.tar.gz /
WORKDIR /Graphin-1.4.0-graphin
RUN sed -i 's/yarn/cnpm/g' lerna.json && npm install -g cnpm --registry=https://registry.npm.taobao.org
RUN cnpm install --save @antv/graphin && cnpm install --save @antv/graphin-components && cnpm i && cnpm run bootstrap
RUN sed -i 's/antd\/es\/Tree/antd\/es\/tree/g' packages/graphin-studio/src/Components/TreeSelector/TreeSelector.tsx
CMD bash -c "nohup cnpm run start &\ 
cnpm run studio"
