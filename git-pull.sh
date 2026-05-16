#!/bin/bash
read -p "Git branch name: " branch
#===copy project
cp -r /root/real_life_bash_project/* /root/github/

#====directory change======
cd /root/github/

#===git commands========
git add .

git commit -m "Bash real life project"

git push origin $branch
