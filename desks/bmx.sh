# bmx.sh
#
# Description: Handy functions when working with Bluemix
#

source "$HOME/.bluemix_exports"

# Login to IBM Bluemix account on the Sandbox space (US South)
go_ibm_sandbox_US() {
  bx logout
  bx api https://api.ng.bluemix.net
  bx login -u "$IBMBM_USER" -p "$IBMBM_PASSWORD" -o "tinylab" -s Sandbox_US
}

# Login to IBM Bluemix account on the Development space (US South)
go_ibm_development_US() {
  bx logout
  bx api https://api.ng.bluemix.net
  bx login -u "$IBMBM_USER" -p "$IBMBM_PASSWORD" -o "tinylab" -s Development_US
}

# Login to IBM Bluemix account on the Production space (US South)
go_ibm_production_US() {
  bx logout
  bx api https://api.ng.bluemix.net
  bx login -u "$IBMBM_USER" -p "$IBMBM_PASSWORD" -o "tinylab" -s Production_US
}

# Login to IBM Bluemix account on the Sandbox space (UK)
go_ibm_sandbox_UK() {
  bx logout
  bx api https://api.eu-gb.bluemix.net
  bx login -u "$IBMBM_USER" -p "$IBMBM_PASSWORD" -o "tinylab" -s Sandbox_UK
}

# Login to IBM Bluemix account on the Development space (UK)
go_ibm_development_UK() {
  bx logout
  bx api https://api.eu-gb.bluemix.net
  bx login -u "$IBMBM_USER" -p "$IBMBM_PASSWORD" -o "tinylab" -s Development_UK
}

# Login to IBM Bluemix account on the Production space (UK)
go_ibm_production_UK() {
  bx logout
  bx api https://api.eu-gb.bluemix.net
  bx login -u "$IBMBM_USER" -p "$IBMBM_PASSWORD" -o "tinylab" -s Production_UK
}

# Login to IBM Bluemix account on the Sandbox space (AUS)
go_ibm_sandbox_AUS() {
  bx logout
  bx api https://api.au-syd.bluemix.net
  bx login -u "$IBMBM_USER" -p "$IBMBM_PASSWORD" -o "tinylab" -s Sandbox_AUS
}

# Login to IBM Bluemix account on the Development space (AUS)
go_ibm_development_AUS() {
  bx logout
  bx api https://api.au-syd.bluemix.net
  bx login -u "$IBMBM_USER" -p "$IBMBM_PASSWORD" -o "tinylab" -s Development_AUS
}

# Login to IBM Bluemix account on the Production space (AUS)
go_ibm_production_AUS() {
  bx logout
  bx api https://api.au-syd.bluemix.net
  bx login -u "$IBMBM_USER" -p "$IBMBM_PASSWORD" -o "tinylab" -s Production_AUS
}

# Login to the tinylab Bluemix account on the dev space (US South)
go_tinylab_dev() {
  bx logout
  bx api https://api.ng.bluemix.net
  bx login -u "$TINYLAB_USER" -p "$TINYLAB_PASSWORD" -o "tinylab.info" -s dev
  bx list
}

# Login to the tinylab Bluemix account on the tinylab_us space (US South)
go_tinylab_us() {
  bx logout
  bx api https://api.ng.bluemix.net
  bx login -u "$TINYLAB_USER" -p "$TINYLAB_PASSWORD" -o "ryan_tinylab" -s tinylab_us
  bx list
}

# Generate the hugo static files for blog.tinylab.info and push them to Bluemix to kick off an automatic deploy.
deploy_tinylab_blog() {
  cd $HOME/Repos/bluemix/blog_tinylab
  hugo -t nofancy
  git add -A
  git commit -m "Automated build on `date`"
  git push
}

# Log in to all spaces and accounts and get rid of old routes
clear_orphaned_routes() {
go_ibm_sandbox_US && cf delete-orphaned-routes -f
go_ibm_development_US && cf delete-orphaned-routes -f
go_ibm_production_US && cf delete-orphaned-routes -f
go_ibm_sandbox_UK && cf delete-orphaned-routes -f
go_ibm_development_UK && cf delete-orphaned-routes -f
go_ibm_production_UK && cf delete-orphaned-routes -f
go_ibm_sandbox_AUS && cf delete-orphaned-routes -f
go_ibm_development_AUS && cf delete-orphaned-routes -f
go_ibm_production_AUS && cf delete-orphaned-routes -f
go_tinylab_dev && cf delete-orphaned-routes -f
go_tinylab_us && cf delete-orphaned-routes -f
}

# Log in to all spaces and accounts and list routes
list_routes() {
  go_ibm_sandbox_US && cf routes
  go_ibm_development_US && cf routes
  go_ibm_production_US && cf routes
  go_ibm_sandbox_UK && cf routes
  go_ibm_development_UK && cf routes
  go_ibm_production_UK && cf routes
  go_ibm_sandbox_AUS && cf routes
  go_ibm_development_AUS && cf routes
  go_ibm_production_AUS && cf routes
  go_tinylab_dev && cf routes
  go_tinylab_us && cf routes
}

# Log in to all spaces and accounts and list apps
list_apps() {
  go_ibm_sandbox_US && bx app list
  go_ibm_development_US && bx app list
  go_ibm_production_US && bx app list
  go_ibm_sandbox_UK && bx app list
  go_ibm_development_UK && bx app list
  go_ibm_production_UK && bx app list
  go_ibm_sandbox_AUS && bx app list
  go_ibm_development_AUS && bx app list
  go_ibm_production_AUS && bx app list
  go_tinylab_dev && bx app list
  go_tinylab_us && bx app list
}
