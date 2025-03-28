#!/bin/bash

# Programı derle
mpicc -fopenmp parallel_compute.c -o parallel_compute

# MPI hostfile oluştur
echo "node1 slots=1" > hostfile
echo "node2 slots=1" >> hostfile
echo "node3 slots=1" >> hostfile

# Programı çalıştır
mpirun -hostfile hostfile -np 3 ./parallel_compute 