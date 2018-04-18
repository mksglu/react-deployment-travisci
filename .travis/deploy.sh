#!/bin/bash
npm run build
cd build && tar cvfz ../build.tar.gz . && cd ..
ssh-keyscan -H $DEPLOY_IP >> ~/.ssh/known_hosts
scp build.tar.gz $DEPLOY_USER@$DEPLOY_IP:$DEPLOY_PATH
ssh $DEPLOY_USER@$DEPLOY_IP "cd $DEPLOY_PATH && tar xvzf build.tar.gz --overwrite"
ssh $DEPLOY_USER@$DEPLOY_IP "cd $DEPLOY_PATH && rm -rf build.tar.gz"
