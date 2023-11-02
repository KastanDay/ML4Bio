#!/bin/bash

# Input file
input_file=$1

# Run RSEM
rsem-calculate-expression --paired-end $input_file /path/to/reference /path/to/output