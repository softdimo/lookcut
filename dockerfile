FROM node:lts-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN mkdir -p android/app/src/main/assets

RUN npm run build

EXPOSE 8082
EXPOSE 5544

CMD ["/opt/android-sdk/emulator/emulator", "-avd", "S23_API_33", "-no-window", "-no-audio", "&", "npm", "start"]