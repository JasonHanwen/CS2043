#! /bin/bash
FileName = "$2"

if [ ! -f $FileName ]; then
    echo "the file does not exist"
    exit 64
fi
# a good tutorial for sed http://www.grymoire.com/Unix/Sed.html
#use sed to replace the body of the html
BODY=$(echo "$BODY" | sed -E 's/^#{1}([^#].*)/# \1/g')
BODY=$(echo "$BODY" | sed -E 's/^#{1}[[:space:]]+(.*)/<h1>\1<\/h1>/g') # Placeholder value, replace with your solution.
BODY=$(echo "$BODY" | sed -E 's/^#{2}([^#].*)/# \1/g')
BODY=$(echo "$BODY" | sed -E 's/^#{1}[[:space:]]+(.*)/<h2>\1<\/h2>/g') # Placeholder value, replace with your solution.
BODY=$(echo "$BODY" | sed -E 's/^#{3}([^#].*)/# \1/g')
BODY=$(echo "$BODY" | sed -E 's/^#{1}[[:space:]]+(.*)/<h3>\1<\/h3>/g') # Placeholde


START='<!DOCTYPE HTML>
<html>
    <head>
        <title>Ye Olde Marble Shoppe</title>
        <meta charset="utf-8" />
        <link rel="stylesheet" type="text/css" href="style.css" />
    </head>
    <body>
        <div class="container">
'
END='
        </div>
    </body>
</html>'

# Generate the html page for you.
echo "$START$BODY$END" > index.html
echo "Converted $1 into index.html!"
