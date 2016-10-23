#!/usr/bin/env bash

# create a local ipfs repo (aka "merkle dag" or "mdag") at ~/.ipfs
ipfs init
    ## Example Output
    # initializing ipfs node at /root/.ipfs
    # generating 2048-bit RSA keypair...done
    # peer identity: QmQwwGGiiKpAobhjfr3qtr4RKfLf6A25VVyBR9zyaarEhX
    # to get started, enter:
    #
    #       ipfs cat /ipfs/QmYwAPJzv5CZsnA625s3Xf2nemtYgPpHdWEz79ojWnPbdG/readme

## Two equivalent ways to access a sample file via hash
ipfs cat /ipfs/QmYwAPJzv5CZsnA625s3Xf2nemtYgPpHdWEz79ojWnPbdG/readme
ipfs cat QmYwAPJzv5CZsnA625s3Xf2nemtYgPpHdWEz79ojWnPbdG/readme

# print some stats of the initialized repo
ipfs repo stat
    ## Example Output
    # NumObjects       15           # this is equal to "ipfs refs local | wc -l"
    # RepoSize         342637       # the CumulativeSize of the whole repo
    # RepoPath         /root/.ipfs  # the path to this repo
    # Version          fs-repo@4    # the

# get the ID of you peer from the config
ipfs config show | grep PeerID

# get a list of all local mdag nodes (only hashes)
ipfs refs local