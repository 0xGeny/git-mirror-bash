# Getting Started with Git Mirror Bash

You should change YOUR_KEY, YOUR_NAME and YOUR_EMAIL to yours.

If you don't have key, you should create new key at https://github.com/settings/tokens

And then, please run script on apropriate location.

It will create new repository, and clone original repository.

Then change all history with your name and email.

Finally, push into new repository.

## Available Scripts

In the project directory, you can run:

### `./mirror.sh path`
<path> could include git url (url from web browser) or username/repo

### Examples

./mirror.sh https://github.com/xxx/yyyy<br>
./mirror.sh xxx/yyy


## Multiple Git Repos

You should create a file (e.g. xxx.sh) and type:

./mirror.sh repo1<br>
./mirror.sh repo2<br>
./mirror.sh repo3<br>

Save and run ./xxx.sh on Git Bash

If my script is useful, please don't remember <Star> my project.

Thanks.
