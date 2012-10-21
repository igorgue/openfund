# OpenFund
Selfstarter makes it easy to roll your own crowdfunding site. To get started, fork this repository and change around ```config/settings.yml``` to suit your needs.

[See it in action](http://selfstarter.us)

## Homebrew Installation

Grab homebrew to install extraproject dependencies

```bash
ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"
```

Please note, you might not have the necessary compilers & may have to download XCode + XCode command line tools from [developer.apple.com](https://developer.apple.com/).

Update homebrew

```bash
brew update
```

Install mysql

```bash
brew install mysql
```

& git if you dont have it.

```bash
brew install git
```

& imagemagick (for use by paperclip)

```bash
brew install imagemagick
```

## RVM + Ruby + Rails dependency Installation

Grab RVM. Here is the [rvm site](https://rvm.io/) 

```bash
\curl -L https://get.rvm.io | bash -s stable --ruby
```

Install ruby 1.9.2

```bash
rvm install 1.9.2
```

Clone the openfund repo

```bash
git clone git@github.com:igorgue/openfund.git
```

Create your .rvmrc file in the openfund directory, it should contain the following

```bash
rvm 1.9.2@openfund
```

Now make sure you're using ruby 1.9.2

```bash
rvm use 1.9.2
```

Alright, now create the gemset

```bash
rvm gemset create openfund
```

Now make sure you are in your openfund directory & source your .rvmrc file

```bash
cd /path/to/openfund/ && source .rvmrc
```

you should get this sort of output

```bash
====================================================================================
= NOTICE                                                                           =
====================================================================================
= RVM has encountered a new or modified .rvmrc file in the current directory       =
= This is a shell script and therefore may contain any shell commands.             =
=                                                                                  =
= Examine the contents of this file carefully to be sure the contents are          =
= safe before trusting it! ( Choose v[iew] below to view the contents )            =
====================================================================================
Do you wish to trust this .rvmrc file? (/Users/austonbunsen/Sites/bootstrap/.rvmrc)
y[es], n[o], v[iew], c[ancel]> 
```

Hit y+enter. Now run 

```bash
bundle install
```

Next create the database

```bash
rake db:create
```

and migrate it

```bash
rake db:migrate
```

and seed it

```bash
rake db:seed
```

Finally you can run our app

```bash
rails server
```


```bash
ruby-1.9.2-p320@openfund
```