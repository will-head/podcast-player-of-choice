#!/bin/sh

if [[ "$1" = "production" ]] ; then
  DEPLOY_DIR="podcastplayerofchoice.com"
else
  DEPLOY_DIR="staging.podcastplayerofchoice.com"
fi

echo "Deploying files to server"
echo "[${DEPLOY_DOMAIN}]:${DEPLOY_PORT} ecdsa-sha2-nistp256 ${DEPLOY_KEY}" >> ${HOME}/.ssh/known_hosts
# ssh ${DEPLOY_USER}@${DEPLOY_DOMAIN} -p ${DEPLOY_PORT}
rsync -avP -e "ssh -p ${DEPLOY_PORT}" build/ ${DEPLOY_USER}@${DEPLOY_DOMAIN}:/home/${DEPLOY_USER}/domains/${DEPLOY_DIR}/
echo "Deployment complete"
