# github-backup
Small script used to backup GitHub repositories.  
**Note:** This will only work with SBCL.

### Configuration
Configuration is located at the top of `github-backup.lisp`
Backup directory defaults to $HOME/src/backups.  
GitHub API token is loaded from $HOME/.ghbk 

### Dependencies
> iterate  
> cl-fad  
> cl-github-v3

