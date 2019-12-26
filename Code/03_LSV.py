### VCF file with all accessions
### ArrayLSV relates to columns in VCF which correspond to all accessions within a given crop type.
### Produces a list of fixed varients (snp and indel) unique to a lineage, in this case crop type.

import sys
import os
import time
import subprocess
import fileinput
dir = os.getcwd()


ArrayLSV=[10,13,14,24,28,32]
for i in ArrayLSV:
	print i

x = []
y = []
C = 0

File1 = sys.argv[1]
for k in fileinput.input(File1):
	if '#' not in k:
		j = k.strip('\n')
                l = j.split('\t')	
		for i in range(0,len(l)):
                 	if int(i + 1) in ArrayLSV:
				x.append(l[i])
			if 
		 
		print 'x'
		if '0/1' not in str(x) and './.' not in str(x):
			print l[0],l[1],x
			y = []
			for i in range(10,32):
				if i not in ArrayLSV:
					y.append(l[i - 1])
