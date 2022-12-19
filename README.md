This codebase contains a PyTorch model multi-cell CoVID-19 classifier, and code for training and testing.
Several pre-trained models are also available under `Data/GSE158055/exp`.

You need to install pip dependencies in `requirements.txt` before working with this project.

To reproduce test results from evaluation, change to one of the models directory then run
```
$ python ../../../../test.py --model best_model.pt --config_file config.json --test_pkl test_result.pkt
```

To train a new model from GSE158055 dataset
* Download processed files `counts_marked.npz`, `GSE158055_cell_annotation.csv.gz` (decompress it) and `GSE158055_sample_metadata.tsv`
from [google drive](https://drive.google.com/drive/u/1/folders/1cPf6JRAT6E2hiaOaFTOcizFAP47q-dkl),
put them under `Data/GSE158055` directory
* Change to `scripts/train` directory
* Run `train_GSE158055.sh` or `train_GSE158055_refined.sh` for training baseline and refined model respectively
    * Provide CUDA device ID (e.g. `0`) as scripts' command line argument
    * Change `seed` variable according to your preference in script files

This codebase is based on CytoSet's GitHub repository. 
Several auxiliary boilerplate like `utils.py` and `test.py` are reused.
We heavily modified `train.py`, in order to support our data format and attach cell type information into the input features.
We also write training scripts according to it.
Several notebooks for plotting is also included in project directory.

----

The original CytoSet README is moved to `README-CytoSet.md`.
