NOW=`date '+%F_%H:%M'`;

cd ~/git/guillaume_blog
git add .
git commit -m "$NOW"
git push
