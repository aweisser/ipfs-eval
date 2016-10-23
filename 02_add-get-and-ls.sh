#!/usr/bin/env bash

## create a folder structure with sample content
mkdir -p test1/sub1
echo "Hello IPFS" >> test1/hello.txt
echo "Another content" >> test1/sub1/file1.txt

ipfs init           ## create a local ipfs repo (aka "merkle dag" or "mdag") at ~/.ipfs
ipfs add -r test1   ## add the test1 folder recursively to the created mdag
ipfs repo gc        ## run garbage collector on local mdag. This removes unpinned files.
ipfs refs local     ## list all local mdag nodes (hashes)

## materialize the whole mdag to the current directory
for ref in $(ipfs refs local); do ipfs get $ref; done

## Note the the name of the top level directories can't be derived from the mdag.

## You can also apply ls on all local top level nodes.
## If a node is a "tree" (this is something like a directory) the named sub objects
for ref in $(ipfs refs local); do echo "$ref -> $(ipfs ls $ref)"; done