# prj.sh
# 
# Description: Setup a working dir for projects (Major work in progress)
#

# Create and change in to the project directory. Specify the project name after issuing set_dir
function set_dir () {
 mkdir $HOME/Projects/"$@"
 cd $HOME/Projects/"$@" && export current_project_dir=$(pwd)
}

# Save the project for later user by adding it to the git repo. Your local editor will open a README.md file so you can add docs
function save_proj () {
 cd $current_project_dir
    $EDITOR README.md
}
