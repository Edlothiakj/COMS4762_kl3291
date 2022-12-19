from scipy import sparse
import pandas as pd

gene_names = pd.Index(pd.read_csv('Data/GSE158055/genes1196.tsv', header=None)[0])
marker_names = list(pd.read_csv('Data/GSE15805/marker.csv').columns)
# marker_names = list(pd.read_csv('Data/CytoSet/AML/marker.csv').columns)
marker_idx = [gene_names.get_loc(name) for name in marker_names]
print(marker_idx)

counts1196 = sparse.load_npz('Data/GSE158055/counts_sub1196.npz')
print('Loaded counts', counts1196.shape)
counts = counts1196[marker_idx, :]
print('Store counts trimmed to', counts.shape)
sparse.save_npz('Data/GSE158055/counts_marked.npz', counts)
# sparse.save_npz('Data/GSE158055/counts_marked_default.npz', counts)
