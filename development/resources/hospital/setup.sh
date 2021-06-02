#!/bin/bash
apt update
apt install -y libtool
git clone https://github.com/kapraokaidao/healthcare.git
curl -fsSL https://deb.nodesource.com/setup_14.x | sudo -E bash -
apt install -y nodejs
npm install -g yarn
cp .env ./healthcare/frontend/hospital/.env
cd healthcare/frontend/hospital
install
build
yarn global add serve
serve -s build -l 80 &
