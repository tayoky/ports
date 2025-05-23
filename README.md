# stanix's packages
this repo contain the portages and packages of the stanix operating system  
to get info about a particular package just do 
```sh
./info.sh XXX
```
## build
to build a package just do
```sh
./configure
./build.sh XXX
```
NOTE : see [configure options](#configure-options)
## install and packages
to install a port do
```sh
./install.sh XXX
```
and to make a package
```sh
./package.sh XXX
```
NOTE : packages are avalibes in ./packages/ as tar archives
## list
list of all avalibles packages and their status
- tsh : 100% work with all features enable
- tutils : fully working
- doomgeneric : start but crash at some point (very buggy)
- binutils : can make executable for stanix but can't run on it
- tlibc (not present on this repo) : stable
# configure options
- `--host=XXX`
- `--prefix=XXX`
- `--with-CC=XXX`
- `--with-LD=XXX`
