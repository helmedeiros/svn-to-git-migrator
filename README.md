About
=====

**svn-to-git-migrator** download and migrate an [SVN](http://pt.wikipedia.org/wiki/Subversion) repository into a certain [Git](http://git-scm.com) repository, keeping all history.

This is useful if you want to migrate one of your old SVN repositories.

Don't worry that this script will **never** change or delete files from your original repository. You will have to delete the files from your original repository later if you want.

Install
=====
Is important to have git and git-svn installed. The svn-to-git-migrator is a shell wrapper around git's native SVN support through git-svn, so please do verify that you can run $ git svn successfully. 

For a OSx system, the installation of those prerequisites looks:

    $ brew install git-core git-svn

Once you have the necessary software on your system, you can clone this repository and run *git-repository-extractor* after add it to your PATH:

1. First, clone down the repository:	

        $ git clone https://github.com/helmedeiros/svn-to-git-migrator.git

2. Next, you need to make the command executable:

        $ chmod +x svn-to-git-migrator

3. To make sure my shell knows where to find svn-to-git-migrator you will need to add the addres from where you've cloned the project to your .bashrc file's PATH variable. Here's how mine looks:

        $ export PATH=${PATH}:/Users/helmed/Projects/workspaceShell/svn-to-git-migrator/

4. Make sure you reload your shell with:

        $ source ~/.bashrc


Usage
=====

There are different ways to use the svn-to-git to create a git repo from an existing svn repo. Once the svn repo could have different layouts, below is an listing of the varying supported layouts and the how to apply their migration.

1. The svn repo is in the standard layout of (trunk, branches, tags) at the root level of the repo.

        $ svn-to-git-migrator https://svn.example.com/path/to/repo

2. The svn repo is NOT in standard layout and has only a trunk at the root level of the repo.

        $ svn-to-git-migrator https://svn.example.com/path/to/repo --trunk dev

3. The svn repo is password protected

        $ svn-to-git-migrator https://svn.example.com/path/to/repo --username <<user_with_perms>>

After you run it
================

A directory should have been created under the current directory, which will be a full rewritten git repository named after the original directory. You can rename it to whatever you want, then push it to a new separate repository on Github that you will have to create:

	$ mv ./repo ./git_repo
	$ cd ./git_repo
	$ git remote add origin git@github.com:helmedeiros/git_repo.git
	$ git push -u origin master
