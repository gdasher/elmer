#!/bin/bash
set -e

/usr/bin/mpiexec \
  -mca orte_keep_fqdn_hostnames true \
  --hostfile /kube-openmpi/generated/hostfile \
  -n 4 -npernode 1 /usr/local/bin/ElmerSolver_mpi

gsutil cp -r /physics/output gs://gcp-security-dev-curriculum-data/$(TZ='America/Los_Angeles' date +%Y-%m-%d-%H-%M-%S)

