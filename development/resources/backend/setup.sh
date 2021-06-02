#!/bin/bash
apt update
apt install -y libtool
git clone https://github.com/kapraokaidao/healthcare.git
curl -fsSL https://deb.nodesource.com/setup_14.x | sudo -E bash -
apt install -y nodejs
npm install -g yarn
cp .env ./healthcare/backend/healthcare/.env
cd healthcare/backend/healthcare
yarn install
yarn build
yarn start:prod &