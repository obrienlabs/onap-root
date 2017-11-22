#! /bin/bash
ssh root@aai1 -o StrictHostKeyChecking=no 'docker ps'
ssh root@aai2 -o StrictHostKeyChecking=no 'docker ps'
ssh root@appc -o StrictHostKeyChecking=no 'docker ps'
ssh root@dcae -o StrictHostKeyChecking=no 'docker ps'
ssh root@mr -o StrictHostKeyChecking=no 'docker ps'
ssh root@mso -o StrictHostKeyChecking=no 'docker ps'
ssh root@policy -o StrictHostKeyChecking=no 'docker ps'
ssh root@portal -o StrictHostKeyChecking=no 'docker ps'
ssh root@robot -o StrictHostKeyChecking=no 'docker ps'
ssh root@sdc -o StrictHostKeyChecking=no 'docker ps'
ssh root@sdnc -o StrictHostKeyChecking=no 'docker ps'
ssh root@vid -o StrictHostKeyChecking=no 'docker ps'


