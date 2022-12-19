#!/bin/bash -ex

h_dim=256
in_dim=$((43 + 12))
pool=max
out_pool=max
nblock=3
ncell="1024"
nsubset=2000
co_factor=5

seed="823"
lr=0.0001
wts_decay=0.001
batch_size=200
n_epochs=100
log_dir=../../Data/GSE158055/exp/refined
log_interval=1
save_interval=1
patience=5

bin_file=../../train.py
gpu=$1


CUDA_VISIBLE_DEVICES=${gpu} python ${bin_file} \
  --refine \
  --cell_counts ../../Data/GSE158055/counts_marked.npz \
  --cell_annotation ../../Data/GSE158055/GSE158055_cell_annotation.csv \
  --sample_metadata ../../Data/GSE158055/GSE158055_sample_metadata.tsv \
  --in_dim ${in_dim} \
  --h_dim ${h_dim} \
  --pool ${pool} \
  --out_pool ${out_pool} \
  --nblock ${nblock} \
  --ncell ${ncell} \
  --nsubset ${nsubset} \
  --co_factor ${co_factor} \
  --lr ${lr} \
  --wts_decay ${wts_decay} \
  --generate_valid \
  --shuffle \
  --batch_size ${batch_size} \
  --n_epochs ${n_epochs} \
  --log_dir ${log_dir}_${ncell}_${nblock}_${seed} \
  --log_interval ${log_interval} \
  --save_interval ${save_interval} \
  --patience ${patience} \
  --seed ${seed}

exit
