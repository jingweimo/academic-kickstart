---
title: "Deep Object Detectors for Detecting Weeds for Precision Weed Control"
authors: 
- A. Rahman
- Y. Lu
- H. Wang
date: "2022-09-24"
doi: "https://doi.org/10.1016/j.atech.2022.100126"

# Schedule page publish date (NOT publication's date).
publishDate: "2021-09-24T00:00:00Z"

# Publication type.
# Legend: 0 = Uncategorized; 1 = Conference paper; 2 = Journal article;
# 3 = Preprint / Working Paper; 4 = Report; 5 = Book; 6 = Book section;
# 7 = Thesis; 8 = Patent
publication_types: ["1"]

# Publication name and optional abbreviated publication name.
publication: "Smart Agricultural Technology 100126"

# abstract: Alternative non-chemical or chemical-reduced weed control tactics are critical for future integrated weed management, especially for herbicide-resistant weeds. Through weed detection and localization, machine vision technology has the potential to enable site- and species-specific treatments targeting individual weed plants. However, due to unstructured field circumstances and the large biological variability of weeds, robust and accurate weed detection remains a challenging endeavor. Deep learning (DL) algorithms, powered by large-scale image data, promise to achieve the weed detection performance required for precision weeding. In this study, a three-class weed dataset with bounding box annotations was curated, consisting of 848 color images collected in cotton fields under variable field conditions. A set of 13 weed detection models were built using DL-based onestage and two-stage object detectors, including YOLOv5, RetinaNet, EfficientDet, Fast RCNN and Faster RCNN, by transferring pretrained the object detection models to the weed dataset. RetinaNet (R101-FPN), despite its longer inference time, achieved the highest overall detection accuracy with a mean average precision (mAP@0.50) of 79.98%. YOLOv5n showed the potential for real-time deployment in resource-constraint devices because of the smallest number of model parameters (1.8 million) and the fastest inference (17 ms on the Google Colab) while achieving comparable detection accuracy (76.58% mAP@0.50). Data augmentation through geometric and color transformations could improve the accuracy of the weed detection models by a maximum of 4.2%. The software programs and the weed dataset used in this study are made publicly available (https://github.com/abdurrahman1828/DNNs-for-Weed-Detections; www.kaggle.com/yuzhenlu/cottonweeddet3).

# links:
url_pdf: https://www.sciencedirect.com/science/article/pii/S2772375522000910
url_dataset: www.kaggle.com/yuzhenlu/cottonweeddet3
url_code: https://github.com/abdurrahman1828/DNNs-for-Weed-Detections

---
