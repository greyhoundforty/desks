# udemy.sh
#
# Description: Scripts and functions when working on Udemy Courses
#

# Switch to my Python Bootcamp coursework dir and start the jupyter notebook
py_go() {
  cd ~/Projects/Udemy_Python_Bootcamp/MyCourseWork/
  nohup jupyter notebook & disown
}
