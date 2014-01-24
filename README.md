About
=====

**svn-to-git-migrator** download and migrate an [SVN](http://pt.wikipedia.org/wiki/Subversion) repository into a certain [Git](http://git-scm.com) repository, keeping all history.

This is useful if you want to migrate one of your old SVN repositories.

Don't worry that this script will **never** change or delete files from your original repository. You will have to delete the files from your original repository later if you want.

Usage
=====

Clone this repository and run *git-repository-extractor.sh*:

	$ git clone https://github.com/helmedeiros/svn-to-git-migrator.git  
	$ cd ./svn-to-git-migrator.sh 
	$ ./svn-to-git-migrator.sh [project_owner] [project_name]

Example:

	$ ./svn-to-git-migrator.sh "helmedeiros" "kanban-task-gen"  

After you run it
================

A directory should have been created under the current directory, which will be a full rewritten git repository named after the original directory. You can rename it to whatever you want, then push it to a new separate repository on Github that you will have to create:

	$ mv ./kanban-task-gen ./my_post_its
	$ cd ./my_post_its
	$ git remote add origin git@github.com:helmedeiros/my_post_its.git
	$ git push -u origin master