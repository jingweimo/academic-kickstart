---
title: "Hyperspectral Imaging Combined with Machine Learning for the Detection of Fusiform Rust Disease Incidence in Loblolly Pine Seedlings"
authors: 
- P. Pandey
- K.G. Payn 
- Y. Lu 
- A.J. Heine 
- T.D. Walker
- J.J. Acosta
- S. Young

date: "2021-09-09"
doi: "10.3390/rs13183595"

# Schedule page publish date (NOT publication's date).
publishDate: "2020-09-09T00:00:00Z"

# Publication type.
# Legend: 0 = Uncategorized; 1 = Conference paper; 2 = Journal article;
# 3 = Preprint / Working Paper; 4 = Report; 5 = Book; 6 = Book section;
# 7 = Thesis; 8 = Patent
publication_types: ["2"]

# Publication name and optional abbreviated publication name.
publication: "*Remote Sensing 13(18), 3595*"

abstract: Loblolly pine is an economically important timber species in the United States, with almost 1 billion seedlings produced annually. The most significant disease affecting this species is fusiform rust, caused by Cronartium quercuum f. sp. fusiforme. Testing for disease resistance in the greenhouse involves artificial inoculation of seedlings followed by visual inspection for disease incidence. An automated, high-throughput phenotyping method could improve both the efficiency and accuracy of the disease screening process. This study investigates the use of hyperspectral imaging for the detection of diseased seedlings. A nursery trial comprising families with known in-field rust resistance data was conducted, and the seedlings were artificially inoculated with fungal spores. Hyperspectral images in the visible and near-infrared region (400–1000 nm) were collected six months after inoculation. The disease incidence was scored with traditional methods based on the presence or absence of visible stem galls. The seedlings were segmented from the background by thresholding normalized difference vegetation index (NDVI) images, and the delineation of individual seedlings was achieved through object detection using the Faster RCNN model. Plant parts were subsequently segmented using the DeepLabv3+ model. The trained DeepLabv3+ model for semantic segmentation achieved a pixel accuracy of 0.76 and a mean Intersection over Union (mIoU) of 0.62. Crown pixels were segmented using geometric features. Support vector machine discrimination models were built for classifying the plants into diseased and non-diseased classes based on spectral data, and balanced accuracy values were calculated for the comparison of model performance. Averaged spectra from the whole plant (balanced accuracy = 61%), the crown (61%), the top half of the stem (77%), and the bottom half of the stem (62%) were used. A classification model built using the spectral data from the top half of the stem was found to be the most accurate, and resulted in an area under the receiver operating characteristic curve (AUC) of 0.83.
# links:
url_pdf: https://www.mdpi.com/2072-4292/13/18/3595
---
