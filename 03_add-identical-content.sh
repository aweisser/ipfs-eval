#!/usr/bin/env bash

# add two equivalent contents to different paths and files.
mkdir test2
echo "Hello IPFS" >> test2/hello1.txt
echo "Hello IPFS" >> test2/hello2.txt

ipfs init           ## create a local ipfs repo (aka "merkle dag" or "mdag") at ~/.ipfs
ipfs add -r test2   ## put the test content to the generated mdag
    ## example output
    # added QmUVTKsrYJpaxUT7dr9FpKq6AoKHhEM7eG1ZHGL56haKLG test2/hello1.txt
    # added QmUVTKsrYJpaxUT7dr9FpKq6AoKHhEM7eG1ZHGL56haKLG test2/hello2.txt
    # added QmbRKzPCbmkozvAWtwErsjut4ZAq5ioJBSPVWdgPk7WGd2 test2

## Notice that the hashes of the two objects hello1.txt and hello2.txt are completely identical.
## A mdag node is all about the content. So the names of the files where the content initially comes from does not matter.
## The file names are the "content" of the node that reflects the "test2" directory.
## This node is a tree node that holds a map of names to hashes.

