## important slurms commands



### SINFO

```

sinfo

sinfo -Nel

sinfo -a "%P %D %N %G"

sinfo -h -N $partition $hostlist $statelist -O "NodeList,Partition,CPUs,Memory,Gres,GresUsed"


```

### squeue

```
squeue
```

### saccount

```
sacct
```


### jobs

```
scancel #####
```