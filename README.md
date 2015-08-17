#Bash completion like on a MacBook

MacBooks ship with rather outdated versions of **bash** and **bash-completion**:

```shell
bash version:
GNU bash, version 3.2.57(1)-release (x86_64-apple-darwin14)

bash-completion
Version: 1.3
```

See http://meta.ath0.com/2012/02/05/apples-great-gpl-purge/ for more information.

Use this Docker image if you want to test your bash completion scripts against these ancient versions but do not have a Mac available.

How to use
--------------
Start a container with your completion script mounted into `/etc/bash_completion.d/`, e.g.

    docker run -i -t -v /path/to/completion-script:/etc/bash_completion.d/completion-script albers/bash-completion-mac

_Note: You can develop command completion for a program that you do not have installed. Just type its name. Completion doesn't care if it actually exists._
