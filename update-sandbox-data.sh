#!/usr/bin/env bash


# You should have a ./serviceAccount.json file
# see https://cloud.google.com/docs/authentication/production#auth-cloud-implicit-nodejs

collections=(blog
             partners
             schedule
             sessions
             speakers
             team
             tickets
             videos)

npm run firebase use sandbox-devfestbdm

for col in "${collections[@]}"
do :
  npm run firebase firestore:delete -r -y ${col}
done

npm run firestore:ci:update
