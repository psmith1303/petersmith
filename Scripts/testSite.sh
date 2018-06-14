#
echo ==============================================================
echo                  START RUN
echo ==============================================================
#
SOURCE=/tmp/hugo-public/
TARGET=/home/psmith/NAS/Programming/Websites-live/petersmith.org/
#
# test the sites
#
hugo --verbose \
	--watch \
	--theme hugo-news \
	server

