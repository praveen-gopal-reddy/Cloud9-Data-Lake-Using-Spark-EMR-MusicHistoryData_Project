#!/bin/bash

#after creating emr cluster assign clusterid and run the script. it will terminate emr cluster
clusterid=j-369B43V4PS2A

aws emr modify-cluster-attributes --cluster-id $clusterid --no-termination-protected
aws emr terminate-clusters --cluster-ids $clusterid