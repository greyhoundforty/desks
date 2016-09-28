# work.sh
#
# Description: A set of functions to help with common work tasks
#

cd ~/Work
dt=$(date +"%Y%m%d")

# Work on files for the softlayer.github.io site. Example: slghio python
function slghio() {
 cd $HOME/Work/Repos/githubio_source
 noglob git checkout -b "$dt".rt_"$@"
}

# Work on SoftLayer API scripts. Pass an Argument to go to a specific dir. Example: api ruby
function api() {
  cd $HOME/Work/API/"$@"
}

# List all my VSI's on the SE Demo account
function lsvsi() {
  slcli --format raw vs list -D ryantiffany.me
  slcli --format raw vs list -D tinylab.info
  slcli --format raw vs list -D tinylayer.net

}

# List all my Servers on the SE Demo account
function lssrv() {
  slcli --format raw server list -D ryantiffany.me
  slcli --format raw server list -D tinylab.info
  slcli --format raw server list -D tinylayer.net
}

# Set up a new directory for current travel. Used to track receipts.
function track_travel() {
cd "$HOME/Desktop/Receipts/"
mkdir -p "$@" && cd $_
cat <<EOF > Receipt_List.txt
Flight Receipt
Uber Receipts
Hotel Receipt
Meal Receipts
Parking Receipts
Misc Receipts
EOF
}

# Push images to Object storage
push_img() { 
cd "$HOME/Desktop"
swift upload Blog_Images "$@"
echo "![](https://sjc01.objectstorage.softlayer.net/v1/AUTH_03a3077b-870c-4aa6-b560-943620ff64e6/Blog_Images/$_)"
}

# Work on the ElasticSearch Cluster for the deltaNiner project
function searchy() {
  cd "$HOME/Work/Projects/elasticSearchThing"
  cf ic login


}
