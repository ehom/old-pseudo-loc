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
$ pseudo-loc.rb filename1.json filename2.json 
```

### Example

`pseudo-loc.rb` pseudo-localizes the json files you pass to it. It puts the generated files in a folder called `pseudo`.

```
$ cd ~/project/source/locales/en

$ pseudo-loc.rb filename1.json filename2.json 

$ ls -R
filename1.json 
filename2.json 
pseudo

./pseudo:
filename1.json 
filename2.json 

```

## Sample Pseudo-localization

### Source Content

```json
{
  "title": "Woops!",
  "message": "Something went wrong.  Try again later."
}
```

### Pseudo-localized 

```json
{
  "title": "«__Woops!__»",
  "message": "«____________Something went wrong.  Try again later.____________»"
}
```

