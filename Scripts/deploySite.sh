#
SOURCE=/tmp/hugo-public/
TARGET=/home/psmith/NAS/Programming/Websites-live/petersmith.org/
PETERHOME=/home/psmith/NAS/Programming/Websites-source/petersmith
#
# Goto the home directory
cd $PETERHOME

echo Source: $SOURCE
echo Target: $TARGET
#
# make the sites
#
echo Removing old generation of site
rm -fr $SOURCE


echo Generating the site
hugo --verbose

#
# deploy the site
#

echo Deploying the site locally
rsync -v -r -c -p -t $SOURCE $TARGET

echo Deploying the site to AWS
#s3cmd sync -P --delete-removed  $SOURCE  s3://www.petersmith.org/
#aws s3 sync $SOURCE  s3://photos.petersmith.org/  --delete --only-show-error
s3deploy -source=$SOURCE -region=us-west-2  -bucket=www.petersmith.org
