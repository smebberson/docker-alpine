#!/usr/bin/env sh

# This is a simple and portable (POSIX) shell script

VERSION=""
IMAGE=""
COMMENT=""

# output information about how to use this script
usage()
{
    echo ""
    echo "Use this to tag this image to a specific version."
    echo ""
    echo "./tag -v [version] -c [\"Comment\"]"
    echo ""
    echo "\t-h --help"
    echo "\t-i [image] The image to tag, i.e. alpine-base"
    echo "\t-v [version] The version to append to the tag create '[alpine-base][-v][1.0.0]'"
    echo "\t-c \"[comment]\" The comment to annotate the tag with"
    echo ""
    echo ""
}

if [ "$1" = "--help" ]; then
    usage
    exit
fi

while getopts "hi:v:c:" OPTION
do
    case $OPTION in
        h)
            usage
            exit
            ;;

        i)
            IMAGE=$OPTARG
            ;;

        v)
            VERSION=$OPTARG
            ;;

        c)
            COMMENT=$OPTARG
            ;;

        ?)
            usage
            exit 1
            ;;
    esac
done

TAG="$IMAGE-v$VERSION"

if test "$IMAGE" != "" && test "$VERSION" != "" && test "$COMMENT" != ""; then
    git tag -a "$TAG" -m \""$COMMENT"\"
    git push origin "$TAG"
    exit
fi

# if the version wasnt set, output the help
usage
exit 1;
