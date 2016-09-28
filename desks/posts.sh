# posts.sh
# 
# Description: Handy functions when writing new blog/work posts 
#

# Create a new working dir for the post. Include a subfolder for images
new_dir() { 
  cd $HOME/Desktop/work_in_progress
  mkdir -p "$@"/images 
  touch "$@"/outline.md
  touch "$@"/"$@"_draft1.md
}

# Open up the work_in_progress folder in atom   
edit_posts() { 
  cd $HOME/Desktop/work_in_progress
  atom . 
}
