# pseudo-loc

This tool generates pseudo-localized versions of your string resource json files.

## Build

```
gem build pseudo-loc
```

## Installation

```
gem install pseudo-loc
```

## Usage

```
$ cd ~/project/source/locales/en

$ pseudo-loc.rb filename1.json filename2.json filename3.json

$ ls -R
filename1.json 
filename2.json 
pseudo

./pseudo:
filename1.json 
filename2.json 

```

